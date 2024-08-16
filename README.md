# 18F website and blog

The 18F website and blog serve as 18F's primary outreach tool, communicating about 18F's way of working and value proposition to prospective partners, the broader digital services community, and the general public.

## I’d like to make a contribution, how do I update this content?

All team members are encouraged to submit blog posts and suggest website improvements that benefit the organization.

Though this website and blog carry the 18F brand, the intention is to spread the use and cultivation of the material throughout the broader digital services community.

By developing this material in the open, we hope to encourage expert review and contributions from members of the tech community outside of government, furthering our goal of improving how government works through increased civic engagement of tech specialists. We hope this material and the means by which it is developed will attract new recruits to government technology positions, but for those who are not inclined to do so, helping cultivate the guides is a potentially high-visibility, high-impact contribution to government work that doesn’t require a major life change.

The [CODEOWNERS file](.github/CODEOWNERS) keeps track of who is in review & approver roles for content in the guides — if you’re not receiving a timely (within two weeks) review or notice the list is outdated, reach out to 18F’s Outreach coordinator for assistance. These reviewers will be automatically tagged appropriately when opening pull requests. Read [CONTRIBUTING](CONTRIBUTING.md) for more information.

Issues opened in this repo are automatically added to the [18F TLC project board](https://github.com/orgs/18F/projects/41/views/1) for prioritization for 18F staff in between projects to work on.

## Development
The re-platformed sites use 11ty. If you could run Jekyll, you should be able to run 11ty! There are two approaches to working with the guides: [Local installation](#local-installation) and [Codespaces](#codespaces).

Ensure that you have the latest version of [Node](https://nodejs.org/en/download) installed. 

To run the site locally:

1. Clone this repo
2. Add data/assetPaths.json to .git/info/exclude [(See the development docs.)](/docs/development.md)
3. From the repo directory, run:
   ```sh
   npm install
   npm run dev
   ```
4. Open http://localhost:8080

If you styles don't load when you run the local server, stop the server and run it again.

For more information on testing and repo configurations, read our in-depth [development docs](/docs/development.md).

### Codespaces
[Codespaces](https://github.com/features/codespaces) allows you to set up a development environment easily and without dependencies on a local machine.

#### Start a GitHub Codespace
1. From this repo, Click "Code" and then the "Codespaces" tab.
2. Click the "+" icon, agree to the terms.
3. You should then see the repo interface. At the bottom, check the branch you are currently viewing or create a new one.

#### Start the application and preview the site
1. Give this a few minutes to warm up. At first, it will have a message "Welcome to Codespaces."  If you wait a bit, you'll see it recognize the environment and start to install libraries for you.
2. Once it finishes installing the libraries, click on the "terminal" and type ```npm start```. 
3. It will think for 10 - 20 seconds and then you should see a message pop up on the right side that the site is available.  Click "open in the browser.

#### Make changes, preview them
1. Select a file from the file explorer that you want to edit.  Make some changes!  You should be able to refresh the preview tab to see them immediately. If you will be making changes to styles, you will need to restart the server via ```npm run dev``` for those to be reflected.

#### Commit your changes
1. When you’re happy with how things look, switch on the left-hand menu to the "sourcecode" view. It will show you any changes you have made. Click the file name (on the left) to view things you've removed/added to that file.
2. This is a good time to create a new branch if you haven't already started on one!  Click the three dots at the top of that menu, then "Branch" then "Create Branch".  Give it a name like "design-update" or "cool-new-footer" and hit enter.
3. You will need to stage each file that you want to be committed. Once that's done, it's time to commit and push!  You can click "commit" and then "publish" or you can use the arrow to select "commit & push".
4. On the lower right, it will ask you if you want to create a pull request.  If it's too soon, don't click this.  Otherwise, feel free!

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in
[CONTRIBUTING](https://handbook.tts.gsa.gov/contributing/):

> This project is in the public domain within the United States, and copyright
> and related rights in the work worldwide are waived through the
> [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication.
> By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
