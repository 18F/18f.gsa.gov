---
title: "Layering innovation"
date: 2015-05-08
layout: post
authors:
- diego
tags:
- developer
- coding
- how we work
- devops
excerpt: "At 18F, we're changing the way government thinks about software, all the way to provisioning and deployment. To do that, we implemented an open source platform as a service for our developers. Here’s a look at how we created it."
description: "At 18F, we're changing the way government thinks about software, all the way to provisioning and deployment. To do that, we implemented an open source platform as a service for our developers. Here’s a look at how we created it."
image: /assets/blog/layering-innovation/layer_cake.jpg
---
[![Layer cake, by Flickr user
Kirinohana](/assets/blog/layering-innovation/layer_cake.jpg)](https://www.flickr.com/photos/kiri_no_hana/9623594449/in/photolist-)

In the past, most government digital projects were created out of
requirement documents handed down to designers and developers for them
to build. Deployment, provisioning, and security have been treated the
same way.

**At 18F, we're changing the way government thinks about software, all
the way to provisioning and deployment.** To do that, we implemented
an open source platform as a service for our developers. Here’s a look
at how we created it.

## The problem

The adoption of agile, lean, and user-centric design methodologies means
projects now take weeks to build rather than years. But when it’s time
to deploy them, projects can get waylaid by months of bureaucracy and
legacy systems that don’t have the flexibility of modern infrastructure.
Operation teams have to maintain older systems and keep up with new
ones.

Cloud environments have cut the provisioning time of servers and reduced
operating costs. Instead of waiting months to get physical servers, it’s
a matter of days or hours to create the virtual servers. That said, the
modus operandi remains the same. Each software piece is treated like its
own world, which makes it impossible to use shared components.

Treating each application individually is not a good idea in any
environment, but it’s particularly bad in government where you have to
take your code, infrastructure, and architecture through a multistep
process that includes security and administrative reviews. This process
is so burdensome that it can take up to 14 months of back and forth
between the different parties before the public ever sees the product.

## Our first approach

Our first approach was to focus on the review process to launch
applications. If we could figure out how to minimize this process, it
would make releasing software a lot easier. We took a layered approach
where each layer introduces a set of changes that can be reviewed once
and reused many times.

The first layer that we introduced goes to the very core of how a server
runs. We reviewed the guidelines of the [National Institute of Standards
and Technology](http://csrc.nist.gov/publications/PubsSPs.html) (NIST)
and the [Center for Internet Security](http://www.cisecurity.org/) for
securing operating systems, and created scripts that automatically apply
them. Once those security measures were applied, we took a snapshot and
reused them for all our servers. This way we only had to run these
scripts once.

The second layer came in the form of configuration management. A common
practice in modern environments is to script *everything* that makes
an application run inside a server. This allows developers to clone
servers to create multiple test environments of both the configuration
and the code.

The task of moving from manual actions to automated scripts wasn’t easy,
but we started with the hope that it would reduce the time for new
projects to spin up and for existing ones to make changes.

Even if it looked like the right solution at the time, it quickly became
clear that for our type of projects, which are usually small and varied,
configuration management was often more a burden than a blessing. In the
spirit of lean development, we took our findings and feedback from the
developers and went back to the drawing board.

## Focusing on users

After extensive research, we realized that our users, the developers,
just wanted to focus on writing applications, not managing configuration
or dealing with security. They want to know what is going on, but don’t
want to worry about it. Moreover, they need different services like
databases and caches that should be easy to use.

It was time for the government to have a **platform where developers
can deploy applications without having to worry about how their
applications are run or what hardening measures are in place**.

We could take the same layered approach that we started, with the
benefit of being able to reuse approved components, and provide an
environment where running the application is the last piece of the
puzzle.

## Building and deploying a platform

The idea of providing a platform to a team of developers is hardly
novel. There are many solutions available and many opinions on which is
the best.

Since we are an open source team, we decided to review the top open
source platforms as a service that were available and pick one or two to
run internally.

It was clear right away that a container-based platform as a service
model is where the industry is moving and that it’s the right solution
for us. Such a platform would not only be user friendly to our
developers but also allow a secure, layered environment all the way to
the application.

18F has been running a pilot to use an open source platform as a
service, and it has been extremely successful. Developers are less
burdened with deployment tasks, DevOps staff is more focused, and there
is an overall sense that we’re on the right path.

One of the great benefits of the platform is that we can move the vast
majority of the security and review burden to the platform itself and
allow the development team to worry about their users rather than
bureaucratic approvals.

Our Director of Engineering, Kaitlin Devine, agreed: "The platform
actually allows us to follow the fundamental software tenet of not
repeating ourselves versus our previous framework. Every subsequent
deploy of a stack allows us to add to our toolset for future re-use.”

Having a lean team with an agile deployment system allows us to innovate
quickly and receive feedback sooner which, in the end, will translate to
better products.

*Diego is presenting on this topic at the Cloud Foundry Summit on May
11, 2015. [Read more about Diego’s session and the Cloud Foundry
Summit.](http://sched.co/2sUp)*
