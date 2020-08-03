# Accesslint::Ci

Runs accesslint-cli in CircleCI and comments on GitHub pull requests with new
accessibility issues.

accesslint-ci will crawl a host site and run accessibility assertions on the
pages. If there are any new accessibility issues, accesslint-ci will comment on
the pull request that initiated the build in CircleCI.

[View an example](https://github.com/accesslint/bourbon.io/pull/1)

## Installation

1. Authenticate with GitHub at https://accesslint.com to get an API token.

### Circle CI

1. Set up your CircleCI environment (API tokens for CircleCI and GitHub, artifacts)
1. Install dependencies (nodejs, `accesslint-cli`, `accesslint-ci`)
1. Start a development server
1. Run `accesslint-ci scan <development server e.g. http://localhost:3000>`

In your `circle.yml` file:

```
general:
  artifacts:
    - "tmp/accesslint.log"

machine:
  environment:
    ACCESSLINT_API_TOKEN: <API token from https://accesslint.com>
    ACCESSLINT_GITHUB_USER: <GitHub user authenticated at https://accesslint.com>
  node:
    version: 6.1.0

dependencies:
  override:
    - npm install -g accesslint-cli
    - gem install accesslint-ci

test:
  post:
    - bundle exec rails server -d -p 3000
    - accesslint-ci scan http://localhost:3000
```

### Private Repo Support

AccessLint *does not* support commenting on private repos right now. Follow the
[project backlog](https://github.com/accesslint/accesslint-ci/projects/1) for
plans.

### TravisCI, Jenkins, etc.

AccessLint CI only works in CircleCI right now. See https://github.com/accesslint/accesslint-ci/issues/15

## License

AccessLint CI is Copyright © 2016 thoughtbot, inc. It is free software, and may be
redistributed under the terms specified by the [MIT License](http://opensource.org/licenses/MIT).

## About thoughtbot

![thoughtbot](https://thoughtbot.com/logo.png)

AccessLint is maintained and funded by thoughtbot.

We love open source software!
See [our other projects][community] or
[hire us][hire] to design, develop, and grow your product.

[community]: https://thoughtbot.com/tools?utm_source=github+accesslint
[hire]: https://thoughtbot.com/hire-us?utm_source=github+accesslint
