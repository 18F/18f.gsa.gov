## 18f.gsa.gov

[Building the 21st century digital government.](https://18f.gsa.gov/)

### Setup

This is a [Jekyll](http://jekyllrb.com) website. Install Jekyll through Rubygems (you may need `sudo`):

```bash
gem install jekyll
```

Sadly, [for the time being](https://github.com/jekyll/jekyll/issues/2327#issuecomment-55337023) you will also need Node to be installed, because Jekyll 2 couples a CoffeeScript runtime. This will eventually be removed. Install Node through `brew install node` or `apt-get install nodejs`.


### Running the site

Launch with Jekyll:

```bash
jekyll serve
```

The site will be visible at `http://localhost:4000`.


### Tips

* Update your git submodules with `git submodule update --init`
* You can monitor your asset folders and automatically generate compiled versions by running `make watch`.


### Contributing

We work on `devel`, not `master`. Make a feature branch from `devel` and send a pull request to that branch.

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
