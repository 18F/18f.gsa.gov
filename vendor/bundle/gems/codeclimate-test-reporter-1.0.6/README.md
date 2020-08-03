# codeclimate-test-reporter

[![Code Climate](https://codeclimate.com/github/codeclimate/ruby-test-reporter/badges/gpa.svg)](https://codeclimate.com/github/codeclimate/ruby-test-reporter)

Posts SimpleCov test coverage data from your Ruby test suite to Code Climate's
hosted, automated code review service.

Code Climate - [https://codeclimate.com](https://codeclimate.com)

## Installation

This gem requires a user, but not necessarily a paid account, on Code Climate,
so if you don't have one the first step is to signup at:
[https://codeclimate.com](https://codeclimate.com). Then follow the
instructions on our [documentation site](https://docs.codeclimate.com/docs/test-coverage-ruby).

Please contact hello@codeclimate.com if you need any assistance setting this up.

## Troubleshooting / FYIs

Across the many different testing frameworks, setups, and environments, there
are lots of variables at play. If you're having any trouble with your test
coverage reporting or the results are confusing, please see our full
documentation here: https://docs.codeclimate.com/docs/setting-up-test-coverage

## Upgrading from pre-1.0 Versions

Version `1.0` of this gem introduced new, breaking changes to the way the
test reporter is meant to be executed. The following list summarizes the major
differences:

See [the changelog entry for v1.0.0](CHANGELOG.md#v100-2016-11-03) for details.

## Contributions

Patches, bug fixes, feature requests, and pull requests are welcome on the
GitHub page for this project:
[https://github.com/codeclimate/ruby-test-reporter](https://github.com/codeclimate/ruby-test-reporter)

When making a pull request, please update the [changelog](CHANGELOG.md).

This gem is maintained by Code Climate (hello@codeclimate.com).

### Release Process

* Update the changelog to mark the unreleased changes as part of the new release.
* Update the version.rb with the new version number
* Make a pull request with those changes
* Merge those changes to master
* Check out and pull down the latest master locally
* `rake release` which will
  * tag the latest commit based on version.rb
  * push to github
  * push to rubygems

## Copyright

See LICENSE.txt

Portions of the implementation were inspired by the coveralls-ruby gem.
