# script to add a redirect from /team/:name to /author/:name urls
Dir.foreach('./_authors') do |file|
  if file.to_s != '.' && file.to_s != '..'
    path = "./_authors/#{file}"
    lines = File.readlines(path)
    name = file.slice(0...-3)
    redirected_url = "redirect_from: /team/#{name}"
    already_redirected = lines.include?(redirected_url)
    lines[lines.size - 2] = redirected_url unless already_redirected
    File.open(path, 'w') do |f|
      f.puts lines
    end
  end
end
