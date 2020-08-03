# @author Mike Bland (michael.bland@gsa.gov)

require_relative './sass'
require_relative './tags'

require 'fileutils'
require 'jekyll/static_file'

module JekyllPagesApiSearch
  class Assets
    SOURCE = File.realpath(File.join(File.dirname(__FILE__), '..', '..'))
    JAVASCRIPT_DIR = File.join('assets', 'js')
    BEGIN_PATH = SOURCE.size + File::SEPARATOR.size

    def self.copy_to_site(site)
      asset_paths.each do |file_path|
        site.static_files << ::Jekyll::StaticFile.new(
          site, SOURCE, File.dirname(file_path), File.basename(file_path))
      end
    end

    def self.copy_to_basedir(basedir)
      asset_paths.each do |asset|
        target_path = File.join(basedir, asset)
        target_dir = File.dirname(target_path)
        FileUtils.mkdir_p(target_dir) if !Dir.exist?(target_dir)
        FileUtils.cp(File.join(SOURCE, asset), target_path)
      end
    end

    def self.write_to_files(baseurl, scss, html, js)
      [scss, html, js].each {|i| FileUtils.mkdir_p File.dirname(i)}
      FileUtils.cp Sass::INTERFACE_FILE, scss
      File.open(html, 'w') {|f| f << SearchInterfaceTag::CODE}
      File.open(js, 'w') {|f| f << LoadSearchTag::generate_script(baseurl)}
    end

    private

    def self.asset_paths
      js_pattern = File.join(SOURCE, JAVASCRIPT_DIR, 'search-bundle.js*')
      img_pattern = File.join(SOURCE, 'assets', '{png,svg}', '*')
      all_paths = Dir.glob(js_pattern) + Dir.glob(img_pattern)
      all_paths.map { |path| path[BEGIN_PATH..-1] }
    end
  end
end
