## Welcome!

We're so glad you're thinking about contributing to an 18F open source project!
If you're unsure or afraid of anything, just ask or submit the issue or pull
request anyways. The worst that can happen is that you'll be politely asked to
change something. We appreciate any sort of contribution, and don't want a wall
of rules to get in the way of that.

Before contributing, we encourage you to read our CONTRIBUTING policy (you are
here), our LICENSE, and our README, all of which should be in this repository.
If you have any questions, or want to read more about our underlying policies,
you can consult the 18F Open Source Policy GitHub repository at
https://github.com/18f/open-source-policy, or just shoot us an email/official
government letterhead note to [18f@gsa.gov](mailto:18f@gsa.gov).

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

## Starting work on an issue

Issues that are marked with the `ready` label are ripe for the picking!  Simply
assign yourself to the issue to and change its label to `in progress` to
indicate that you are working on it.

If the issue involves writing code or producing some other change that will
result in a pull request, begin by creating yourself a branch with a short
descriptive name of the work that includes the issue number at the end, e.g.,
`document-pr-process-#36`.

**Note:** If you are not a part of the 18F Team, please fork the repository
first and then create a branch for yourself with the same convention.

Once your local branch is created, simply push it remotely and this will
assign the issue to you and move it to be `in progress` automatically.

## Submitting a pull request and completing work

When you are satisfied with your work and ready to submit it to be completed,
please submit a pull request for review.  If you haven't already, please
follow the instructions above and create a branch for yourself first.  Prior
to submitting the pull request, please make note of the following:

1. Code changes should be accompanied by tests.
2. Please run the tests (`$ npm test`) and the linter
  (`$ npm run-script lint`) to make sure there are no regressions.

Once everything is ready to go, [submit your pull request](https://help.github.com/articles/using-pull-requests/)!
When creating a pull request please be sure to reference the issue number it
is associated with, preferably in the title.

If you are working in a branch off of the `18F/jekyll_pages_api_search` repo
directly, you can reference the issue like this:
`Closes #45: Short sentence describing the pull request`

If you are working in a forked copy of the repo, please reference the issue
like this:
`Closes 18F/jekyll_pages_api_search#45: Short sentence describing the pull
request`

In both cases, please include a descriptive summary of the change in the body
of the pull request as that will help greatly in reviewing the change and
understanding what should be taking place inside of it.

By referencing the issue in the pull request as noted above, this will
automatically update the issue with a `needs review` label and notify the
collaborators on the project that something is ready for a review.  One of us
will take a look as soon as we can and initiate the review process, provide
feedback as necessary, and ultimately merge the change.

Once the code is merged, the branch will be deleted and the `in review`
label will be removed.  The issue will be automatically updated again to be
marked as Done and Closed.

## Performing a review of a pull request

If you are performing a review of a pull request please add the `in review`
label to the pull request and be sure keep the `needs review` label
associated with it.  This will help keep our Waffle board up-to-date and
reflect that the pull request is being actively reviewed.  Also, please
assign yourself so others know who the primary reviewer is.

