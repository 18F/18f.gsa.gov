Jekyll::Hooks.register :site, :after_init do |site|
  # Federalist will set the BRANCH environment variable when it's building a
  # preview deployment. If the branch is nil (unset) or "main", do nothing. But
  # for preview builds, set site.url to nil. If we don't do that, then site.url
  # will be used by the jekyll-redirect-from plugin when it rewrites redirects,
  # which will link AWAY from the preview site and to the production site,
  # making it functionally impossible to preview the redirected page. Further,
  # because the production and preview sites have different site.baseurl values,
  # the redirect will go to a location that does not exist in production, so
  # it'll just cause a 404.
  #
  # We can avoid all that by just emptying the site.url value on preview builds.
  branch = ENV['BRANCH']
  if !(branch.nil? || branch == 'main')
    site.config['url'] = nil
  end
end
