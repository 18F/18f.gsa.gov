---
Title: How to Use Github and the Terminal: A Guide
Author: melody, boone
Layout: Page

---


This is a guide that assumes you have no prior knowledge of Github or the command line. We're going to introduce you to both Github and using the command line through a guided exercise. Today you'll learn how to make a blog post on the [18F blog](https://18f.gsa.gov/news/).

Every step will be illustrated with a helpful screenshot or animated gif that shows you exactly what your screen should look like. We'll go through each step in order. At the end of this post, you will know how to:

1. [Set Up A Cloned Repo On Your Desktop](TKTKT)
2. [Create an SSH Key](TKTKT)
3. [Read what's in your cloned directory](TKTKTTK)
4. [Install a Package Manager](TKTKKTT)
5. [Create a Branch](TKTKTKT)
6. [Edit and Post a Blog Post](TKTKKTT)
7. [Add Front Matter](TKTKTKT)
8. [Learn how to make a pull request](TKTKT)

It is worth noting: There are many different ways to do each of these steps. If you have an alternative way of doing any of these steps — or have ways to make this more efficient — please let us know by posting an issue [here](https://github.com/18f/18f.gsa.gov/issues/new). (You don't have to know how to code to post an issue, but you do need a Github account.) 

**What you need to get started** a Github account, Terminal, Sublime or another text editing program. These instructions are for Macs and Linux-enabled machines. If you are working on Windows, we suggest checking out [this comment](https://github.com/18F/18f.gsa.gov/issues/542#issuecomment-75145417) that was posted to Github that details how to make these instructions work for Windows machines.

### How to Set Up A Cloned Repo On Your Desktop ###

* First, you want to log into Github. Go to [http://www.github.com/login](github.com/login) and sign in with your user name and password. 

* Go to Finder and type in Terminal. Open the terminal. 

>Most of the next steps are things you only need to do once. It seems like a lot, but it's basically getting >everything in place so you can do this very easily. It will seem like a lot. It's one time only. Promise. There's >a little notification when you're done the one-time only stuff.

* Type in `xcode-select --install.` This will install git along with other developer tools that Apple provides on your machine. (To learn more about this command, click [here](http://railsapps.github.io/xcode-command-line-tools.html)

>This can take a very long time. Even though it's early in the process, might as well take a break or grab lunch. >Come back in an hour. But don't shut your computer off.**

* Type in `ls`. This will show you everything in the directory where you are currently located.

* You're going to want to create a new directory where you will clone all of your Github repos. This keeps everything nice and neat. You do this using the `mkdir` command, which stands for "Make Directory." I called my directory `Code.` 

* Type in `mkdir Code` to create a directory called code.

![Screenshot: typing in mkdir Code](https://cloud.githubusercontent.com/assets/5784474/6331640/66e346d4-bb4e-11e4-9506-35196637d8d8.gif)


You now want to enter that directory. `cd` is the command that changes to another directory. 

* Type in `cd code` and press enter so you're now in that directory.

![Screenshot: typing in cd code](https://cloud.githubusercontent.com/assets/5784474/6331991/a26147cc-bb50-11e4-8cef-66e99c62ef0a.gif)

Now we're going to clone the 18F repo to your local computer. This is so you can make changes locally (i.e. edit documents or add files) on your own computer.

* Go to [18f.gsa.gov](https://github.com/18F/18f.gsa.gov) and look in the right rail. You'll see it says "You can clone with HTTPS, SSH, or Subversion." Click on the SSH link and copy the URL that's in that text box to your clipboard. 

* Type in `git clone` and then paste the URL that you copied to your clipboard. This is now copying the 18f.gsa.gov repo to your local computer. 

![screenshot: cloning repo](https://cloud.githubusercontent.com/assets/5784474/6332151/af327e8e-bb51-11e4-888a-751144e9f79e.gif)

#####How to create an SSH Key

>If you run into an error here, you need to create what's called an SSH key. You can follow the instructions that >are located [here](https://help.github.com/articles/generating-ssh-keys/). (Pro Tip: You type in everything >except the $ key.) You only have to do this once. This will be a key that's attached to your computer. Every time >you use this computer to clone a project or pull/push a project, this SSH key will get used. You will have to do >this on every computer you have. So if you plan to work on these projects on a separate computer, you will need >to do this process again.  

###How to read what's in your cloned directory

* Let's go back to the [18f.gsa.gov](https://github.com/18F/18f.gsa.gov) site from your browser. 

>On this page you will see a list of files and folders in this project. All of the blog posts are in a folder >called `_posts.` All of the pages are in a directory called `_pages.` There's a >[readme](https://github.com/18F/18f.gsa.gov/blob/staging/README.md) that explains to anyone browsing Github how >some of this works. At the top of that window, you can see a dropdown that says `branch: staging`. 

* If you click on the `branch:staging` button, you can see a list of all of the branches that exist on this project. Everytime you >come directly to [18f.gsa.gov](https://github.com/18F/18f.gsa.gov), it will show you the staging branch because >we've called that branch the default branch. 

>Later on, when you make a pull request, Github will automatically assume you're trying to make a pull request to >the staging branch. 

![Screenshot: showing what the 18f github site looks like](https://cloud.githubusercontent.com/assets/5784474/6332462/a5068e08-bb53-11e4-87f2-2a193d2cdf5b.gif)


>On the right side, you can also see a list of the existing pull requests and issues. All of the pull requests go >to the staging branch. When we merge the pull request to the staging branch, Github automatically brings those >changes into the site, but does not make them live yet. 

* Type `cd 18f.gsa.gov`and then hit enter. That makes sure the current directory you're in is `18f.gsa.gov` on your local machine.

* Type `ls` and you should now see all of the files and folders in the github repo. 

* Type `git status` and hit enter. 

>This will show you a little bit of information on what you're working on right now. The first thing it tells you >is what branch you're on. And you're on `staging`, which is the default. When you commit your branch, you'd be >committing the branch to staging. Origin/staging means your branch is up to date with the staging branch on >origin. "Nothing to commit / working directory clean" means you're completely up to date and haven't made any >changes.

![Screenshot: how to use git status](https://cloud.githubusercontent.com/assets/5784474/6332525/0d871434-bb54-11e4-8441-7d6066e99d44.gif)


###How to Install a Package Manager

>Now we have to install a package manager. Package managers help install, upgrade, configure and remove different >software packages that are needed to make various programs work. We're going to use [Homebrew](http://brew.sh/).

*Paste `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` at the terminal prompt. 

*You'll likely be asked for your password. This needs to be an admininstrator's password on your computer. (If you're the only user on the computer, it's your password.)


![installing package manager](https://cloud.githubusercontent.com/assets/5784474/6332682/2eb453aa-bb55-11e4-89ef-5eca51df99fe.gif)


>If you see a warning message at this point, it means you may have the wrong version of Ruby. So we need to update >your version of Ruby. 

*Go to `https://rvm.io`. 

*Scroll down a little bit and you should see two boxes with code in them. Copy the second one !screenshot! into your terminal and hit run.

*Now  type `rvm install 2.2.0` and then hit enter. 

![Screenshot: homebrew install](https://cloud.githubusercontent.com/assets/5784474/6332671/20399894-bb55-11e4-9648-bc9e5a3aad8e.gif)


*Now we're going to install a newer version of ruby with RVM. This is tricky, because the instructions for installing RVM are hidden. We've circled them here:

![Screen Shot: To start using RVM, you need to run source /Users/YOURUSERNAME/.rvm/scripts/rvm](https://cloud.githubusercontent.com/assets/5784474/6351935/7638c8d8-bc0d-11e4-95da-3d1715fcb583.png)

*Look for the line that says `To start using RVM, you need to run source /Users/YOURUSERNAME/.rvm/scripts/rvm,`, where YOURUSERNAME is the username on your computer. Paste that line at the cursor and then type in your computer's password (not the github password.)

*You can check your Ruby install by typing in `Which Ruby` on the command line. You should see 2.2.0. (You can also type 'ruby --version' - you should see the same thing.)

![screen shot: Which Ruby?](https://cloud.githubusercontent.com/assets/5784474/6352208/febb77c2-bc0e-11e4-9e0c-d7c271fb71ee.png)

###Building the 18F Site 

Let's go ahead and get you ready to build the site. 

*You can do that by typing `./go init`. 

>(This is running a lot of commands in the background that you don't need to worry about. It's installing >something called Ruby Gems. Gems are little bundles of programs that do really specific things. Jekyll, and our >version of Jekyll in particular, needs a lot of them to run and make the site work. The last thing it does is >build the site out for you.) 

*To see what the site looks like, you can type `.\go serve`. 

>This builds the site and gives you an address where you can visit the site. You can copy and paste the server >address from the terminal directly into the browser to double-check. To stop the server, press CTRL + C. If you >try to access the server after pressing CTRL + C, you won't be able to do.

>**Congratulations! A lot of the steps that you've just done are one time steps. You only have to install Homebrew >once. You only have to make SSH keys once. You only have to clone the repo once. Just wanted to keep your morale >high. Onward!**

### Create A Branch 

Okay. Now you're ready to start editing. 

*Open up Sublime Text or any text editor. 

*Now open your copy of 18f.gsa.gov, which is located in the directory `user/code` where user is your username.

*Click on 18f.gsa.gov and click open. 

>Voila! You can now see all of the files that make up the site. It should look like this.

![Screen Shot: All of the files that make up the 18F site](https://cloud.githubusercontent.com/assets/5784474/6352212/0699ef96-bc0f-11e4-95b8-07338522b71c.png)

>We now want to create a branch where you can make changes to the website. A branch is basically a way to make >changes to a file that only belong to you. Someone else has to approve those changes before they go live on the >site. This allows you to collaborate with teammates without intefering with other people's existing work. 

*To create a new branch, type `git checkout -b your-name-post` (The name of the branch can be anything but it should be descriptive.) 

>This also moves you onto that branch.

*Type `git status` to make sure you're now on the branch. You should see something that looks like this:

![Screenshot: git checkout and status](https://cloud.githubusercontent.com/assets/5784474/6352442/b6f0e16e-bc10-11e4-830a-c9b62750f483.gif)

### Edit and Post a Blog Post

We're now going to walk you through creating a new blog post for 18f.gsa.gov. 

*Type `ls -l` to see a list of files and folders that make up 18f.gsa.gov's repo. 

>On the far left, you'll see `-rw-r--r--`. Any line that starts with a d is a directory. 


![screen shot of 18F directories](https://cloud.githubusercontent.com/assets/5784474/6352518/50506686-bc11-11e4-8adc-b021c047584f.png)

>The far right column is the name of the file or directory. 

*You can also type in the command `ls -F` which shows you all of the files and is a lot less noisy. In this case, anything that ends with a `/` is a directory:

![screen shot: ls -F command](https://cloud.githubusercontent.com/assets/5784474/6352713/846d2a8e-bc12-11e4-81f7-5cb433f1106d.png)


*Go back to Sublime text and write your post. Then save your post in the `_posts` directory with the name `2015-02-19-new_post.md`

![Screen shot: Saving post in _posts directory](https://cloud.githubusercontent.com/assets/5784474/6355905/a07c1df6-bc27-11e4-84a1-ae08b0c84cd0.png)


### Adding Front Matter

The next step is to add what's called front matter. This is metadata for the blog post, and includes things like the title, authors, description, and date. You add front matter by typing in 

```
--- on line 1.
Title:New Post on line 2.
Layout:Post on line 3.
--- on line 4.
```

And now you can just start writing a blog post for us on line 7. Say hello! It should look like this:

![Screen Shot: Adding Front Matter and saving the post](https://cloud.githubusercontent.com/assets/5784474/6355992/346b568a-bc28-11e4-9e26-1437a625b5f5.png)


*When you are done writing, save the post by pressing Command + S. 

*And then return back to the Terminal. 

>(Don't worry. You are almost done.)

### Learn How To Make A Pull Request

*Type `git status` again. 

>You'll notice that it says "untracked files" followed by the name of your blog post. Git has three stages that a >file can be in: untracked, staged, or committed. We're about to move the file through all three stages: from untracked to staged to committed.

*Type in `git add _posts/2015-02-19-new-post.md` and hit enter. 

>This moves the file from untracked the stage. 

*Type `git status` again.

>You'll now see that the file is now under changes to be committed. 

![Screen Shot: Git Add Post / Status](https://cloud.githubusercontent.com/assets/5784474/6357569/69efb3b8-bc33-11e4-9783-35c1df730391.gif)


>Well done! At this point, you've told Git that this file should be committed but you haven't committed anything. >So you could work on other things that need to be committed, or you could commit this file right now. We're going to commit right now.

*Type `git commit -m "My First Post"` followed by enter

>You'll now see something that looks like this:

![Screen shot: git commit](https://cloud.githubusercontent.com/assets/5784474/6357623/d0b52cf4-bc33-11e4-8b9b-400eed3db489.gif)


>That means one file changed -- and it was your blog post! You've officially committed the file. You're still at >the point where only you can see this file, but it's now officially been recorded. You've recorded the change for >yourself and you're ready to suggest the change to 18F!

*Type in `git status` one more time. 

>You should see nothing to commit, working directory clean. That's because nothing has changed since the last >commit.

**Note, the following part of these instructions will fail for anyone who is not an 18F employee. We are including them here so you can see what happens when we push the file up to Github. If you follow these instructions for any project you're working on in Github, they will work the same way**

* Type `git push origin melody-kramer-post` and then hit enter.

>This pushes that branch up to Github. 

![checkout and pull](https://cloud.githubusercontent.com/assets/5784474/6357926/10c13dcc-bc36-11e4-9b6b-ca8e92163983.gif)


*Go back to [18F on Github](github.com/18F/18f.gsa.gov) and you should see that you recently pushed a branch. 

>It will look like this:

![Screen shot: Pull Request](https://cloud.githubusercontent.com/assets/5784474/6357697/4f989e70-bc34-11e4-9d20-4b13acc0a672.png)


*Click `Compare and Pull Request`. It's a big green button. 

>You can add a little comment like "I wrote a blog post. Isn't this the greatest thing?" 

*Then click `Create Pull Request`.

![Screen Shot: Creating Pull Request](https://cloud.githubusercontent.com/assets/5784474/6357705/5bf596aa-bc34-11e4-9c66-bf59732a43c4.png)


>This asks 18F to accept your contribution.

![Screen Shot: 18F receiving contribution from user](https://cloud.githubusercontent.com/assets/5784474/6357710/6581c1ee-bc34-11e4-9329-252f4dc87a28.png)


>You always want to make sure what's on your local machine is as up to date as it can be. So whenever you return >to the terminal, make it a habit to 

*Type `git checkout staging` followed by `git pull` again, just to make sure everything is current.

![screenshot: checkout and pull](https://cloud.githubusercontent.com/assets/5784474/6357931/16f97b6e-bc36-11e4-9a85-cf5f4c09d3ab.gif)


After you type `git pull` one of two things might happen:

1. It will either say "It's already to up date"
2. Or it will start pulling files which keeps your computer up to date. Your computer is downloading only the changes between your computer and Github.

And you're done. Here's what happens next. TKTKTKTKTKT

If you'd like to make updates to this guide or suggest changes, please add to this [issue](https://github.com/18F/18f.gsa.gov/issues/542) and we'll check it out. Thank you!
