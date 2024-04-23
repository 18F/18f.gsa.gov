=begin

Determines which files to check with pa11y-ci per pull request.

The current scope of pa11y testing is as follows:

- Check any posts or pages whose content has changed.
- Check any posts or pages using changed layouts.
- If stylesheets have changed, check a sample of all page types:
    - Three posts of each layout in _config.yml's `defaults`
    - The first, last, and middle blog archive pages (/blog/page/:num)

Previously, checking every page resulted in excessive CI runtimes.

=end

# Wraps Jekyll documents with convenience methods.
#
# @param path [String] The relative path of the source file, usually a
#    Markdown file (.md)
# @param layout [String] The name of the Jekyll document's layout
# @param differ [Object, #changed_files] The collaborator which lists
#   the files that were changed in the last commit.
# @todo Are there cases when the document being checked has no layout?
Document = Struct.new(:path, :layout, :differ) do
  # @return [Boolean] Whether to scan this document in pa11y-ci
  def to_scan?
    source_changed? || layout_changed?
  end

  def source_changed?
    changed_files.include?(path)
  end

  def layout_changed?
    changed_files.include?("_layouts/#{layout}.html")
  end

  # Memoize these without having to memoize in the differ
  def changed_files
    @changed_files ||= differ.changed_files
  end
end

class Differ
  # @return [Array<String>] List of relative paths of files
  def self.changed_files
    @changed_files ||= %x[ #{list_files_command} ].to_s.split("\n").map(&:strip)
  end

  # @return [String] Text of a shell command to get listed files
  def self.list_files_command
    "git ls-files --modified"
  end
end

# Gets the list of files changed in the last commit
class CommitDiffer < Differ
  def self.list_files_command
    "git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD)"
  end
end

# Jekyll::Document#destination requires a root path parameter
# This constant replaces a mysterious empty string when
# calling #destination.
NO_ROOT_PATH = "".freeze
PA11Y_TARGET_FILE = ENV.fetch('PA11Y_TARGET_FILE') { 'pa11y_targets' }
DIFFER = ENV.fetch("CI", false) ? CommitDiffer : Differ

# Outputs posts and pages to scan to a file.
# @todo Implement the stylesheet checker (third bullet above)
Jekyll::Hooks.register :documents, :post_render do |doc|
  document = Document.new(
    doc.relative_path,
    doc.data["layout"],
    DIFFER
  )
  if document.to_scan?
    File.open(PA11Y_TARGET_FILE, 'a') { |f|
      f.write(doc.destination(NO_ROOT_PATH) + "\n")
    }
  end
end

# Produces a sample set of pages needed for a site-wide pa11y test.
class SiteSampler

  attr_reader :config, :site_files, :permalinks

  def initialize(config, site_files=nil, permalinks=nil)
    @config = config
    @site_files = site_files || default_site_files
    @permalinks = permalinks || default_permalinks
  end

  def pages
    folders.flat_map { |folder| sample folder }
  end

  private

  # Samples 3 files from a given folder, and its index
  def sample(folder)
    if ["_site/", "_site/blog/"].include?(folder)
      [ File.join(folder, "index.html") ]
    else
      folder_regex = Regexp.new("^" + folder)
      index_regex = Regexp.new("^" + File.join(folder, "index.html") + "$")
      site_files.select do |file|
        file.match?(folder_regex) || file.match?(index_regex)
      end.sample(3)
    end
  end

  def folders
    permalinks.map do |permalink|
      File.join("_site", parameterless_path(permalink), "/")
    end.uniq.sort
  end

  # Default list of all the files in the site
  def default_site_files
    Dir.glob("_site/**/*").reject { |f| File.directory?(f) }
  end

  # Default list of all the permalink URL templates as given
  # in the config document. These form the basis for the sampled
  # pages later on.
  def default_permalinks
    [
      config["jekyll-archives"]["permalinks"].values,
      config["collections"].map { |_name, data| data["permalink"] },
      config["paginate_path"],
      "blog/"
    ].flatten.uniq
  end

  # Follows the file paths until reaching a :param
  def parameterless_path(path)
    Pathname.new(path).each_filename.take_while { |x| !x.match? "^:" }.join("/")
  end
end


# Changes to files in these directories trigger a global check
# @todo Is there a way to get these more dynamically?
SITEWIDE_FOLDERS = ["assets", "_includes", "_sass"]

# If files have changed in any of the folders that trigger a site-wide scan,
# sample folders across the site and add them to the list of files to check
# with pa11y for a given Pull Request.
# @todo Is there a way to unnest this code? Jekyll hooks don't allow
#   early returns.
Jekyll::Hooks.register :site, :post_render do |site|
  global_files = Regexp.new SITEWIDE_FOLDERS.map { |x| "^#{x}" }.join("|")
  if DIFFER.changed_files.grep(global_files).any?
    File.open(PA11Y_TARGET_FILE, 'a') do |f|
      SiteSampler.new(site.config).pages.each do |path|
        f.write(path + "\n")
      end
    end
  end
end
