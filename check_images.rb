# Find this on Github here: https://gist.github.com/gemfarmer/f3f2e35663b96cd3fa8d90b49e6216a0
require 'colorator' # Comment this out to run the script without colorator

built_path = '_site'
directory_name = 'tmp'
unique_path = 'check_images'
image_path = 'assets/img'
use_relative = false
ignore_removable = false
remove_all = false

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
  puts "\n"
  puts '  -r, -R, --use-relative: Use relative path check.'
  puts "\n"
  puts '  --ignore-removable: Don\'t scan files in removable_images.yml.'
  puts "\n"
  puts '  --remove: Remove all files in removable_images.yml.'
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

  # Use relative file path to scan
  use_relative = true if a == '-r' || a == '-R' || a == '--use_relative'

  # Set folder where images are stored
  ignore_removable = true if a == '--ignore-removable'

  # Remove all files in removeable.yml
  remove_all = true if a == '--remove'
end

full_path = File.join(directory_name, unique_path, image_path)
`mkdir -p #{full_path}` unless File.exist?(full_path)

image_directory = Dir[File.join(image_path, '**', '*')]

if remove_all
  removable_images_file = File.join(full_path, 'removable_images.yml')
  lines = File.readlines(removable_images_file)
  lines.each do |line|
    # No colorator: comment this out and use the following line instead.
    puts "deleting #{line.sub("\n", '')}".red
    # puts "deleting #{line.sub("\n", "")}"
    `rm -rf #{line.sub("\n", '')}`
  end
  # No colorator: comment this out and use the following line instead.
  puts 'deleting contents of removable_images.yml'.red
  # puts "deleting contents of removable_images.yml"
  File.open(removable_images_file, 'w').close
else

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
    img_array = image.split('/')
    img_relative = "../#{img_array[1...img_array.length].join('/')}"

    ignored_items = [] || File.readlines(skipped_images_file)
    ignored_items += File.readlines(removable_images_file) if ignore_removable
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
      if use_relative
        puts "checking #{img_relative}...".yellow
        # puts "checking #{image_relative}...".yellow
        output = `grep -r "#{img_relative}" #{built_path}`
      else
        puts "checking #{image}...".yellow
        # puts "checking #{image}...".yellow
        output = `grep -r "#{image}" #{built_path}`
      end
      # puts "checking #{image}..."

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
end
