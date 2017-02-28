require 'pry'
require 'rb-readline'

directory_name = 'image_check'
Dir.mkdir(directory_name) unless File.exist?(directory_name)
image_path = 'assets/img'
image_directory = Dir[File.join(image_path, '**', '*')]

removable_images = if File.exist?("#{directory_name}/removable_images.yml")
                     File.open("#{directory_name}/removable_images.yml", 'r+')
                   else
                     File.open("#{directory_name}/removable_images.yml", 'w')
                   end
skipped_images = if File.exist?("#{directory_name}/skipped_images.yml")
                   File.open("#{directory_name}/skipped_images.yml", 'r+')
                 else
                   File.open("#{directory_name}/skipped_images.yml", 'w')
                 end

image_directory.map do |image|
  ignored_items = [] || File.readlines("#{directory_name}/skipped_images.yml")
  ignored_items = if ignored_items.any?
                    ignored_items
                  else
                    File.readlines("#{directory_name}/skipped_images.yml")
                  end

  ignore = ignored_items.map do |m|
    image.include?(m.strip)
  end.include? true

  if !ignore
    puts "checking #{image}..."
    output = `grep -r "#{image}" _site`
    if output.empty? || !output
      puts "added #{image} to the mix"
      removable_images << "#{image}\n"
    end
  else
    skipped_images << "#{image}\n"
  end
end
puts '-----------'
puts 'all checks done!!'
removable_images.close
skipped_images.close
