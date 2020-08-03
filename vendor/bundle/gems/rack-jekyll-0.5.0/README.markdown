Rack-Jekyll
===========

Transform your [Jekyll](https://jekyllrb.com/) app
into a [Rack](https://github.com/rack/rack) application.

- You can run it with rackup, [shotgun](https://github.com/rtomayko/shotgun),
  [unicorn](http://unicorn.bogomips.org/), and more.
- You can run Rack-Jekyll with any modified Jekyll.
- You can deploy Rack-Jekyll to Heroku, EC2, Rackspace,
  dedicated servers, VPS, etc.


## How to use it

A `config.ru` file is required in order to run with shotgun and rackup.
You can even deploy your Jekyll app to [Heroku](https://www.heroku.com/)!

Copy this into `config.ru` in your Jekyll site's root directory:

``` ruby
require "rack/jekyll"

run Rack::Jekyll.new
```

That's it.

Heroku provides a read-only filesystem, so you need to generate pages
and git-commit them *before* you deploy your Jekyll site to Heroku.

 1. `cd` to your Jekyll directory
 2. add a `config.ru` file (see example above)
 3. build pages with `jekyll build`
 4. add `gem "rack-jekyll"` to your `Gemfile`
 5. `git init && git add .`
 6. `git commit -m "Initial commit"`
 7. `heroku create`
 8. `git push heroku master`


## Configuration

Jekyll configuration options can be specified in a `_config.yml` file
or as Rack-Jekyll initialization options in `config.ru`.

Example:

``` ruby
run Rack::Jekyll.new(:destination => "mysite")
```

This will set a custom destination path, overriding the default (`_site`)
and settings from a config file.

See [Jekyll's configuration docs](https://jekyllrb.com/docs/configuration/)
for more settings.

Additional Rack-Jekyll initialization options:

    :config        - use given config file (default: "_config.yml")
    :force_build   - whether to always generate the site at startup, even
                     when the destination path is not empty (default: false)
    :auto          - whether to watch for changes and rebuild (default: false)
    :wait_page     - a page to display while pages are rendering

Note that on read-only filesystems a site build will fail,
so do not set `:force_build => true` in these cases.


## 404 page

In your site's root directory you can provide a custom `404.html` file
with YAML front matter.


## Wait page

You can create a custom HTML page to display while Jekyll is rendering the
site.  Set the `:wait_page` initialization option to point to a file relative
to the root of your Jekyll project.

*Example:*

    run Rack::Jekyll.new(:wait_page => "hold_on.html")

Note that this page should be self-contained (no links to external CSS
or JS).  It is also not a bad idea to add a `<meta http-equiv="refresh"
content="60"/>` to the `head` section so that the page will periodically
refresh itself and display the site once Jekyll has finished rendering.


## Contributing

Contributions are more than just welcome.
Fork this repo and create a new branch, then submit a pull request.


## Contributors

* adaoraul (Adão Raul)
* Nerian (Gonzalo Rodríguez-Baltanás Díaz)
* scottwater (Scott Watermasysk)
* thedjinn (Emil Loer)
* bry4n (Bryan Goines)
* thibaudgg (Thibaud Guillaume-Gentil)
* bemurphy (Brendon Murphy)
* imajes (James Cox)
* mattr- (Matt Rogers)
* stomar (Marcus Stollsteimer)
