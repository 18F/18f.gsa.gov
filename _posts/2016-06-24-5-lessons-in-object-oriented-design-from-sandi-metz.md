---
title: "5 lessons in object-oriented design from Sandi Metz"
date: 2016-06-24
authors:
- jessie
tags:
- best practices
- lessons learned
excerpt: "Last month, I completed Sandi Metz's object-oriented design course. It was
three intense days of working through refactoring exercises and
discussing code as a group with my class of 30 students. I got a ton out
of the class and returned to my work at 18F excited to practice what I'd
learned. I've rounded up my top lessons from the course for you to
enjoy."
description: "Last month, I completed Sandi Metz's object-oriented design course. It was
three intense days of working through refactoring exercises and
discussing code as a group with my class of 30 students. I got a ton out
of the class and returned to my work at 18F excited to practice what I'd
learned. I've rounded up my top lessons from the course for you to
enjoy."
image:
---

I first heard Sandi Metz speak at a meetup in San Francisco in 2012. One
thing she said that night had a profound impact on me: "Code needs to
work today just once, but needs to be easy to change forever."

At that point, I'd been writing code for a couple of years and
understood that "refactoring" was a good thing. But, like so many other
lessons I learned as a beginner, I did not really understand the *why*
of refactoring. And there it was, plain as can be: code needs to be
refactored so that it's easier to change in the future.

If a program I was writing never needed to change, refactoring would be
pointless. The minute it started working, no matter how crazy and
jumbled it looked in my text editor, I could walk away from the keyboard
and be satisfied with my code. But in reality, things always change. In
the world of software, people constantly want to change, add, and remove
functionality. That's what it is to write code. So we must refactor. We
don't change code to make it *better*, we change it to make it easier to
change in the future.

Last month, I completed Sandi's object-oriented design course. It was
three intense days of working through refactoring exercises and
discussing code as a group with my class of 30 students. I got a ton out
of the class and returned to my work at 18F excited to practice what I'd
learned. I've rounded up my top lessons from the course for you to
enjoy.

## 1. The purpose of design is to reduce the cost of change

This lesson is similar to the idea of refactoring code so that it can
"change forever" but focused on the business value of making code easy
to change. Many people think about refactoring as a bonus step or
something they will get to "later when there's time." But constant
refactoring is central to the goals of any organization that produces
software. Without refactoring, you cannot have well-designed software.
Well-designed software is easier to change. Things that are easier to
change take less time to change. Less time means less money spent.

Some people might think "but hey! refactoring takes time, and the faster
I can deliver this feature, the better." In some cases, as Sandi said,
this is true. If your business is going to fail tomorrow if you don't
deliver a feature today, then by all means write some crappy code and
deploy to production. But if you're working on a codebase that's going
to be around for an indefinite time in the future, you need to focus on
the long-term consequences of today's actions. If you’re writing
poorly-designed code in order to save time now, you need to ask
yourself: are you really saving your organization money by shipping
features faster, or costing them more down the line by writing code that
will be hard to change?

## 2. Reach for the lowest hanging green

In our first exercise of the course, Sandi asked us to write a Ruby
script to make a file of automated tests pass. This script needed to
sing any verse of the song "99 bottles of beer on the wall" given a
verse number.

I consider myself to be someone who is fine with doing things the "easy"
way. I always say "just get it working first and then make it better."
So I started by writing the code to make the first verse (for 99
bottles) work. Then I started writing the code for verse 1, where I used
interpolation to determine the bottle number and noticed that the word
"bottles" needed to be singularized to "bottle" so I wrote a little
conditional for that. The second part of that verse is also different,
so I wrote another conditional. And then I got to the "zero" verse,
which required another conditional. And then another. And another.

Pretty soon, I had a 40 line method that was incredibly confusing. And
this was just code to write a simple song! And I thought I was writing
it the easiest way possible!


```ruby
class Bottles
  def verse(number)
    if number - 1 == 0
      next_number = "no more"
    else
      next_number = number - 1
    end

    if number - 1 == 1
      next_bottle = "bottle"
    else
      next_bottle = "bottles"
    end

    if number == 1
      bottle = "#{number} bottle"
    elsif number == 0
      bottle = "no more bottles"
    else
      bottle = "#{number} bottles"
    end

    if number == 1
      pronoun = "it"
    else
      pronoun = "one"
    end

    if number == 0
      second_verse = "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    else
      second_verse = "Take #{pronoun} down and pass it around, " +
      "#{next_number} #{next_bottle} of beer on the wall.\n"
    end

    "#{bottle.capitalize} of beer on the wall, " +
      "#{bottle} of beer.\n" +
      second_verse
  end
end
```

### Time for shameless green

When we finished this exercise, Sandi taught us about the concept of
"shameless green": do the easiest thing possible to get your tests to
pass (turn green). This state is called "shameless" green because your
goal is just to get the tests to pass, nothing more. You might be
embarrassed by the code that you write to do this because it seems too
simple to be written by someone with your level of intelligence. Then,
and only then, you can abstract logic.

In the case of 99 bottles, shameless green means not worrying about
doing fancy logic for the verses that don't look like the others.
Instead, it uses a conditional to print different strings:

```ruby
class Bottles
  def verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number-1} bottles of beer on the wall.\n"
    end
  end
end
```

Developers love to write clever code, and in the case of the 99 bottles
exercise, I was no exception. Rather than saying to myself "OK, verses 1
and 0 are different, I will print a different string in those cases," I
immediately tried to use the same string with interpolation to work for
every verse. The resulting code, while certainly a rough draft, was both
a poorly-designed implementation and nearly impossible to understand.

When you start with shameless green, you start with something that may
have a ton of duplication but is very easy to understand. At that point,
you might consider the feature done. This might seem counter to the
first point about writing well-designed code, but it isn't. The way I
initially approached the problem was an inelegant solution but hard to
understand. Shameless green is an inelegant solution that is easy to
understand. Always start with shameless green, and then extract methods
and objects once there are product requirements that will be hard to
implement with your shameless green solution. That’s the path to
well-designed code.

## 3. Duplication is far cheaper than the wrong abstraction

One reason it's so hard to start with shameless green is that it usually
includes a large amount of duplication. Think about it this way: one way
to solve the 99 bottles problem would be to write a 202 line method that
returns a completely different string for each number passed in. When I
first tried my hand at the problem, I went the complete opposite
direction: zero duplication. And my code immediately became difficult to
understand.

When it comes to duplication,
[*DRYing*](http://programmer.97things.oreilly.com/wiki/index.php/Don%27t_Repeat_Yourself)
up code too early frequently leads to code that’s harder to design.
Here's why: whenever you remove duplication, you’re creating an
abstraction. Like in my first attempt at the bottles exercise, I created
various conditions that returned values based on the number passed in.
In order to use those values in the string, I had to give them a name.
So I was naming values before I even understood what they were.

Here's an example: in the 99 bottles song, verses start with a number
and that number goes down by one in the second part of the verse. So
when I wrote the conditional for that "down by one" value, I called it
`next_number`. When you get to the verse for "1", however, the
`next_number` becomes the string "no more." "No more" is not a number! By
coming up with a method name before implementing shameless green, I was
giving an inaccurate name to a concept.

You might argue that giving something the wrong name is not a big deal.
Just rename the method, right? Yes and no. Yes, the method can be
renamed. No, naming it early is not without harmful consequences. Moving
from one abstraction to a different abstraction is much harder than
moving from a concretion (such as a duplicate string) to an abstraction.
When we see all of the duplicate elements in front of us, we have a much
better chance of coming up with a proper name for that duplication. When
we name two pieces and a third doesn't fit, it’s much harder to rewind
our thinking and come up with the appropriate abstraction. Instead,
we're likely to try and jam the new use case into our existing
abstraction. And in doing so, we’re making our code harder to understand
and therefore harder to change in the future.

Removing duplication is not always the wrong choice. For example, in the
shameless green bottles example, 97 of the 100 possible verses work in
the else condition of the case statement (we didn't type out all 100
verses). But removing duplication is also not always good. DRY is one of
the first concepts you learn when you start coding. It's a good one to
learn early because humans are natural pattern matchers, and even
novices can quickly identify duplicate logic in their code. But what I
learned in Sandi's workshop is that in many cases, having some
duplication is better than having zero duplication with code that is
hard to understand.

## 4. Refactoring code should be safe and boring

Sandi's methods all depend on having a test suite that tells you if your
code is working as you expect it to. Many developers know the adage
"red, green, refactor." This means you start with a failing test (red),
write code to make the test pass (green), then change the code to make
it better (refactor).

Typically, when I get to the refactor phase, I make a handful of small
changes, then re-run my tests. At that point, it's common to find that
my changes have broken something that was previously working. Now I
become a detective on a mission to discover what I've done to cause the
breakage. This process is oftentimes risky and exciting. Risky because
figuring out what I've done to break the code's functionality frequently
takes longer than making the breaking change took in the first place.
Exciting because I’m writing a lot of code, which is fun, whereas
running tests isn't all that fun. Put otherwise: my previous refactoring
method, was the refactoring equivalent of "move fast and break things."
Refactoring in a big flurry is exciting because you do a bunch at once
and, for developers at least, writing a bunch of code is super fun.

### "Red, green, infinity green"

In Sandi's object-oriented design class, we followed a strict pattern
when refactoring that I like to call "red, green, infinity green." In
this process, we'd start with a failing tests, make it pass (with
shameless green), and then refactor. But during our refactor, we'd run
the tests after every. single. change. This means that you cannot move
code to a new location and delete it at the old location and then run
the tests. First you copy the code and paste it into the new location.
Then you run the tests. If they are still passing, you remove the old
code. Then you run the tests. If they are still passing, then you move
onto the next change. If at any point the tests fail, you undo the last
change, make sure the tests are green again, and then make a different
change that allows the test suite to stay green. If that different
change passes, then you can move to the next change. And so on and so
on.

If this sounds tedious, it's because it is. It’s what Sandi calls "safe
and boring." But there’s immense value in safe and boring. First of all,
you always know exactly what caused your tests to fail. When you run the
tests every few minutes, you might end up with a broken test suite and
no idea why it’s broken. It's not uncommon to spend longer debugging a
change made during a refactor than you spent on the refactor itself.
While this detective work can be fun and stimulating, it's also time
intensive, which means it's expensive. With the "safe and boring" method
of running the tests after each change, you always know exactly which
change caused the breakage. Because it's just one undo away.

Furthermore, the rhythm of running the tests after each change forces
you to make small, understandable changes. One mistake I make all the
time while refactoring is that I see a "shiny object" in the code that I
want to change, and I get distracted from my original refactor and end
up changing things that are unrelated to my current set of work. This is
not only problematic in the context of code review (where it's much
better to submit cohesive bits of code) but it also leads to situations
where far too much has changed and I no longer know what I'm doing. By
focusing on changing one small thing at time, there is zero need for
detective work and much lower risk of changing code that is unrelated to
the current matter at hand.

Not all of writing code needs to be safe and boring. But by doing
refactoring in an "infinity green" state, you ensure that there is more
time and energy left for the truly exciting tasks. Let refactoring be a
place to fall into the gentle rhythm of make a change, run the tests,
make a change, run the tests.

## 5. Write the best code possible today and be completely unattached to it and willing to delete it tomorrow

Fact: developers spend far more time changing existing code than
they do writing new code. While we spend a lot of time thinking about
exciting new features, the reality is that most of our work involves
changing stuff that's already there. Even those of us who are on
relatively new codebases rarely find ourselves writing code that doesn't
require changes to existing code. Oftentimes, that existing code is
something we ourselves wrote. Maybe months ago. Maybe days ago. Maybe
even hours ago.

To be an object-oriented design pro like Sandi Metz, you need to have
complete non-attachment to the code you've written. Due to the [sunk
cost
fallacy](https://en.wikipedia.org/wiki/Sunk_costs#Loss_aversion_and_the_sunk_cost_fallacy),
many of us have a hard time with this. We think: "I spent so long
writing that! It works! It's beautiful! I can't delete it!" But changing
requirements means that your code might need a different design, which
means removing attachment from existing implementations in order to make
them open to new requirements.

There is no such thing as perfect code, just code that works for the
needs of today. You can never predict the needs of tomorrow. Nor should
you, since that leads to premature abstraction. But when a new
requirement comes in that requires completely rethinking a solution you
came up with the day before, the only course of action is to practice
complete non-attachment to the existing implementation and rethink your
design so that the code can continue to be easy to change forever.
