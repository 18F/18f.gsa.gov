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

# Changes to files in these directories trigger a global check
# @todo Is there a way to grab these more dynamically?
SITEWIDE_FOLDERS = ["_includes", "_sass"]

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

# Collects
# @todo This is first-draft working code, I don't feel settled about
#   the design.
class PageCollector

  attr_accessor :config

  def initialize(config)
    @config = config
  end

  def pages
    sampled_collection_paths + sampled_blog_archive_paths
  end

  # Sample 3 files from each collection
  def sampled_collection_paths
    collection_paths.map { |path| sample_folder(path) }.flatten.uniq
  end

  def sample_folder(path)
    Dir.glob("_site" + path + "/**/*")
      .reject { |f| File.directory?(f) }
      .sample(3)
  end

  # All of the paths to collections in the site config
  # @todo The /styleguide collection can probably be deleted
  def collection_paths
    paths = config["collections"].each_pair.map do |name, data|
      # Get the folder path from the permalink
      data.fetch("permalink").split("/").first(2).join("/")
    end
    paths.delete("/:path")
    paths.delete("/styleguide")
    paths.uniq
  end

  # Sample first, last, and random middle page of blog archive
  # @smell Mutating AND a while loop? At the same time??
  def sampled_blog_archive_paths
    get_integer(blog_pages.last) / 2
    [blog_pages.first, blog_pages.last, middle_blog_archive_page]
  end

  def middle_blog_archive_page
    middle_page_num = get_integer(blog_pages.last) / 2
    finder = Regexp.new("/#{middle_page_num}/")
    blog_pages.detect { |x| x.match? finder }
  end

  # Blog archive page paths, sorted by page number (/blog/page/:number)
  def blog_pages
    @blog_pages ||= Dir.glob("_site/blog/page/**/*.html")
      .sort_by { |path| get_integer(path) }
  end

  def get_integer(text)
    text.match(/(\d+)/).captures.first.to_i
  end
end

# If files have changed in any global directories, sample folders
# across the site and add them to the list of files to check with
# pa11y for this PR
# @todo Is there a way to unnest this code? Jekyll hooks don't allow
#   early returns.
Jekyll::Hooks.register :site, :post_render do |site|
  global_files = Regexp.new SITEWIDE_FOLDERS.map { |x| "^#{x}" }.join("|")
  if DIFFER.changed_files.grep(global_files).any?
    File.open(PA11Y_TARGET_FILE, 'a') do |f|
      PageCollector.new(site.config).pages.each do |path|
        f.write(path + "\n")
      end
    end
  end
end
