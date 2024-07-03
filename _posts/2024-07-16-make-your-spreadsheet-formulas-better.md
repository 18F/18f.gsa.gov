---
title: Make your spreadsheet formulas better
authors:
  - matt-cloyd
date: 2024-07-16
tags:
  - spreadsheets
  - tutorial
excerpt: >
  Spreadsheets are the world's most popular programming environment. What if spreadsheet formulas were also easy to read and easy to change without fear? Learn how a few simple principles can make your spreadsheets a joy to work with.
---

_Reference to any non-federal entity does not constitute or imply its endorsement, recommendation, or favoring by GSA._

Are you afraid of spreadsheet formulas? That's pretty common — spreadsheets are notorious for being anxiety-producing messes of spaghetti code that will spit out a cryptic `#N/A` at the slightest provocation.

The problem is, **we suspect that most of the code running in government is running inside spreadsheets**. Self-reported numbers from Microsoft and Google suggest that between one and three billion people use spreadsheets, making spreadsheets the most commonly-used programming systems in the world. We infer that most of the code running in government is running in spreadsheets.

If spreadsheet formulas are the most prolific government code, and if people fear their spreadsheet formulas — well, that combination can't be good for government, or for the public servants who maintain those spreadsheets.

**The good news is, it doesn't have to be this way.** We can make spreadsheet code clearer and simpler — two qualities that make your code easier to read. And when code is easier to read, it's easier to understand. And if you understand your code, you can change it without fear.

All we have to do is apply a few simple programming practices to spreadsheet programming.

In this post, we'll present a problem to solve with spreadsheet formulas. First, we'll solve it the typical way, using conventional spreadsheet practice as passed down over the past forty years or so. 

Then, we'll solve the problem using simple, tried-and-true techniques — resulting in truly delightful spreadsheet formulas.

### Our scenario

Let's imagine we work for the National Park Service, and we've been tasked with building a spreadsheet that presents the daily average number of visitors to the fictional Igorville National Park during this fiscal quarter.

The general solution is to divide the number of visitors by the number of days elapsed so far this quarter. Round up that resulting number to the nearest integer. Then, present it so it looks like this:

```sql
visitors per day: 42
```

## Writing formulas the conventional way

We'll assume that we've been given the total visitors for the quarter in cell B2, and the number of days elapsed this quarter in cell B3.

So, to get the rounded rate, we'll divide the total park visitors by days in the quarter and then round:

```sql
=ROUND(B2 / B3)
```

Next we want to add the presentation logic. We'll convert the number to text explicitly, even though that's not always necessary. Then we'll prepend the lead-in text, "visitors per day: ".

```sql
=CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / B3)))
```

There's a hidden potential for a divide-by-zero error here. Do you see it?

On the first day of each quarter, zero days have elapsed in the quarter, so B3 will be zero. This means we'll get a divide-by-zero error the first day of each quarter. The first day of each quarter is also probably the day our supervisors will look at last quarter's final rate, and we don't want them to see a spreadsheet with messy errors.

Instead, let's catch the error, and let the report-reader know that the data is still pending for this quarter. We can try wrapping the whole thing in an `IFERROR` to catch the error, and if there's any error, it'll say "Data is pending".

```sql
=IFERROR(CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / B3))), "Data is pending.")
```

But when we step back and read this code, the headaches begin.

The `IFERROR` is far enough away from the divide operation it's not clear that we're trying to catch a divide-by-zero error here. In a week or two, we're likely to forget what this `IFERROR` is for.

We only want to prevent the divide-by-zero error, not all errors, but the way this is written will catch *all* errors. We won't know if there's another error happening that we should be aware of.

To make the connection between the potential error and the error-handling code clearer, we could rearrange them to be closer together, like this.

```sql
=CONCATENATE("visitors per day: ", TEXT(ROUND(IFERROR(B2 / B3, "Data is pending"))))
```

This won't work either — on the first day of each quarter, the formula would evaluate to `ROUND("Data is pending")`, giving us a `#VALUE!` error.

To quote comedian Conan O'Brien, ["though you should not fear failure, you should do your very best to avoid it"](https://youtu.be/KmDYXaaT9sA?si=AYCA56zKN-Xm-JjS&t=1001).

Applied here, instead of triggering the divide-by-zero error and then using `IFERROR` to handle it, we know enough to avoid creating the error in the first place.

We know that the error is created under certain conditions, when 0 days have elapsed in the quarter. It would be better to avoid the error in the first place. Let's add a "guard clause", a precondition that consciously prevents the error.

```sql
=IF(B3 = 0, "Data is pending.", CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / B3))))
```

With the guard clause, we don't need any error handling at all!

Having added the `IF`, we now have branching logic. Let's nest the code to make the branching clearer.

```sql
=IF(
  B3 = 0, # guard clause
  "Data is pending.",
  CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / B3)))
)
```

This is pretty clear, and I'd call this "good enough". You could stop writing your formula here, and it would be fine so long as this formula stayed about this simple.

Let's take a moment, then, to think about the "story" this code is telling.

In _Confident Ruby_, developer Avdi Grimm explains that code in any language has to do four things: (1) collect input, (2) perform work, (3) deliver results, and (4) handle failure. When you read code, ideally you'd see these four steps, in order, telling a clear story.

I suggest reading the code in the last example aloud to yourself. Here's how I'd read the story of this code:

- If B3, the number of days, is zero, (collect input)
- Report "Data is pending", (handle failure)
- Otherwise concatenate "visitors per day: " with... (return results)
- ...the rounded daily visitor rate (perform work)

The story of this code buries the lede: the formula is supposed to report the error rate, but we aren't introduced to that rate until the very end of the code. That would be like reading a novel and only meeting the protagonist in the last few chapters.

This type of formula-writing probably looks and feels familiar, because this is the way the formula programming language has encouraged us all to write, for forty years. And while this simple example is fine for now, writing this way doesn't work well when you have longer or more complex problems.

Let's consider another way to do things.

## Writing the formula a better way

Let's approach this same problem, this time using tried-and-true software design principles and practices.

First, we'll start by telling a clear story — a readable, step-by-step narrative that's as easy to read as it is to write. Why the emphasis on "ease"? Because ideally, our mental effort should be on solving the problem, not on understanding the minutia of the code.

After telling a clear story, we'll simplify the way we organize the story, so that when readers read our code, the focus is on the most important parts.

We'll use two formulas to do all of this work: `LET`, and `LAMBDA`. It wouldn't be surprising if you'd never heard of them — they've only been introduced to spreadsheet programs in the last several years. In that context, it makes sense that the "conventional" way of writing fearsome spreadsheet formulas is the norm — but it doesn't have to stay that way.

Let's try out these techniques!

### Tell a clear story with LET

If you've ever wished to be able to name cells or variables in your formula, you can do so by using `LET`.

To use `LET`, all of the lines except the last one of are in pairs: variable names paired with values. In the last line, you write your formula. Like this:

```sql
=LET(
  visitors, 1,
  days, 2,
  visitors / days
)
#=> 0.5
```

or like this:

```sql
=LET(
  a, 1, b, -1, c, -2,
  x, 2,
  POW((a * x), 2) + (b * x) + c
)
# => 0
```
This formula models the quadratic function y = x^2 - x - 2. [source](https://en.wikipedia.org/wiki/Quadratic_function)

> If you're in the habit of writing code, you're susceptible to a particular type of mistake when writing `LET` formulas — you're likely to accidentally use equal signs to assign variables. (At least, if you're anything like me.)
>
> `=LET(visitors = 1, #...`
>
> If you get a formula parse error when using `LET` on your own for the first time, this may be why. `LET` doesn't use equal signs to assign variables, it uses commas.

This is a simple example, but you can already see the benefits of using LET. With LET, you get clear variable names, and you can change the variables and formula independently.

LET gives us the ability to tell a story in clear steps. Let's write out, in plain language, the story or steps of our code, then we'll write the code.

Here's one way you could write out the steps:

- divide visitors by days to get the rate, and round the rate (perform work)
- handle when there are zero days elapsed at the start of a quarter (handle failure)
- format and present the rate (deliver results)

Let's implement these steps, in this order, with formula code.

```sql
=LET(
  rounded_rate, ROUND(B2/B3),            # perform work
  IF(
    B3 > 0,                              # handle failure
    "visitors per day: " & rounded_rate  # deliver results
    "Data is pending."
  )
)
```

Even with just one variable, `rounded_rate`, this tells a clearer story than the conventional formula we ended up with at the end of the previous section.

Readers coming to this for the first time will still have questions, like, what do B2 and B3 represent?

If we want to make the formula readable without having to go anywhere else for information, we can give every value a name, using `LET` to define more variables.

```sql
=LET(
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,
  daily_visitor_rate, visitors_in_quarter / days_elapsed_in_quarter,
  rounded_rate, ROUND(daily_visitor_rate),
  IF(
    days_elapsed_in_quarter > 0,
    "visitors per day: " & rounded_rate
    "Data is pending."
  )
)
```

This version is even clearer: since we've given everything a name, someone reading this formula for the first time can tell what B2 and B3 are — they don't need to guess, or dig around, or ask for help to decipher what this is doing.

We have our guard clause `days_elapsed_in_quarter > 0` preventing divide-by-zero errors. The story now reads: "If there's more than zero days elapsed in the quarter, report the rounded rate, otherwise report that data is pending."

You have a lot of agency when using `LET` — you can define one or two variables and let a lot be implied, or you can name everything. What style you use is up to you and your team.

But whatever your style, `LET` helps you name things, and by naming things you can tell a clearer story.

### Clarify readable code with comments

The clear narrative we wrote with `LET` is already an improvement. But, for readers to understand what the function does, they have to read through all of the code. A reader can get a general sense of what the function is doing by reading just a few lines, but if they want to be really sure, they would have to read the whole thing.

One common practice in software development is to leave comments which document what code is doing. Comments shouldn't be a stand-in for readable code — rather, comments should augment already readable code by summarizing or clarifying it.

But spreadsheet programs don't let you leave comments — _or do they_?

Believe it or not, you can use `LET` to leave a comment! While `LET` lets you name variables, it doesn't require you to use all of them in the formula. This means you can create a variable specifically for the purpose of leaving a comment, like this: 

```sql
=LET(
  comment, "
    Calculates the daily visitor rate for the quarter.
    If it's the first day of a quarter (0 days elapsed), it says 'pending'",
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,

  # ... rest of function omitted ...

)
```

You can name your comment anything, but "comment" is the most obvious.

If your team starts to disagree about how to write comments, you can defer to a standard comment style like [YARD](https://www.rubydoc.info/gems/yard/file/docs/Tags.md#Tag_List), which is built for Ruby but can be applied here. If we were to write this using YARD tags, we'd write:

```sql
=LET(
  comment, "
    Returns the rounded average daily park visitor rate for this quarter

    @param visitors_in_quarter [Number] Visitors so far this quarter
    
    @param days_elapsed_in_quarter [Number] Days elapsed this quarter. First day of new quarter reads 0.
    
    @return [String] Daily visitor rate, or 'pending' message
    
    @example At the start of a new quarter
      'Data is pending'

    @example With 100 visitors in 15 days
      'visitors per day: 7'
  "
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,

  # ... rest of function omitted ...

)
```

For a small team, simple spreadsheets, and short formulas, commenting like this could be overly complex, and may not worth the time it takes to write. But if you're on a larger team, working on more complex projects, and really wanting to treat your spreadsheet like a serious codebase, basing your documentation on an existing standard might be a good idea. Clear, standardized documentation will keepyour team informed and empowered, without your team having to waste time developing its own commenting conventions.

### Simplify code organization with LAMBDA

Software design practices often guide the code-writer towards simplicity and clarity. To over-simplify the principles a bit, software developers are encouraged to split complex problems into simpler problems (called "decomposition"), and to make code focus on doing one thing well at a time (called "Single Responsibility Principle").

For both of these practices, we can use `LAMBDA`. `LAMBDA` lets you write formulas within formulas. (This is different than custom functions like the "named functions" in Google Sheets. Anything written with `LAMBDA` is can only be used in the formula it's inside.)

Let's start with a simple example, adding two numbers using `LAMBDA`.

```sql
=LAMBDA(a, b, a + b)(1, 2)
```

`LAMBDA` works sort of like `LET`: you name all the variables first, then state the formula. That's what's happening between the first set of parentheses. It may look strange, but with the second set of parentheses, that's us "calling" the lambda, or giving it values to run and return an output.

The above example works like this:

- assign 1 to `a` in the lambda,
- assign 2 to `b` in the lambda,
- then run the `LAMBDA` formula `a + b`, which becomes `1 + 2`, and gives the result `3`

We can combine `LET` and `LAMBDA` to give lambdas names. Then, we can use named lambda as many times as we like, for example:

```sql
=LET(
  do_some_math, LAMBDA(a, b, a + b),
  do_some_math(1, 2) + do_some_math(3, 4) - do_some_math(5, 6)
)
# => -1
```

With a named lambda, if our requirements change and we need to, say, do different math, we only need to change the math logic in one place — inside the lambda.

```sql
=LET(
  do_some_math, LAMBDA(a, b, a + b * (b / a)),
  do_some_math(1, 2) + do_some_math(3, 4) - do_some_math(5, 6)
)
# => 1.1333333333
```

Note how we didn't touch the second line at all — we only updated the lambda, and the resulting math all changed.

You may see the benefit of this already: using `LET` and `LAMBDA`, you can organize a formula into parts, and change those parts independently. Without `LAMBDA`, you'd have to change the math in three places, and it would end up looking like this at the end:

```sql
=(1 + 2 * (2 / 1)) + (3 + 4 * (4 / 3)) - (5 + 6 * (6 / 5))
```

As the kids say, "Thanks, I hate it."

Let's return to our scenario, calculating the daily visitor rate. Here's where we left off using `LET`.

```sql
=LET(
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,
  daily_visitor_rate, visitors_in_quarter / days_elapsed_in_quarter,
  rounded_rate, ROUND(daily_visitor_rate),
  IF(
    days_elapsed_in_quarter > 0,
    "visitors per day: " & rounded_rate
    "Data is pending."
  )
)
```

Let's look at the last block of code, the IF statement. This is doing quite a lot of work. It's: 

1. checking the number of days, then
2. deciding whether to present the rounded rate or the "data pending" message, then
3. presenting one of those options.

This code isn't responsible for one thing, it's doing three things.

In a formula this simple, this is fine to leave as-is. You can read this and quickly understand what's happening.

Let's say we've been asked to add ✨emoji sparkles✨ to any daily average visitor count above 100, and ✨✨double sparkles✨✨ to visitor counts above 200, like this:

```sql
visitors per day: ✨102✨
```

and

```sql
visitors per day: ✨✨201✨✨
```

Without even writing it, we know that the "presentation logic" — the details of how we format and display the data — is about to get a lot more complex. But let's implement it anyway to show how clunky it is.

```sql
=LET(
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,
  daily_visitor_rate, visitors_in_quarter / days_elapsed_in_quarter,
  rounded_rate, ROUND(daily_visitor_rate),
  IF(days_elapsed_in_quarter > 0,
    "visitors per day: " & IFS(rounded_rate > 200, "✨✨",  rounded_rate > 100, "✨", TRUE, "") & rounded_rate & IFS(rounded_rate > 200, "✨✨",  rounded_rate > 100, "✨", TRUE, ""),
    "Data is pending."
  )
)
```

Using `LET` to store sparkle info makes it a little better:

```sql
=LET(
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,
  daily_visitor_rate, visitors_in_quarter / days_elapsed_in_quarter,
  rounded_rate, ROUND(daily_visitor_rate),
  comment, "TRUE below lets us add a fallback condition in an IFS statement, so if the rate doesn't match either condition, it will display no sparkles",
  sparkles, IFS(rounded_rate > 200, "✨✨",  rounded_rate > 100, "✨", TRUE, ""),
  IF(days_elapsed_in_quarter > 0,
    "visitors per day: " & sparkles & rounded_rate & sparkles,
    "Data is pending."
  )
)
```

Either way we write it, though, readers have to slog through a lot of details about how we calculate the number of sparkles to understand that what's happening.

But all of that presentation work can be summarized as "present the rate". It would simplify things for future readers for them to be able to skip the presentation logic and only have to read something like `present(the_rate)`.

Let's go ahead and encapsulate the presentation logic in a `LAMBDA`, separating it from the main formula body.

```sql
=LET(
  present, lambda(rate, days,
    LET(
      sparkles, IFS(rate > 200, "✨✨",  rate > 100, "✨", TRUE, ""),
      IF(days > 0,
        "visitors per day: " & sparkles & rate & sparkles,
        "Data is pending."
      )
    )
  ),
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,
  daily_visitor_rate, visitors_in_quarter / days_elapsed_in_quarter,
  rounded_rate, ROUND(daily_visitor_rate),
  present(rounded_rate, days_elapsed_in_quarter)
)
```

This appears to change the narrative structure of the code, because it looks like the formatting work is being done at the beginning, so it looks like our story starts there.

That's partly true, but you can also think of it as, we've reorganized the presentation work into its own function with its own narrative. If we were to tag each line of a simplified formula with one of "collect input", "perform work", "deliver results", and "handle failure", it would look like this:

```sql
=LET(
  present, (
    collect input
    deliver results
  )
  visitors_in_quarter, gather input,
  days_elapsed_in_quarter, gather input,
  daily_visitor_rate, perform work
  rounded_rate, perform work,
  deliver results
)
```

We can see a mini-narrative in the `format` lambda. `format` is its own function, telling its own story. We use that story to deliver results.

Readers can now see that `present` handles presentation logic, so they can skip over that if they don't need to know it. They can just read the last line that says `present(the data)`. But if someone needs to know where to go to change the presentation logic, it will hopefully be obvious that they should make those changes in the `present` function.

### Name things better with custom functions

Even with our very readable code, one problem remains: every time someone looks at this formula, they have to read up to 16 lines of code to understand what it does. A comment would help, but it's still more reading than is really necessary.

In this case, the most readable solution, and the wisest use of future code readers' time, would be to name the formula — how about something like "daily visitor rate"?

With custom formulas available in major spreadsheet programs, we can do exactly this.

**In Google Sheets:**

- Right-click on the cell containing the formula
- Click "View more cell actions", then "Define named function"
- Give the function a name like `DAILY_VISITOR_RATE`.
- In "Argument placeholders", add `visitors_in_quarter` and `days_elapsed_in_quarter`.
- In the formula definition, delete the two lines that set those variables — those variables will now be added directly to the formula, so we don't need cell values.

```sql
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, B3,
```

Then, save the function.

Now you can replace the formula with the named function:

```sql
=DAILY_VISITOR_RATE(B2, B3)
```

**In Excel:**

TK

This is so much better! The reader doesn't have to confront a wall of details to understand what's happening here — they know with confidence: "this is the daily visitor rate". If they ever do need to look at the implementation details, they can go look in the list of custom formulas, and find our very clear, readable function that uses `LET` to tell a clear story, `LAMBDA` to improve code organization, and comments to summarize and clarify.

### Summary

We've come a long way! We started with the typical way to write formulas:

```sql
=IFERROR(CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / B3))), "Data is pending.")
```

Then, we named our variables and told a clear story with `LET`, reorganized our formula with `LAMBDA`, and left comments:

```sql
=LET(
  comment, "
    Calculates the daily visitor rate for the quarter.
    If it's the first day of a quarter (0 days elapsed), it says 'pending'",
  present, lambda(rate, days,
    # ... 
  ),
  # ... 
  present(rounded_rate, days_elapsed_in_quarter)
)
```

And then we turned our well-written, documented formula into a named function:

```sql
=DAILY_VISITOR_RATE(B2, B3)
```

Using software design principles and practices, our formula is easier to read. Future readers (including ourselves) will understand it better, and people reading our code for the first time will be able to understand it better without as much digging or needing to ask for help. Code that is easier to read is easier to understand, and code that is easier to understand is easier to change without fear.
