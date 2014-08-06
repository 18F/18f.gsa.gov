18f.gsa.gov
===========
Building the 21st century digital government.


**CONTRIBUTORS TAKE NOTE:** We work off the `devel` branch, so be sure to pull that branch and submit your pull request to `devel` not `master`.


Getting Started
--
1. Pull down the repo `git clone git@github.com:18F/18f.gsa.gov.git`
2. From the root of the site, install the necessary git submodules with `git submodule init` and node packages with `npm install`
3. Run `make` to compile your JavaScript and CSS assets.
4. Install an [http-server](https://www.npmjs.org/package/http-server) with `npm install http-server -g` if you don't already have one
5. Launch your web server, eg. `http-server`



Tips
--
- Update your git submodules with `git submodule update --init`
- Monitor your asset folders and automatically generate compiled versions by running `make watch`



Dependencies
--

* [Node package manager](http://howtonode.org/introduction-to-npm)
* A Webserver ([http-server](https://www.npmjs.org/package/http-server), [Apache](http://httpd.apache.org/), [Jekyll](http://jekyllrb.com/), etc.)




Contributing
--
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request (PR to `devel` not `master`)


### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
