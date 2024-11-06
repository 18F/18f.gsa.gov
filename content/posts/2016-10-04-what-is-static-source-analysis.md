---
title: "What is static source analysis?"
authors:
- michael-walker
tags:
- best practices
- technical guides
- technical debt
- tools you can use
excerpt: "Static source analysis is a way to quickly gauge the quality of source code and identify areas of high technical debt. But what IS static source analysis, and how is it useful?"
description: "Static source analysis is a way to quickly gauge the quality of source code and identify areas of high technical debt. But what IS static source analysis, and how is it useful?"
---
In software development, we use a variety of techniques to help us
understand the software we’ve written, whether it works as expected, and
whether it will be easy to maintain over time. One of the techniques we
use is called static source analysis, and it can tell us a lot about the
maintenance requirements of our code.

Static source analysis (also often referred to as simply “static
analysis”) is the practice of examining source code while it’s not
running and gathering a variety of metrics on the code itself, without
regard to how it runs in an active environment. Static analysis can
reveal [technical
debt]({{ "/2015/09/04/what-is-technical-debt/" | url }}) by
identifying sections of code (called a function or method) that are
excessively complex, have numerous decision points, or are simply too
long.

With static analysis, we often look at three metrics: number of
statements, statement nested depth, and [cyclomatic
complexity](https://en.wikipedia.org/wiki/Cyclomatic_complexity) (it’s
not as scary as it sounds). Number of statements is defined as the total
number of actual functional statements in a section of code — these are
the lines of code that do actual work as opposed to empty lines that
exist for formatting or comments that explain what the code does.
Statement nested depth refers to the maximum number of logical decisions
necessary to reach a statement of code. Cyclomatic complexity is the
total number of decision points in a section of code.

## Statements

In general, code sections should contain as few statements as necessary
to carry out their function in a clear and readable way. To this end,
software engineering best practices tend to advocate for code sections
that are small, quite often around 10 statements. There isn’t an
absolute rule and sometimes code sections are rightfully longer. Instead
of enforcing an absolute limit, the best practice is for each code
section to do only one thing. As code sections grow, it becomes
increasingly likely that they are doing more than one thing and should
be broken into multiple sections. Small, single-purpose sections are
easier to understand, easier to debug, easier to test, and easier to
maintain.

## Nested depth

Code that is deeply nested is harder to work with because it requires
keeping more information in mind about the logic necessary to arrive
there. This is probably most easily demonstrated by example.

```
If the car is dirty, wash the car
```

In this case, “wash the car” has a nested depth of one because there is
only one logical decision that has to be made to get there. It’s very
easy to understand the logic that led to washing the car. Now consider
this much deeper (if slightly contrived) example:

```
If the car is dirty...
  and it’s Saturday...
    and it’s sunny...
      and it’s not December...
        and it’s warm...
          and there’s no football game on TV...
            and it’s not lunchtime...
              wash the car
```

In this case, the nested depth is seven (the indentation helps us count
it). When looking at this, it’s much more difficult to keep in mind all
of the necessary conditions that led to washing the car. If later in the
life of this code it was necessary to add some alternative paths (where,
for example, under certain conditions you paint the car rather than wash
it), it’s important to really understand all of the existing conditions;
otherwise, the new code could introduce a lot of new bugs.

Nested depth applies to individual statements rather than entire
sections of code, but the highest depth is called the section’s “maximum
nested depth.” As with the number of statements, there is no absolute
upper limit. A reasonable goal is for all sections to have a maximum
nested depth of five or less.

### Cyclomatic complexity

Where depth reveals the maximum number of logical decisions necessary to
reach a statement of code, cyclomatic complexity tells us the *total*
number of logical decision points in an entire section of code. The
fewer number of decision points in a section of code, the easier it is
to understand the code and all of the ways it may execute. It’s clearer
how all the statements are related to one another and it’s much easier
to debug and maintain.

Consider some code that describes your daily activities, by day of the
week and time of day. It might look something like this:

```
If it is Monday...
  If it is morning...
    Eat breakfast
    Take a shower
    Go to work
  If it is noon...
    Eat lunch
    Go for a walk
  If it is five o’clock...
    Go to the gym
    Workout
    Go home
    Eat dinner
  If it is 11 o’clock...
    Go to sleep
```

While the full math around cyclomatic complexity is a bit hairy, *there
is a shortcut*: count the number of “if” statements and add 1. This
simple “Monday” example has a complexity of 6. Now imagine that this
code is expanded to every day of the week and every time that may be of
interest. Even just expanding for the days of the week would result in a
complexity of 42.

Once all of that code was written out, it’s easy to see how it would be
difficult to understand all of it as a single thing. High complexity
often indicates a section of code that is trying to do too many
different things, similarly to the number of statements (which for the
expanded version of the above would be 105). There are tricks that allow
developers to write this sort of code in fewer statements, but those
tricks don’t reduce the number of logical decisions. That’s why we
consider cyclomatic complexity in addition to the number of statements.

Maintaining code requires a good understanding of the logical decisions,
and proper testing requires running all of them. The higher the
cyclomatic complexity, the harder it is to write good tests, understand
the code, find bugs, and maintain the code. Like with the other metrics,
there is no absolute upper limit, but best practices aim to limit
complexity to around 10. Most sections will likely have complexities as
low as 1 or 2.

To reduce the complexity of the example above, one good practice would
be to create a code section for each day of the week instead of one code
section that controls all the days. This way, the logical decisions
necessary for Monday are grouped together into one section, making them
easier to reason about and easier to test.

## Putting it together

None of these metrics by themselves tell us the whole story, but taken
together they can warn us about sections of code that may be the source
of bugs or difficult to maintain. Once we have this information, we
usually then look at the source code directly to understand why the
metrics are what they are — for example, a section of code with 60
statements may draw our attention, but a close look might show it needs
to be that long. (Or, more likely, we see that the code could be
improved by breaking it up, but it’s currently easy to read and
understand so we can safely ignore the high number of statements for
now.)

Government at all levels — federal, state, and local — has a lot of
legacy software systems. 18F certainly runs into them all the time in
our work. Being able to quickly analyze these systems and point to
potential problems is crucial if we’re going to attempt to bring these
systems into the modern era. Static source analysis can be an essential
tool in this work. It can give teams insight into opaque systems and
help developers understand what fixes can make the biggest impact or
whether an entire system needs to be replaced. If you or your team often
works with legacy systems, consider adding static source analysis to
your toolbelt.
