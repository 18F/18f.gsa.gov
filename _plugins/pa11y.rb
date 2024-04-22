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
    differ.changed_files.include?(path)
  end

  def layout_changed?
    differ.changed_files.include?("_layouts/#{layout}.html")
  end
end

# Gets the list of files changed in the last commit
# @note Designed as a collaborator object to make Document easier
#   to test
module GitDiffer
  # @return [Array<String>] List of relative paths of files that were
  #   changed in the last commit.
  def self.changed_files
    @changed_files ||= %x[ git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) ]
      .to_s
      .split("\n")
      .map(&:strip)
  end
end

# Outputs posts and pages to scan in file `pa11y_targets`.
# @todo Implement the stylesheet checker (third bullet above)
Jekyll::Hooks.register :documents, :post_render do |doc|
  puts doc.relative_path if doc.relative_path.match?(/css/)
  document = Document.new(
    doc.relative_path,
    doc.data["layout"],
    GitDiffer
  )
  if document.to_scan?
    File.open('pa11y_targets', 'a') { |f| f.write doc.destination("") }
  end
end
