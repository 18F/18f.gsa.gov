---
title: "How To Use GitHub and the Terminal: A Guide"
layout: post
author: 
- melody
- boone
tags:
- GitHub
- Tutorial
- How We Work
excerpt: "This is a guide that assumes you have no prior knowledge of GitHub or the command line. We're going to introduce you to both GitHub and using the command line through a guided exercise. Today you'll learn how to make a blog post on the 18F blog."
description: "This is a guide that assumes you have no prior knowledge of GitHub or the command line. We're going to introduce you to both GitHub and using the command line through a guided exercise. Today you'll learn how to make a blog post on the 18F blog."
image:
---

<p class="authors">
  by {% author melody %} and {% author boone %}
</p>

At 18F we hire people from many different backgrounds and each new employee brings a different level of comfort with the specific tools we use on our various projects. The team that runs the 18F website recently started writing down the tools and proccesses that our team uses to update the blog and the code that runs the site. We're sharing that with you today.

Because some of the people we hire never used the terminal, GitHub, or any of the tools we use on our team, this is guide assumes you have no prior knowledge of them. We're going to introduce you to both GitHub and using the command line through a guided exercise. Today you'll learn how to make a blog post on the [18F blog](https://18f.gsa.gov/news/).

Every step will be illustrated with a helpful screenshot or animated gif that shows you exactly what your screen should look like. We'll go through each step in order. At the end of this post, you will know how to:

1. [Turn Your Mac into a Web Development Machine](#turn-your-mac-into-a-web-development-machine)
1. [Get Started with Github and the Terminal](#getting-started-with-github-and-the-terminal)
2. ["Clone" a "Repo" On Your Desktop](#&quot;cloning&quot;-a-&quot;repo&quot;-on-your-computer)
3. [Read what's in your Cloned Directory](#how-to-read-what's-in-your-cloned-directory)
4. [Build the 18F Site](#building-the-18f-site)
6. [Create a Branch](#create-a-branch)
7. [Edit and Post a Blog Post](#edit-and-post-a-blog-post)
8. [Add Front Matter](#adding-front-matter)
9. [Learn how to make a Pull Request](#learn-how-to-make-a-pull-request)

It is worth noting: There are many different ways to do each of these steps. For example, GitHub has an app for Macs, Windows, and Linux you might prefer over the terminal, there are dozens of different text editors, and there are even competitors to GitHub you might prefer. This post is a tutorial meant to prepare people to work with 18F's Website team.

If you have an alternative way of doing any of these steps — or have ways to make this more efficient — please let us know by posting an issue [here](https://github.com/18f/18f.gsa.gov/issues/new). (You don't have to know how to code to post an issue, but you do need a GitHub account.) 

**What you need to get started** [a GitHub account](https://github.com), Mac OS X (we use Yosemite), and [Sublime Text](https://www.sublimetext.com/). These instructions are for primarily for Macs and most of the instructions will work the same on a Linux computer. If you are working on Windows, we suggest checking out [this comment](https://github.com/18F/18f.gsa.gov/issues/542#issuecomment-75145417) that was posted to GitHub that details how to make these instructions work for Windows machines.

## Turn Your Mac Into A Web Development Machine

> Using Linux? You can skip this section.

Our colleague [Moncef Belyamani](https://github.com/monfresh) wrote [a script](https://github.com/18F/laptop) which turns your Mac into a web development machine in about 15 minutes. You will be asked to enter your computer's password three different times during the installation. The terminal doesn't provide any feedback when you type in your password. Just type it in and press `enter.` 

If you'd rather not use the script, you can also [follow the detailed instructions he wrote on his website](http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#step-1). Or follow along with this [video](https://github.com/18F/laptop/wiki/Detailed-installation-instructions-with-video) he prepared with step by step instructions to turn your Mac into a web development machine. To use the script, follow the instructions in text below:

* Activate terminal by pressing command + space and then typing "Terminal" in the search field. 

The terminal icon looks like this: 

![Terminal App](/assets/blog/github-tutorial/terminal.png)

And you should have a window like this when you open it:

![Screen shot of blank terminal window](/assets/blog/github-tutorial/terminal-window.png)

* Go to the terminal and paste the following `curl --remote-name https://raw.githubusercontent.com/18F/laptop/master/mac` and press enter.

* Then paste `bash mac 2>&1 | tee ~/laptop.log && source ~/.rvm/scripts/rvm` and press enter. This sets up all of the software you need in order to manage the languages we use at 18F. (For a full list of programs, click [here](https://github.com/18F/laptop)).

## Getting started with GitHub and the Terminal

> Terminal is a program that lets you send commands to your computer and the text you pasted above is an example of how those commands work. In this guide, whenever you see text that looks like `this`, you're reading a command. Type the commands exactly as you see them here (or copy and paste them into your Terminal) and always press return at the end.

You're going to see the word "directory" a lot in this tutorial. Directory is another word for folder. Directories are specific locations for files on your computer and the Terminal always takes commands starting from a directory. If we say we are "working in a directory" it means the terminal is starting from that location. Let's play around with directories a bit:

1. Type `ls`: this will show you everything in the directory where you are currently located. If you type `ls -1` it will list them all in a single column for you. `ls` stands for "**l**i**s**t" and the `-1` tells your computer to list the direectory in one column.
2. Now type `cd Documents`: this will take you into your Documents directory. `cd` stands for "**c**hange **d**irectory."
3. Type `ls -1` again to see all the files inside your Documents directory.
4. Type `ls -1F`: notice a difference? Any item in the list with a `/` at the end is another directory.
5. Type `cd ../` to go back one directory. Directories stack on top of one another and the directory "above" your current directory is always called `..`
6. Type `pwd`: this command shows you the directory you are currently working in. You should see something like `/Users/your-name/` when you run `pwd`, this is called your _home directory_ and you can always get here by typing `cd ~`.

I like to put all my Code in the same directory. So the first thing I do is create a directory called "code"

1. `cd ~` to make sure you're in your home directory
2. `mkdir Code`: to create the directory called `Code` in your home directory. `mkdir` stands for **M**a**k**e **dir**ectory.
3. `cd Code` should bring your terminal into your Code directory. 

> **Pro tip:** You can always get back to your Code directory by typing `cd ~/Code`

![Screenshot: typing in mkdir Code](/assets/blog/github-tutorial/mkdir-code.gif)

## "Cloning" a "Repo" on your computer

* First, you want to log into GitHub. Go to [http://github.com/login](https://github.com/login) and sign in with your username and password.

Now that you have ruby installed at the correct version we can start working with the website. GitHub is a system that stores files and records every change made to them using a piece of software called `git`. In this section you'll see the words "clone," "repository," and it's shortened form "repo." Every project on GitHub is called a "repository" or a "repo." A repo contains the entire history of the project with pointers called "commits" represented by "SHAs" that indicate when and where every file was changed, and how exactly it changed. When you "clone" a repo, you download the entire project plus its history to your computer. Once you have a project cloned you can make changes on your computer without affecting the project as it exists on GitHub.

In this step we are going to _clone_ the 18f.gsa.gov project to your computer.

* Type in `cd ~/code` and press enter to get to the `code` directory we created earlier.

![Screenshot: typing in cd code](/assets/blog/github-tutorial/cd-code.gif)

* Go to [18f.gsa.gov](https://github.com/18F/18f.gsa.gov) and look in the right rail. You'll see it says "You can clone with HTTPS, SSH, or Subversion." Click on the SSH link and copy the URL that's in that text box to your clipboard. 

* Type in `git clone` and then paste the URL that you copied to your clipboard. This is now copying the 18f.gsa.gov repo to your local computer. 

![screenshot: cloning repo](/assets/blog/github-tutorial/git-clone.gif)


### Branching and pull requests

* Let's go back to the [18f.gsa.gov](https://github.com/18F/18f.gsa.gov) site from your browser. 

> On this page you will see a list of files and folders in this project. All of the blog posts are in a folder called `_posts.` All of the pages are in a directory called `_pages.` There's a [readme](https://github.com/18F/18f.gsa.gov/blob/staging/README.md) that explains to anyone browsing 18F's GitHub how some of this works. At the top of that window, you can see a dropdown that says `branch: staging`. 

* If you click on the `branch:staging` button, you can see a list of all of the "branches" that exist on this project. Everytime you come directly to [18f.gsa.gov](https://github.com/18F/18f.gsa.gov), it will show you the staging branch because we've called that branch the default branch. 

Branches are little sandboxes for other people working on the project to prepare contributions without interfering with the main project. When you're finished prepping, you issue something called a "pull request" from your branch to the "default" branch, or the main sandbox everybody bases their work off of. In our case we called that main sandbox "staging." In other projects you might also see it called "master."

In the next step we're going to create a branch and later on, when you make a pull request, GitHub will automatically assumes you're trying to contribute to the staging branch.

![Screenshot: showing what the 18f GitHub site looks like](/assets/blog/github-tutorial/screenshot4.gif)


> On the right side, you can also see a list of the existing pull requests and issues. All of the pull requests go to the staging branch. When we merge the pull request to the staging branch, GitHub automatically brings those changes into the project, but does not make them live on 18f.gsa.gov yet.

In your terminal enter the following commands: 

* `cd 18f.gsa.gov` to change directories to `18f.gsa.gov`.
* `ls -1F` to see all of the files and folders in the GitHub repo, just as you saw them on GitHub
* `git status`

> This last command will show you a little bit of information about what you're working on right now. Let's take this apart line by line:

* _"On branch staging"_ tells you is what branch you are currently working on (remember it's `staging` by default). If you made any changes and commited them, you'd commit them to the branch to staging.
* _"Your branch is up-to-date with 'origin/staging'"_ means your branch is up to date with the staging branch on GitHub (your computer calls GitHub "origin").
* "Nothing to commit / working directory clean" means you're completely up to date and haven't made any changes.

![Screenshot: how to use git status](/assets/blog/github-tutorial/screenshot5.gif)

###Building the 18F Site 

Let's go ahead and get you ready to build the site. 

* You can do that by typing `./go init`. 

> (This is running a lot of commands in the background that you don't need to worry about. It's downloading and installing a few things called "gems." Gems are little bundles of programs written in the programming language ruby that do really specific things. Jekyll is a gem, and our version of Jekyll, needs to use a few other gems to run and make the site work. The last thing it does is build the site out for you. You should only need to do this once.)

* To see what the site looks like, you can type `./go serve`. 

> This builds the site and gives you an address where you can visit the site. It should be `127.0.0.1:4000`. You can copy and paste the server address directly into a browser to double-check. To stop the server, press CTRL + C. If you try to access the server after pressing CTRL + C, you won't see anything.

>**Congratulations! A lot of the steps that you've just done are one time steps. You only have to install Homebrew once. You only have to make SSH keys once. You only have to clone the repo once. Just wanted to keep your morale high. Onward!**

### Create A Branch 

Okay. Now you're ready to start editing. 

* Open up Sublime Text or any text editor. 

* Now open your copy of 18f.gsa.gov, which is located in the directory `user/code` where user is your username.

* Click on 18f.gsa.gov and click open. 

**Voila! You can now see all of the files that make up the site.** It should look like this.

![Screen Shot: All of the files that make up the 18F site](/assets/blog/github-tutorial/image10.png)

> We now want to create a branch, or a sandbox where you can make changes to the website. On this team we always work on branches. This allows you to collaborate with teammates without intefering with other people's existing work. 

* To create a new branch, type `git checkout -b your-name-post` (The name of the branch can be anything but it should be descriptive.) 

The command `git checkout` tells `git` to work on a different branch. The `-b <branch-name>` tells it to create the branch if it does not exist yet.

* Type `git status` to make sure you're now on the branch. You should see something that looks like this:

![Screenshot: git checkout and status](/assets/blog/github-tutorial/screenshot11.gif)

### Edit and Post a Blog Post

We're now going to walk you through creating a new blog post for 18f.gsa.gov. 

* Type `ls -1F` to see a list of files and folders that make up 18f.gsa.gov's repo. 

![screen shot: ls -F command](/assets/blog/github-tutorial/image13.png)

* Go back to Sublime Text and write your post. Then save your post in the `_posts` directory with the name `2015-02-23-new_post.md` where '2015-02-25' is today's date.

![Screen shot: Saving post in _posts directory](/assets/blog/github-tutorial/image14.png)

### Adding Front Matter

The next step is to add what's called front matter. This is metadata for the blog post, extra information Jekyll uses to build parts of the website. It includes things like the title, authors, description, and date. You add front matter by pasting in the following fields starting on line 1 of your text editor:

```yaml
---
title: New post
layout: post
author: melody, boone
tags:
- GitHub
- Tutorial
- How We Work
excerpt: "This is a guide that assumes you have no prior knowledge of GitHub or the command line. We're going to introduce you to both GitHub and using the command line through a guided exercise. Today you'll learn how to make a blog post on the 18F blog."
description: "This is a guide that assumes you have no prior knowledge of GitHub or the command line. We're going to introduce you to both GitHub and using the command line through a guided exercise. Today you'll learn how to make a blog post on the 18F blog."
image: 
---
```

A complete explanation for the front-matter can be found [here](https://github.com/18F/18f.gsa.gov/tree/staging/_posts#metadata-explained). And now you can start writing a blog post for us on line 16. Say hello! It should look like this:

![Screen Shot: Adding Front Matter and saving the post](/assets/blog/github-tutorial/image15.png)


* When you are done writing, save the post by pressing Command + S. 

* And then return back to the Terminal. 

> (Don't worry. You are almost done.)

### Learn How To Make A Pull Request

* Type `git status` again. 

> You'll notice that `git status` shows a section for "untracked files" followed by the name of your blog post. Git has three stages that a file can be in: untracked, staged, or committed. Untracked means git doesn't know anything about it and will not watch for your changes. Your post is currently untracked and we're about to move the file through all three stages to committed.

* Type in `git add _posts/2015-02-23-new-post.md` and hit enter. 

> This moves the file from untracked the stage. You just told `git` to remember the changes you made to this file.

* Type `git status` again.

> You'll now see that the file is now under changes to be committed.

![Screen Shot: Git Add Post / Status](/assets/blog/github-tutorial/screenshot16.gif)


> Well done! At this point, you've told Git that this file should be committed but you haven't committed anything. So you could work on other things that need to be committed, or you could commit this file right now. We're going to commit right now.

* Type `git commit -m "My First Post"` followed by enter

You will see something that looks like this

```
[melody-kramer-post 0b22894] My First Post
1 file changed, 7 insertions (+)
create mode 100644 _posts/2015-02-23-new-post.md
```

> That means one file changed -- and it was your blog post! You've officially committed the file. You're still at the point where only you can see this file, but it's now officially been recorded. You've recorded the change for yourself and you're ready to suggest the change to 18F!

* Type in `git status` one more time. 

>You should see nothing to commit, working directory clean. That's because nothing has changed since the last commit.

**Note, the following part of these instructions will fail for anyone who is not an 18F employee. We are including them here so you can see what happens when we push the file up to GitHub. If you follow these instructions for any project you're working on in GitHub, they will work the same way**

* Type `git push origin <branch>` (where `<branch>` is the name you gave your branch) and then hit enter.

![Screen shot: git commit](/assets/blog/github-tutorial/screenshot17.gif)

> This uploads your branch and changes up to the 18f.gsa.gov project on GitHub.

* Now, go back to [18F on GitHub](https://github.com/18F/18f.gsa.gov) and you should see that you recently pushed a branch. 

> It will look like this:

![Screen shot: Pull Request](/assets/blog/github-tutorial/image19.png)

* Click `Compare and Pull Request`. It's a big green button. 

>You can add a little comment like "I wrote a blog post. Isn't this the greatest thing?" 

* Then click `Create Pull Request`.

![Screen Shot: Creating Pull Request](/assets/blog/github-tutorial/image20.png)


> This asks 18F to accept your contribution.

![Screen Shot: 18F receiving contribution from user](/assets/blog/github-tutorial/image21.png)


> You always want to make sure what's on your local machine is as up to date as it can be. So whenever you return to the terminal, make the following a habit: 

* Type `git checkout staging` followed by `git pull` again, to make sure your version of the staging branch is current.

![screenshot: checkout and pull](/assets/blog/github-tutorial/screenshot22.gif)

After you type `git pull` one of two things might happen:

1. It will either say "It's already to up date"
2. Or it will start pulling files which keeps your computer up to date. Your computer is downloading only the changes between your computer and GitHub.

If you get the first message it means nothing has changed since the last time you worked on it. If you get the second, it means someone from the 18F team merged another pull request. Whenever you run `git pull` you ask GitHub to download the most recent changes.

If you'd like to make updates to this guide or suggest changes, please add to this [issue](https://github.com/18F/18f.gsa.gov/issues/542) and we'll check it out. Thank you!
