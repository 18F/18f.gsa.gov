---
title: "The case for open source software"
date: 2018-07-12
authors:
- ian-lee
tags:
- open source
- open government
excerpt: "Software is everywhere at Lawrence Livermore National Laboratory. Much of their software portfolio is open source. They began releasing software in the 1990s — long before the Federal Source Code Policy required government institutions to make their code available to each other and to release at least 20 percent to the public."
image: /assets/blog/llnl/llnl-software-repo.png
---

*Editors note: This is a guest post by Ian Lee. Ian is a computer engineer committed to improving Lawrence Livermore National Laboratory’s engagement with the open source software community.*

Software is everywhere at Lawrence Livermore National Laboratory (LLNL).
As a Department of Energy (DOE) lab, we contribute to the National
Nuclear Security Administration’s (NNSA’s) stockpile stewardship mission
while strengthening national and global security with a range of
programs in fields like counterterrorism, biosecurity, and energy.
Researchers both inside and outside the Lab rely on our high-performance
computing (HPC) center to advance science and technology. Our software
developers produce millions of lines of code every year to support these
goals.

<blockquote class="testimonial-blockquote">
  Our large collection of software is a precious Laboratory asset, one that benefits both Lawrence Livermore and other national laboratories, and in many cases, the public at large.
    <span>- Bruce Hendrickson, LLNL's Associate Director for Computation </span>
</blockquote>

Much of our software portfolio is open source. We began releasing
software in the 1990s — long before the [Federal Source Code
Policy](https://sourcecode.cio.gov/) required government institutions
to make their code available to each other and to release at least 20
percent to the public. The advent of hosting services like
[GitHub](http://github.com/llnl) increased exposure of open source
code. We launched a [software portal](http://software.llnl.gov) in
2015 to provide additional access and track overall trends. Thanks to
growing institutional support over the last 10 years, our involvement
with the open source community has taken off.

<figure>
  <img src="{{site.baseurl}}/assets/blog/llnl/llnl-repo-graph.png" alt="Graph showing LLNL’s open source repository creation
  history with years marked on the x-axis and the cumulative number of
  repositories on the y-axis."/>
</figure>

Our software addresses just about every key computing need: compilers,
package managers, data analysis tools, visualization tools, input/output
benchmarking, data storage, parallel performance, workload management,
math and physics codes, and more. We work in multiple operating systems
and programming languages.

# Win–wins

As 18F [points
out]({{ "/tags/open-source/" | url }}), adopting an
open source policy has many benefits. Government agencies — especially
those with HPC centers, like LLNL — are trying to solve similar
problems. With open source software, agencies and contractors can align
their goals and make the most of external resources. We can share
projects and avoid redundancies. (After all, not everyone can build and
support their own football field–sized supercomputing facilities.)

<blockquote class="testimonial-blockquote">
  With open source software [OSS], we are in control and can develop quickly and efficiently. It gives us the freedom to choose the best
  computer hardware instead of being locked into one company’s hardware
  solution. OSS is not for every organization, but for an organization
  like LLNL, whose job is to build innovative solutions for national
  security, OSS has been an essential tool.
    <span>- Terri Quinn, LLNL’s Advanced Simulation and Computing Program leader</span>
</blockquote>

For example, we’re developing open source tools with the NNSA’s
[Advanced Simulation and Computing Program](https://www.exascaleproject.org/more-on-the-software-that-underpins-the-exascale-computing-project/) to make HPC codes portable to next-generation architectures. The DOE’s [Exascale Computing Project](https://www.exascaleproject.org/) depends on open source technology to share work among participating institutions, including LLNL and other national labs.

One of our most popular open source HPC projects is [ZFS on Linux](http://zfsonlinux.org/), which,
as the name states, is a version of the ZFS file system that supports
the Linux operating system. Embodying the community’s quid pro quo, we
could adapt the software to Linux because the [original
ZFS](http://open-zfs.org/wiki/History) (which only supported the
Solaris operating system) was open source.

We create software that resonates with the open source community due to
its flexibility with a variety of use cases. [LLNL's Spack](https://spack.io), a collection
of recipes for managing software packages, averages hundreds of
downloads every day. High usage combined with external contributions
make it incredibly stable and widely relevant to many platforms,
languages, and simulation frameworks. Users like Spack because it works
well, and it works well because users actively participate in its
development. It’s cost-effective, too: We improve the quality and
portability of our software when users are willing to test it for free.

<blockquote class="testimonial-blockquote">
  [Livermore Computing] has contributed software and leadership to the
  HPC community since before it was called HPC. Our developers consider
  the broader ecosystem, not just particular tools. Our original
  production tools for managing and using Linux clusters have been in
  use since we stood up our very first clusters.
    <span>- Becky Springmeyer, LLNL’s Livermore Computing division leader</span>
</blockquote>

Open source software also demonstrates a developer’s skills. Just as a
scientist can publish research papers, a software developer can release
projects. Moreover, we’re seeing a rise in scientific papers that cite
open source code to encourage reproducibility. When your code is
available for anyone to check, your personal standards go up. This
professional investment works both ways. We’ve interviewed a few
dedicated contributors after seeing what they did with our code.

Additionally, many developers are motivated to give back to the
community. We contribute to other institutions’ open source projects
(such as the [Department of Homeland
Security](https://github.com/dhs-ncats/pshtt) and
[18F](https://github.com/18F/domain-scan)), and collaborators value
our perspective and needs as a national lab.

<figure>
  <img src="{{site.baseurl}}/assets/blog/llnl/llnl-github-page.png" alt="LLNL’s main page on GitHub, accessible at github.com/llnl, showing a
  list of repositories created by LLNL developers."/>
</figure>

# Growing pains

Today, releasing software as open source is LLNL’s default position when
the content isn’t classified or controlled. That wasn’t always the case;
the cultural shift took some time.

One common argument is relevance. Why do we deliberately produce
software for public consumption? Because the potential for new
discoveries and applications is too great to ignore. For instance, the
[Earth System Grid Federation](https://esgf.llnl.gov/) started two
decades ago as a data-sharing project between DOE labs. Now it’s an
award-winning collaboration among agencies and researchers all over the
world who work in Earth system science. The project’s software modules
are (necessarily!) [open source](https://github.com/esgf).

Ultimately, [our senior management
saw](https://str.llnl.gov/2018-01/comjan18) that an open source
strategy directly affects LLNL’s missions by improving our software
development and HPC capabilities. They support several grassroots
activities around the Lab, like hackathons, that nurture open source
development. Management’s buy-in is essential, plus it’s great for
morale.

<blockquote class="testimonial-blockquote">
  Open source software not only reduces barriers to collaboration and
  helps reduce duplication of effort, but it helps establish the
  reputation of individuals, organizations, and entire nations as
  software leaders in a field. A huge reason that the U.S. continues to
  drive the global vision of HPC is its dedication to pursuing open
  source solutions, and LLNL is major contributor to that ecosystem.
    <span>- Rob Neely, LLNL’s Exascale Computing Project software delivery and
    ecosystem leader</span>
</blockquote>

Another challenge is finding the sweet spot within an institution’s
release policy. The ideal release policy acknowledges that open source
software will continue to be developed. It’s not a one-and-done
activity, nor can you conduct a lengthy release process for every
commit. (Spack, for instance, [receives hundreds of commits a
day](https://github.com/spack/spack/graphs/contributors).) At LLNL,
we’re working toward a realistic release policy with appropriate
expectations for approval and ongoing maintenance.

We’ve started to work with other government agencies and contractors
that want to become part of the open source community. Even if your
agency doesn’t develop code, you can benefit from incorporating open
source tools — which are usually well supported and well documented —
into your software stacks. To learn more about LLNL’s open source
software, check out our [portal](https://software.llnl.gov/), explore
our projects on [GitHub](https://github.com/llnl), and follow us on
Twitter [@LLNL\_OpenSource](https://twitter.com/LLNL_OpenSource).

*This work was performed under the auspices of the U.S. Department of
Energy by Lawrence Livermore National Laboratory under Contract
DE-AC52-07NA27344 (LLNL-WEB-753159).*
