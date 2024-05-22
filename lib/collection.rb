# Abstract class for managing collections (e.g. Posts, Authors)
class Collection
  def self.find_by(slug: )
    return nil unless all_slugs.detect { |file_slug| file_slug == slug }
    new(slug)
  end

  def self.find_by!(slug: )
    maybe_record = find_by(slug: slug)
    if maybe_record.nil?
      raise RuntimeError, "No #{self.name} record found for \"#{slug}\""
    end
    maybe_record
  end

  # We use files directly because Jekyll collections only make `published`
  # files available in the data.
  def self.files_dir=(dir)
    @files_dir = dir
  end

  def self.files_dir
    @files_dir ||= "_#{self.name.downcase}s"
  end

  def self.files(ext: "*.md")
    Dir.glob(File.join(self.files_dir, ext))
  end
end
