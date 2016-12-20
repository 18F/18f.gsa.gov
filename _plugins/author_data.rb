require 'yaml'

module SiteData
  class AuthorData
    def initialize
      @path = File.join(Dir.pwd, '_authors')
    end

    def update(author_file, key, value)
      author_path = File.join(@path, author_file)
      if File.exist? author_path
        frontmatter = File.read(author_path)[frontmatter_regex]
        frontmatter_yml = YAML.load(frontmatter)
        if frontmatter_yml[key] != value
          update_frontmatter(author_file, key, value, author_path, frontmatter_yml)
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

    private

    def update_frontmatter(author_file, key, value, author_path, frontmatter_yml)
      frontmatter_yml[key] = value
      frontmatter_new = YAML.dump(frontmatter_yml) << "---\n\n"
      updated_file = File.read(author_path).gsub(frontmatter, frontmatter_new)
      puts "updating #{author_file} to `#{key}: #{value}`"
      File.write(author_path, updated_file)
    end

    def frontmatter_regex
      /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    end
  end
end
