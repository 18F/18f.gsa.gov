# Find this on Github here: https://gist.github.com/gemfarmer/f3f2e35663b96cd3fa8d90b49e6216a0

require 'colorator' # Comment this out to run the script without colorator

built_path = '_site'
directory_name = 'tmp'
unique_path = 'check_images'
image_path = 'assets/img'

if ARGV.include?('-h') || ARGV.include?('--help')
  puts 'Welcome to image_checker'
  puts "\n"
  puts 'Here are a few help flags:'
  puts '  -i, -I, or --image: Change the image path'
  puts '                      This is defaulted to assets/img'
  puts "\n"
  puts '  -b, -B, --built: Change the built project path.'
  puts '                   This is defaulted to _site'
  puts "\n"
  puts '  -d, -D, --dir_temp: Change the data storage path.'
  puts '                      This is defaulted to tmp'
  exit
end

ARGV.map.with_index do |a, index|
  # Flags:
  # The image flag allows you to name the image path directory
  if a == '-i' || a == '-I' || a == '--image'
    image_path = ARGV[index + 1] ? ARGV[index + 1] : image_path
  end

  # Set reference for built project
  if a == '-b' || a == '-B' || a == '--built'
    built_path = ARGV[index + 1] ? ARGV[index + 1] : built_path
  end

  # Set folder where images are stored
  if a == '-d' || a == '-D' || a == '--dir_temp'
    directory_name = ARGV[index + 1] ? ARGV[index + 1] : directory_name
  end
end

full_path = File.join(directory_name, unique_path, image_path)
`mkdir -p #{full_path}` unless File.exist?(full_path)

image_directory = Dir[File.join(image_path, '**', '*')]

removable_images_file = File.join(full_path, 'removable_images.yml')
removable_images = if File.exist?(removable_images_file)
                     File.open(removable_images_file, 'r+')
                   else
                     File.open(removable_images_file, 'w')
                   end
skipped_images_file = File.join(full_path, 'skipped_images.yml')
skipped_images = if File.exist?(skipped_images_file)
                   File.open(skipped_images_file, 'r+')
                 else
                   File.open(skipped_images_file, 'w')
                 end

image_directory.map do |image|
  ignored_items = [] || File.readlines(skipped_images_file)
  ignored_items = if ignored_items.any?
                    ignored_items
                  else
                    File.readlines(skipped_images_file)
                  end

  ignore = ignored_items.map do |m|
    image.include?(m.strip)
  end.include? true

  if !ignore
    # No colorator: comment this out and use the following line instead.
    puts "checking #{image}...".yellow
    # puts "checking #{image}..."

    output = `grep -r "#{image}" #{built_path}`
    if output.empty? || !output
      # No colorator: comment this out and use the following line instead.
      puts "Removeable: #{image}".red
      # puts "Removeable: #{image}"
      removable_images << "#{image}\n"
    else
      skipped_images << "#{image}\n"
    end
  else
    skipped_images << "#{image}\n"
  end
end
# No colorator: comment this out and use the following line instead.
puts 'all checks done!!'.green
# puts 'all checks done!!'

removable_images.close
skipped_images.close
