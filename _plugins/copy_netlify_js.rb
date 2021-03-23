require 'fileutils'

netlify_src = './node_modules/netlify-cms/dist/netlify-cms.js'
netlify_dest = './assets/js/netlify-cms.js'

Jekyll::Hooks.register :site, :after_init do
  # code to call after Jekyll renders a page
  FileUtils.cp(netlify_src, netlify_dest)
end
