require 'yaml'

module SiteData
  class AuthorData
    attr_reader :path, :basepath, :published_authors, :site_post_paths, :all_authors, :unpublished_authors

    def initialize(test_path = nil)
      @test_path = test_path
      @basepath = @test_path ? @test_path : Dir.pwd

      @path = File.join(@basepath, '_authors')
      cwd = File.dirname(__FILE__)
      pwd = cwd.split('/')[0...-1].join('/')

      @site_post_paths = Dir.entries(File.join(pwd, '_posts')).select do |f|
        !File.directory? f and f != '.DS_Store'
      end

      @all_authors = Dir.entries(File.join(pwd, '_authors')).select do |f|
        !File.directory? f and f != '.DS_Store'
      end.flatten.uniq

      @published_authors = find_published_authors

      @unpublished_authors = all_authors - published_authors
    end

    def update(author_file, key, value)
      author_path = create_file_path(author_file)
      if File.exist? author_path
        updated_file = update_file(author_path, key, value)
        write_update(author_path, updated_file[:file], key, value) if updated_file[:changed]
      else
        puts "#{author_file} does not exist.".red
      end
    end

    def exists?(name)
      File.exist? "#{@path}/#{name}.md"
    end

    def fetch(name, key)
      YAML.load_file("#{@path}/#{name}.md")[key] if exists? name
    end

    def create_file_path(file)
      path = File.join(@path, file)
      File.extname(path).empty? ? "#{path}.md" : path
    end

    private

    def update_file(author_path, key, value)
      frontmatter = File.read(author_path, encoding: "utf-8")[frontmatter_regex]
      frontmatter_yml = YAML.safe_load(frontmatter)
      if frontmatter_yml[key] != value
        frontmatter_yml[key] = value
        frontmatter_yml = delete_value(frontmatter_yml, key) if value == 'delete'
        frontmatter_new = YAML.dump(frontmatter_yml) << "---\n\n"
        { file: File.read(author_path).gsub(frontmatter, frontmatter_new),
          changed: true }
      else
        { file: frontmatter, changed: false }
      end
    end

    def delete_value(hash, key)
      puts "deleting #{key}".yellow
      hash.delete_if { |k, _v| k == key }
    end

    def write_update(author_path, updated_file, key, value)
      unless updated_file.empty?
        puts "updating #{author_path} to `#{key}: #{value}`".yellow
        File.write(author_path, updated_file)
      end
    end

    def frontmatter_regex
      /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    end

    def find_published_authors
      published_authors = []
      base_path = Dir.pwd
      @site_post_paths.each do |post_path|
        next unless File.exist? File.join(base_path, '_posts', post_path)
        frontmatter = YAML.load_file(File.join(base_path, '_posts', post_path))
        checks = frontmatter['output'] != false && frontmatter['published'] != false
        next unless checks
        authors = frontmatter['authors'].map { |a| "#{a}.md" }
        published_authors << authors
      end
      published_authors.flatten.uniq
    end
  end
end
