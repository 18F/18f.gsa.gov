require 'yaml'

module SiteData
  class AuthorData
    attr_reader :path, :basepath

    def initialize(test_path=nil)
      @test_path = test_path
      @basepath = @test_path ? @test_path : Dir.pwd
      @path = File.join(@basepath, '_authors')
    end

    def update(author_file, key, value)
      author_path = create_file_path(author_file)
      if File.exist? author_path
        updated_file = update_file(author_path, key, value)

        if updated_file
          write_update(author_path, updated_file, key, value)
        else
          binding.pry
        end
      else
        puts "#{author_file} does not exist."
      end
    end

    def fetch(name, key)
      frontmatter = YAML.load_file("#{@path}/#{name}.md")
      frontmatter[key]
    end

    def exists?(name)
      File.exist? "#{@path}/#{name}.md"
    end

    def create_file_path(file)
      path = File.join(@path, file)
      File.extname(path).empty? ? "#{path}.md" : path
    end

    private

    def update_file(author_path, key, value)
      frontmatter = File.read(author_path)[frontmatter_regex]
      frontmatter_yml = YAML.load(frontmatter)
      if frontmatter_yml[key] != value
        frontmatter_yml[key] = value
        frontmatter_new = YAML.dump(frontmatter_yml) << "---\n\n"
        File.read(author_path).gsub(frontmatter, frontmatter_new)
      else
        frontmatter
      end
    end

    def write_update(author_path, updated_file, key, value)
      puts "updating #{author_path} to `#{key}: #{value}`"
      if !updated_file.empty?
        File.write(author_path, updated_file)
      end
    end

    def frontmatter_regex
      /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    end
  end
end
