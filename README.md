18f.gsa.gov
===========
Building the 21st century digital government.


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
5. Create new Pull Request



Licensing
--

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" /></a>
  <br /><br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="http://18f.gsa.gov">
    <span property="dct:title">18F</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">18f.gsa.gov</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="US" about="http://18f.gsa.gov">
  United States</span>.
</p>
