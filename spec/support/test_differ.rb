# Stand-in for file diffing (GitDiffer), so tests don't rely on
# git history.
class TestDiffer
  attr_reader :changed_files

  def initialize(*paths)
    @changed_files = *paths
  end
end

# @example Use the convenience method
#   TestDiffer("_layouts/default.html", "_posts/2024-04-10-new-post.md")
def TestDiffer(*paths)
  TestDiffer.new(*paths)
end
