# NOTICE: This gem is out of support as of 2019-03-31

## Please use https://github.com/titusfortner/webdrivers instead.

See https://github.com/flavorjones/chromedriver-helper/issues/83 for details.

----

# [chromedriver-helper](http://github.com/flavorjones/chromedriver-helper)

[![Concourse CI](https://ci.nokogiri.org/api/v1/teams/flavorjones/pipelines/chromedriver-helper/jobs/ruby-2.6/badge)](https://ci.nokogiri.org/teams/flavorjones/pipelines/chromedriver-helper)

Easy installation and use of [`chromedriver`](https://sites.google.com/a/chromium.org/chromedriver/), the Chromium project's Selenium webdriver adapter.


# Description

`chromedriver-helper` installs an executable, `chromedriver-helper`, in your gem path, and configures Selenium to invoke it as the web driver.

This script will, if necessary, download the appropriate binary for your platform and install it into `~/.chromedriver-helper`, then exec it. Easy peasy!

Individual projects can even select which version of `chromedriver` they want to run.

Make sure the gem is being required in order to configure the `Selenium::WebDriver::Chrome.driver_path`:

``` ruby
require "chromedriver-helper"
```

Otherwise you may see failures like "unable to connect to chromedriver 127.0.0.1:9515 (Selenium::WebDriver::Error::WebDriverError)" when Selenium runs the wrong executable.


# Usage

## In a Rails project

If you're using Bundler and Capybara in a Rails project, it's as easy as:

``` ruby
# Gemfile
gem "selenium-webdriver"
gem "chromedriver-helper"
```

then, in your spec setup:

``` ruby
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
```


## Standalone

If you're using it standlone just to manage chromedriver binaries,

    # Gemfile
    gem "chromedriver-helper"

Then just run the executable script:

    chromedriver-helper

which will download `chromedriver` if necessary and exec it.


# Configuration

There are some commandline options that can be sent to `chromedriver` as options to `Capybara::Selenium::Driver.new`. The supported options can be discovered by looking at the Selenium source code here:

    https://github.com/SeleniumHQ/selenium/blob/master/rb/lib/selenium/webdriver/chrome/service.rb

As of this writing, the supported options are:

* `log_path`
* `url_base`
* `port_server`
* `whitelisted_ips`
* `verbose`
* `silent`

An example usage would be:

``` ruby
Capybara::Selenium::Driver.new(app, browser: :chrome,
  driver_opts: {
    log_path: '/tmp/chrome.log',
    verbose: true
  })
```


# Updating to latest `chromedriver`

You can always update to the latest version of `chromedriver`:

    chromedriver-update


## Having problems updating?

If for whatever reason you're having problems getting `chromedriver-helper` to update to the latest `chromedriver`, try this:

1. Delete the directory `$HOME/.chromedriver-helper`
2. Run `chromedriver-update`


# Specifying a version

If you want to run a specific version of `chromedriver` in your project, you can set the version in you testing setup like so:

    Chromedriver.set_version "2.24"

Or, from the command line, you can choose a system-wide default:

    chromedriver-update 2.24


# Support

The code lives at [http://github.com/flavorjones/chromedriver-helper](http://github.com/flavorjones/chromedriver-helper). Open a Github Issue, or send a pull request! Thanks! You're the best.


# Known Issues

## `chromedriver-helper` affects other projects on my system

v1.2.0 and earlier installed an executable named `chromedriver`, which may cause confusion for apps on your system that are _not_ using `chromedriver-helper`. v2.0.0 and later do not cause this problem.

The common symptom is an error message that looks like this:

```
Selenium::WebDriver::Error::WebDriverError: unable to connect to chromedriver 127.0.0.1:9515
```

First, confirm that we're talking about the same thing by running:

``` sh
bundle exec ruby -e "system('chromedriver -v')"
```

and making sure you see something like:

```
.../rubygems_integration.rb:462:in `block in replace_bin_path': can't find executable chromedriver for gem chromedriver-helper (Gem::Exception)
```

If you see this message, then **uninstall all versions of `chromedriver-helper` prior to v2.0.0**; and make sure your other projects have updated to v2.0.0 or later.

(You can read more about this issue at https://github.com/flavorjones/chromedriver-helper/issues/57.)


## CentOS 6 and 7

Some versions of `chromedriver` won't run on CentOS 6 and 7 due to the [problems explained here](https://chrome.richardlloyd.org.uk/). The error messages look something like:

```
chromedriver: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.15' not found (required by /home/vagrant/.chromedriver-helper/linux64/chromedriver)
chromedriver: /usr/lib64/libstdc++.so.6: version `CXXABI_1.3.5' not found (required by /home/vagrant/.chromedriver-helper/linux64/chromedriver)
chromedriver: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.14' not found (required by /home/vagrant/.chromedriver-helper/linux64/chromedriver)

```

You can get `chromedriver` to work on these systems by running the `install_chrome.sh` script on the page linked to above, and then making sure your `chromedriver` process has `LD_LIBRARY_PATH` set so that `/opt/google/chrome/lib` is present, e.g.

```
$ LD_LIBRARY_PATH=/opt/google/chrome/lib chromedriver-helper
Starting ChromeDriver 2.28.455506 (18f6627e265f442aeec9b6661a49fe819aeeea1f) on port 9515
Only local connections are allowed.
```

# License

MIT licensed, see LICENSE.txt for full details.


# Credit

The idea for this gem comes from @brianhempel's project `chromedriver-gem` which, despite the name, is not currently published on http://rubygems.org/.

Some improvements on the idea were taken from the installation process for standalone Phusion Passenger.
