chromedriver-helper changelog
==========

2.1.0 - 2018-09-18
----------

Enhancement:

* Use the `LATEST_RELEASE` file to determine the newest version, to avoid downloading the experimental versions the Chrome team is posting recently. [#62](https://github.com/flavorjones/chromedriver-helper/issues/62) (Thanks, @ibrahima!)

Bug fix:

* `lib/chromedriver-helper.rb` explicitly requires `chromedriver/helper` to avoid "uninitialized constant Chromedriver" exception when calling `Chromedriver.set_version` in a default-configured Rails app. [#65](https://github.com/flavorjones/chromedriver-helper/issues/65)


2.0.1 - 2018-09-17
----------

Bug fix:

* Explicitly require 'selenium-webdriver' for projects who don't have the default Rails ordering in their Gemfile. [#60](https://github.com/flavorjones/chromedriver-helper/issues/60) (Thanks, @mattbrictson!)


2.0.0 - 2018-09-15
----------

**Backwards-incompatible change:**

The shadow executable `chromedriver` has been renamed to `chromedriver-helper` to work around issues with projects _not_ using the gem on a system on which the gem is installed. See [#57](https://github.com/flavorjones/chromedriver-helper/issues/57) for details.

Many thanks to Miklós Fazekas (@mfazekas) for both reporting the issue and submitting the fix.



1.2.0 - 2018-02-03
----------

Dependencies:

* Bump dependencies on `nokogiri` and `archive-zip`. (Thanks, @odlp and @ksylvest!)


Bug fixes:

* Use `https` for the URL used to download. [#41] (Thanks, @saraid!)
* Better platform detection, no longer run Windows on unrecognized platforms. [#49] (Thanks, @duncan-bayne!)
* `chromedriver-update` without a version specified will update to the latest version available on the internets. [#47]



1.1.0 - 2017-03-19
----------

Features:

* Allow user to choose what version of chromedriver runs. [#34] (Thanks, @jonny5!)


1.0.0 - 2015-06-06
----------

* Updated gemspec info. Happy 1.0!


0.0.9 - 2015-06-06
----------

* No longer require 'curl' or 'wget', or 'unzip' utilities to be installed. You know, for Windows. (Thanks, @elementc!)
* Support JRuby by removing dependency on native-C-extension gem. (Thanks, Marques Lee!)


0.0.8 - 2015-01-23
----------

* Guaranteeing that we get the *latest* version of chromedriver. (#15) (Thanks, @AlexRiedler!)


0.0.7 - 26 Aug 2014
----------

* Added support for windows binaries. (Thanks, @elementc!)


0.0.6 - 26 Aug 2014
----------

* Fixed to work with new Google download page. #7 (Thanks, @mars!)


0.0.5 - 15 Aug 2012
----------

* Fixed support for JRuby on non-Windows platforms. #4 (Thanks, Tim Olsen!)


0.0.4 - 1 Aug 2012
----------

* Including `chromedriver-update` to easily allow people to force-upgrade. #3


0.0.3 - 20 Mar 2012
----------

* Updated download URL. #2 (Thanks, Alistair Hutchison!)


0.0.2 - 6 December 2011
----------

* Birthday!
