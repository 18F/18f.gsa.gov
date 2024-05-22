require_relative '../lib/author'

Jekyll::Hooks.register :site, :after_init do
  Author.all.each { |author| author.update_published! }
end
