require 'pry'
require 'rb-readline'

images = 'assets/img'
image_directory = Dir[File.join(images, '**', '*')]
new_file = File.open("remove_these_images.yml", "w")
stripped_image_directory = image_directory.map do |image|
  puts "checking #{image}..."
  output = `grep -r "#{image}" _site`
  if output.empty? || !output
    puts "added #{image} to the mix"
    new_file << "#{image}\n"
  end
  puts '==========='
end
new_file.close
