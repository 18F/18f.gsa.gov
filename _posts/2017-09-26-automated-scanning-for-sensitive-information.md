---
title: "Automated scanning for sensitive information in the development lifecycle"
date: 2017-09-26
authors:
- adam-kendall
tags:
- open source
- security
- devops
- how we work
- tools you can use
- technical guides
excerpt: "Often when developing open source software, and especially software that relies on outside services, you’ll find that you have to manage sensitive information. While there are a large number of things that can be considered sensitive, open source developers often deal with sensitive items such as API tokens, passwords, and private keys that are required for the system to function. Here's how we approached keeping this information safe."
---

Often when developing open source software, and especially software that relies on outside services, you’ll find that you have to manage sensitive information. While there are a large number of things that can be considered sensitive, open source developers often deal with sensitive items such as API tokens, passwords, and private keys that are required for the system to function. In addition, there may be other things to consider private, especially when dealing with infrastructure as code, such as IP addresses.

## Why is sensitive information a challenge?

Committing sensitive information to your open source version control system can have a devastating effect on the organization. Bad actors can use the information to compromise system components, insert rogue or destroy valid data, or even create new systems on your behalf in the cloud. This cannot only ruin public confidence, but also has a large financial impact, requiring investigation and incident remediation.

Best practices call for storing sensitive information elsewhere, in a more secure manner. There are many tools on the market to do that, but you will also want to prevent that information from making its way into your public codebase.

## How did we solve this problem for ourselves?
Since 18F relies heavily on using git and GitHub for version control, we needed a system that integrates easily with git and would not hinder developer productivity.

We started our research with a set of requirements that would be ideal to meet our needs:
- It had to be automated
- Work with both the command line and GitHub Desktop
- Rules could be written and updated separately and had some flexibility for false positives
- Worked on both MacOS and Linux
- Had no other installation dependencies
- Easily tested
- Open source

After an evaluation period with several tools, we decided to go with [git-seekret]. [git-seekret] is a cross-platform, open source, [Golang] application through a pre-commit [git hook], that can inspect the files that are staged for the commit and if there is anything found in either the files or the commit message that matches any of the enabled rules it will prevent that commit from making its way into your repository. It also can scan existing commits and notify you of any sensitive information that has already made its way into your repository.

### How does git-seekret work?
Once installed, git-seekret can be called as a sub-command of git much like `git clone`, or `git branch`. For example, you may want to look at the rules that are installed for you automatically, like so:

```sh
git seekret rules
```
And you should see something similar as this list:
```
List of rules:
  [x] aws.secret_access_key
  [x] aws.access_key_id
  [x] aws.account_id
```

You can also scan an existing git repository for sensitive information that matches the rules

```sh
git seekret check -c 0
```

### The power of automation

The real power to `git-seekret` is the pre-commit hook. This hook will run through the rules for you automatically when you try to commit changes to your code. If it finds anything that violates your rules, it will prevent that commit from happening, keeping it out of your repository and the revision history.

As an example, we may be writing some code that interacts with Amazon Web Services through the API. We'll need to give our application both an access key and secret. Since we're using YAML for other parts of the configuration, we've decided to use it as well for providing these credentials.

So we have a new file called `aws-creds.yml` for the configuration that looks like:
```yaml
---
AWS_ACCESS_KEY_ID: AKXXXXXXXXXXXXXXXXXX
AWS_SECRET_ACCESS_KEY: e_qeNF3Mpwo7ud1hqm!n5)ecxnTJ2ZKoG0z*2b^r
```

And now we stage it for addition to our repository:
```sh
git add aws-creds.yml
```

We can then verify that it will be part of the next commit:
```sh
git status

On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  new file:   aws-creds.yml
```

Now we'll finally commit it:
```sh
git commit -m 'Adding new AWS credentials'
{% raw %}
Found Secrets: 2
  aws-creds.yml:3
    - Metadata:
      status: {staged {%!s(bool=false)}}
    - Rule:
      aws.secret_access_key
    - Content:
      AWS_SECRET_ACCESS_KEY: fqhl4EDajovdNsSVV3Zu0F/oi9RZF5qvEt6h7bfU
  aws-creds.yml:2
    - Metadata:
      status: {staged {%!s(bool=false)}}
    - Rule:
      aws.access_key_id
    - Content:
      AWS_ACCESS_KEY_ID: AKXXXXXXXXXXXXXXXXXX
commit cannot proceed
```
{% endraw %}
So we've been denied the ability to commit. We have some great feedback into what the root cause of being denied was, from the filename, to the line number where the violation occurred, and what rule it matched. This is now a good time to refactor and rethink our approach in a more secure manner to protect this sensitive information.

## Using it yourself
We have wrapped the installation of the software into a fully automated installation script. The script will install git hooks globally into `$HOME/.git-support/hooks`. If you have any pre-existing hooks that you wish to keep, it is recommended to save them into a separate directory and to copy those hooks into `$HOME/.git-support/hooks` after [git-seekret] is installed.

To install, from your terminal, you want to copy and paste the following:

```sh
curl -s https://raw.githubusercontent.com/18F/laptop/master/seekrets-install | bash -
```

This installation script will also download and enable the rules that 18F developers use currently, and can also be run again in the future to get any updates to both [git-seekret] and the ruleset.

If you want to get involved or have any feedback, please [open an issue in GitHub]. You can also drop into our [Open Source public Slack channel] to ask questions.

[git-seekret]: https://github.com/18F/git-seekret
[Golang]: https://golang.org
[git hook]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
[open an issue in GitHub]: https://github.com/18F/git-seekret/issues/new
[Open Source public Slack channel]: https://chat.18f.gov


