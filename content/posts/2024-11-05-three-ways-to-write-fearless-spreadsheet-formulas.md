---
title: Three ways to write fearless spreadsheet formulas
authors:
  - matt-cloyd
date: 2024-11-05
tags:
  - modern practices
  - technical guides
  - tutorial
  - spreadsheets
excerpt: >
  Spreadsheets are the world's most popular programming environment — and the most feared. But what if spreadsheet formulas were easy to read and change without fear? Learn how a few simple principles can make your spreadsheets a joy to work with.
---

<style>
  table { font-size: 1rem; }
</style>

_Reference to any non-federal entity does not constitute or imply its endorsement, recommendation, or favoring by GSA._

Are you afraid of spreadsheet formulas? You're not alone. Many people consider spreadsheets to be anxiety-producing messes of formula code that spit out cryptic `#N/A`s at the most minor of changes.

The problem is, **we suspect that most government code runs in spreadsheets**. Various unverifiable estimates floating around the internet suggest that between one and three billion people use spreadsheets, and that at least 500 million people write spreadsheet formulas. This would mean that spreadsheets are the most commonly-used programming systems in the world. That would also mean spreadsheets are where most government code lives — spreadsheet formulas are code, after all.

If spreadsheet formulas are the most prolific government code, and if people fear their spreadsheet formulas — well, that combination can't be good for government, or for the public servants who develop, use, and maintain those spreadsheets.

**The good news is, it doesn't have to be this way.** We can make spreadsheet code easier to read by making it clearer and simpler. And when code is easier to read, it's easier to understand. If you understand your code, you can change it without fear.

To create clear spreadsheets, we can use simple, well-tested programming practices to write spreadsheet formulas.

Below, we'll work through an example problem, first using conventional spreadsheet formula-writing practice commonly used over the past 40 years or so. Then, we'll solve it again using simple, tried-and-true programming techniques that are now possible in modern spreadsheet programs.

The result? Truly delightful spreadsheet formulas. Feeling suspicious? That's understandable.

Let's get started.

### Our scenario

Let's imagine we work for the National Park Service, in the fictional Igorville National Park. At the end of each day, we get a report of how many people visited the park that day. Our supervisor has asked us to create a cell in our spreadsheet that shows the average number of daily visitors to Igorville Park since the start of the fiscal quarter.

The general solution is to:

Divide the total number of visitors this quarter by the number of days elapsed in the quarter.
Round up that number to the nearest integer.
Then, add text at the beginning so it looks something like this:

```sql
visitors per day: 171
```

## Writing conventional formulas
Let's assume that the total visitors this quarter are in cell `B2`. The number of days elapsed this quarter are in cell `C2`.

|| A | B | C |
|:-:|-|---|---|
| 1 | **Daily visitor rate for 2025 Q1** | **Total visitors in 2025 Q1** | **Days elapsed in 2025 Q1** |
| 2 | TODO: Formula for daily visitor rate | 513 | 3 |
| 3 | | |

To get the rounded visitor rate, we'll divide the total park visitors by the number of days in the quarter, then round.

```sql
=ROUND(B2 / C2)
```

Next, we'll add the presentation logic. We'll convert the number to text, even though that's not always necessary. Then we'll add lead-in text that says `visitors per day: `.

```sql
=CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / C2)))
```

There's a hidden divide-by-zero (`#DIV/0!`) error waiting to happen here. Do you see it?

On the first day of each quarter, zero days have elapsed, so `C2` will be zero. This means we'll get a divide-by-zero error the first day of each quarter. (This is also probably the day our supervisors will look at last quarter's numbers, so we don't want to show them a spreadsheet with ugly errors.)

Instead, let's catch the error, and output a message that the data is still pending for this quarter. We could try wrapping the whole formula in an `IFERROR` to catch the error, and report that "Data is pending."

```diff
+=IFERROR(
  CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / C2))), "Data is pending"
+)
```

But when we step back and read this code, the headaches begin.

The `IFERROR` is far away from the divide operation, so readers might not understand that we're trying to catch a divide-by-zero error. In a week or two, we're likely to forget what this `IFERROR` is doing.

Plus, we want to prevent only the divide-by-zero error, but the way this is written will catch *all* errors. We won't know if there's another type of error happening here that we should be aware of.

Let's make the connection between the potential error and the error-handling code more clear. To do this, we could rearrange the error and the error-handling to be closer together, like this.

```sql
=CONCATENATE("visitors per day: ", TEXT(ROUND(IFERROR(B2 / C2, "Data is pending"))))
```

This won't work either. On the first day of each quarter, the formula would evaluate to `ROUND("Data is pending")`. Since you can't round text, this would give us a `#VALUE!` error.

Instead of handing the error like this, we can prevent the error from happening. We know that the error occurs under one specific condition — the first day of the quarter, when zero days have elapsed. So, let's add a pre-condition that prevents the error. This is known as a "guard clause."

(If you're copying and pasting this code, remember to delete the comment denoted by `/* */`. These are my way to annotate the code, but the spreadsheet formula language will raise an error.)

```sql
=IF(C2 = 0, /* guard clause */
  "Data is pending.",
  CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / C2)))
)
```

(You can make your formula span multiple lines by using Option + Return on Mac, or Control + Enter on PC.)

With the guard clause in place, the divide-by-zero can never happen! And with that, our formula is all set.

This formula is pretty clear when read aloud. In plain language, it reads something like: "if there are zero days in the quarter, data is pending, otherwise, show the rounded daily visitor rate."

We could stop writing our formula here, and it would be fine — so long as this formula stayed about this simple. If we needed to make bigger changes, with more potential for errors, this could get overly complex very quickly.

### Four steps your code should follow

Let's pause a moment and think about the "story" this code is telling.

In his talk [Confident Code](https://www.youtube.com/watch?v=T8J0j2xJFgQ), developer Avdi Grimm explains that code has to do four things:

- Collect input
- Perform work
- Deliver results
- Handle failure

When we read code, we should ideally see these four steps in order, telling a clear story.

Try reading the code in the last example out loud. Here's how I'd read the story of this code:

| Code in plain language | Confident Code step  |
|------------------------|----------------------|
| If C2, the number of days, is zero | 1. Collect input |
| Report "Data is pending" | 4. Handle failure |
| Otherwise show "visitors per day: " next to... | 3. Return results |
| ...the rounded daily visitor rate | 2. Perform work |

The story of this code puts the more important parts last. This formula calculates and reports the error rate, but not until the very end of the code. The "perform work" step comes last, instead of in second place like in Avdi's list. This is like reading a news article where the crucial information is introduced in the last paragraph.

But writing formulas this way probably feels familiar. That makes sense, because it's the way formula programming language has encouraged us all to write for the last 40 years. And while the conventional way we've written this formula works for this simple example, it isn't sustainable for more complex problems.

## Three techniques for writing better formulas
Let's approach this same problem using tried-and-true software design principles using three techniques. First, we'll tell a clear story that's easy to read and write. Then, we'll add comments to clarify what we've written. Last, we'll organize our code so readers can more easily understand our formula.

To do this, we'll use the functions `LET` and `LAMBDA`. These might be unfamiliar, since spreadsheet programs introduced these only in the last few years.

### Technique 1: Use LET to tell a clear story

#### Introducing LET

Let's say we have a formula we want to put into our spreadsheet:

```sql
x + y
```

In conventional spreadsheet practice, we would replace these variables `x` and `y` with either literal values, such as `1` and `2`, or cell references, such as `A2` and `C2`.

```sql
=1 + 2
```

```sql
=A2 + C2
```

With `LET`, we can assign values to variables. In this example, we'll set `x` and `y` to `1` and `2` respectively, while leaving the formula as-is.

```sql
=LET(
  x, 1,  /* set x to 1 */
  y, 2,  /* set y to 2 */
  x + y  /* evaluates to `1 + 2`, which returns `3` */
)
```

The first line assigns the value `1` to the variable `x`, and sets `y` to `2`. The last line is the formula, where everything previously assigned is evaluated.

`LET` can assign any other formula or expression to a variable, like this:

```sql
=LET(
  x, 1 + 2 + 3, /* set x to 6 */
  y, x * 2,     /* set y to 12, using the already-set value for x */
  x + y         /* returns `18` */
)
```

How does naming values like this help make our formulas better? Well, we can use this to tell the story of our formula in clear steps.

#### Writing the story of our code

First, let's write the story of our code, following the order of Avdi's steps.

- **Gather input**: Get the number of visitors in the quarter and the number of days in the quarter
- **Perform work**: Divide the number of visitors by the number of days to get the rate, then round the rate
- **Handle failure**: Handle when there are zero days elapsed at the start of a quarter
- **Deliver results**: Format and present the rate

Let's translate these steps, in this order, into formula code.

```sql
=LET(
  /* 1. Gather input */
  visitors_in_quarter, B2,
  days_in_quarter, C2,

  /* 2. Perform work */
  daily_visitor_rate, ROUND(visitors_in_quarter/days_in_quarter),
  IF(
     /* 3. Handle failure */
  days_in_quarter <= 0,                      
  "Data is pending.",

     /* 4. Deliver results */
     "visitors per day: " & daily_visitor_rate
  )
)
```

This tells a much clearer story than the previous conventional formula. The inputs are named, so we know we're working with visitors and days in the quarter. The visitor rate is named, so when we present it with the "visitors per day: " text, it's clear what we're presenting. Even a first-time reader would have a pretty good idea of what's happening here.

In conclusion, `LET` helps you name the inputs and steps in your formula code, and these names clarify your story.

### Technique 2: Use comments to clarify readable code
#### What are comments?

When software developers write code, they can leave comments in the code. Comments are narrative descriptions of the code, which other developers can read to better understand the code.

If comments are being used instead of writing clear code, the code and developers suffer. You may hear anti-comment sentiments from some developers, but my understanding is that disdain for comments is a reaction to the negative experience when comments are used as a substitute for clear code.

If comments are being used to supplement writing clear code, they can be quite helpful. Comments can provide context, explain assumptions, warn about common mistakes, and more. Comments can also summarize the formula, so that readers don't have to read all the code to understand what's going on. 

But spreadsheet programs don't let you leave comments — _or do they_?

#### Writing our first comment

In other languages, a special identifier like a hash (`#`), double-slash (`//`), or other syntax (`/* */`) will indicate a comment. Spreadsheet language doesn't let you do *quite* that, which you may already know if you tried to copy and paste some of the prior code examples into a spreadsheet.

But believe it or not, you can use `LET` to leave a comment!

```sql
=LET(
  comment, "
     Calculates the daily visitor rate for the current quarter.
     On the first day of the quarter (0 days elapsed), it will say that data is pending.
  ",
  visitors_in_quarter, B2,
  days_in_quarter, C2,
  daily_visitor_rate, ROUND(visitors_in_quarter/days_in_quarter),
  IF(
  days_in_quarter <= 0,
  "Data is pending.",
     "visitors per day: " & daily_visitor_rate
  )
)
```

If your spreadsheets are large and complex, or built by a team of people, you can make a team decision to use a standard comment format. If you use a standard, your team won't have to waste time developing its own commenting conventions. As a Ruby developer, I've repurposed the Ruby comment standard [YARD](https://www.rubydoc.info/gems/yard/file/docs/Tags.md#Tag_List) for use in my more complex sheets.

In conclusion, commenting summarizes and clarifies your formulas, and helps your team members and yourself remember important things about your code.

### Technique 3: Use LAMBDA to organize your code

Let's return to our scenario, calculating the daily visitor rate. Here's where we left off using `LET`:

```sql
=LET(
  visitors_in_quarter, B2,
  days_in_quarter, C2,
  daily_visitor_rate, ROUND(visitors_in_quarter/days_in_quarter),
  IF(
  days_in_quarter <= 0,
  "Data is pending.",
     "visitors per day: " & daily_visitor_rate
  )
)
```

Let's say our fictional supervisor has discovered that the system that sends our spreadsheet the visitor numbers has a bug. Every day, that system over-counts by 10 visitors per day. Here's a table with a few examples.

 | Day in quarter | Visitor count reported by buggy system | Visitor count, actual |
 |-|-|-|
 | 1 | 141 | 131
 | 2 | 170 | 160
 | 3 | 202 | 192

Our supervisor has asked us to display the corrected number, but to also report the un-adjusted numbers so the executives understand what's going on, since they also look at the old system.

So, on day 3 in the above table, we'd expect to see:

```
visitors per day: 161 (adjusted from 171)
```

What a nightmare! Or is it? Can we turn this nightmare into a delight?

When writing formulas, simpler is better. So if you have a complex problem to solve, it's helpful to break it into simpler problems. The practice of solving complex problems by breaking them into smaller and simpler problems is called "decomposition." Each piece will be easier to think about and solve, and then you can compose all the pieces together into the solution.

Let's add the adjusted numbers and rates into our formula.

```diff
=LET(
  visitors_in_quarter, B2,
  days_in_quarter, C2,
+ adjusted_visitors_in_quarter, visitors_in_quarter - (10 * days_in_quarter),
  daily_visitor_rate, ROUND(visitors_in_quarter/days_in_quarter),
+ adjusted_daily_visitor_rate, ROUND(adjusted_visitors_in_quarter/days_in_quarter),
  IF(
    days_in_quarter <= 0,
    "Data is pending.",
    "visitors per day: " & adjusted_daily_visitor_rate & "(adjusted from " & daily_visitor_rate & ")"
  )
)
```

Notice how we do the same rate calculation twice, but with different numbers — we're dividing, then rounding.

It's common practice in software development to try to reduce the amount of duplication. We call it DRY, which stands for Don't Repeat Yourself. We can reduce duplication with `LAMBDA`, a relatively new feature in spreadsheet programs.

In the next code example, we'll add a lambda, then reduce duplicated code by using the lambda instead.

```diff
=LET(
  visitors_in_quarter, B2,
  days_in_quarter, C2,

+ visitor_rate, LAMBDA(visitor_count, ROUND(visitor_count/days_in_quarter)),
  adjusted_visitors_in_quarter, visitors_in_quarter - (10 * days_in_quarter),

+ daily_rate, visitor_rate(visitors_in_quarter),
+ adjusted_daily_rate, visitor_rate(adjusted_visitors_in_quarter),

  IF(
    days_in_quarter <= 0,
    "Data is pending.",
    "visitors per day: " & adjusted_daily_rate & "(adjusted from " & daily_rate & ")"
  )
)
```

We've just created our first lambda! Lambdas are mini-formulas you can use and reuse within a main formula. We've created a lambda named `visitor_rate` that takes any visitor count and divides it by the number of days elapsed. We then use that lambda twice, giving it different numbers to use to calculate the rounded rate.

Let's make one more change, and move the details of how we format or present the rate into its own `LAMBDA`. Moving complexity out of the main body of the formula can help clarify the code. We can trust the body of the code to be the most important part, and then we can go back and read the lambdas if we need to get into the details of how they work.

```diff
=LET(
  visitor_rate, LAMBDA(visitor_count, ROUND(visitor_count/days_in_quarter)),
+ format, LAMBDA(adjusted, original, IF(
+     days_in_quarter <= 0,
+     "Data is pending.",
+     "visitors per day: " & adjusted & "(adjusted from " & original & ")"
+   )
+ ),

  visitors_in_quarter, B2,
  days_in_quarter, C2,
  adjusted_visitors_in_quarter, visitors_in_quarter - (10 * days_in_quarter),
  daily_rate, visitor_rate(visitors_in_quarter),
  adjusted_daily_rate, visitor_rate(adjusted_visitors_in_quarter),
+ format(adjusted_daily_rate, daily_rate)
)
```

Let's annotate this code again using Avdi's story steps. We'll omit some of the code (indicated by "...") for brevity.

```sql
=LET(
  visitor_rate, ...,
  format, ...,

  /* 1. Gather input */
  visitors_in_quarter, B2,
  days_in_quarter, C2,

  /* 2. Perform work */
  adjusted_visitors_in_quarter, visitors_in_quarter - (10 * days_in_quarter),
  daily_rate, visitor_rate(visitors_in_quarter),
  adjusted_daily_rate, visitor_rate(adjusted_visitors_in_quarter),

  /* 3. Handle failure - not relevant */

  /* 4. Deliver results */
  format(adjusted_daily_rate, daily_rate)
)
```

Reading this, we understand that there's a visitor rate step and a format step — but we don't necessarily need to know all the details of them for now.

In conclusion, `LAMBDA` helps you organize and reuse your code, especially in response to changing needs. This helps keep the readers' focus on what's important, and they can always dig into details as needed.


### Bonus technique: Use custom functions to name formulas

Even with our readable code, one problem remains. Every time someone looks at this formula, they have to read 16 lines of code to understand it.

In this case, the easiest-to-read solution would be to name the formula. How about something like, "daily visitor rate"?

With the custom formula creator available in major spreadsheet programs, we can do exactly that.

**In Google Sheets:**

- Right-click on the cell containing the formula
- Click "View more cell actions", then "Define named function"
- Give the function a name like `DAILY_VISITOR_RATE`.
- In "Argument placeholders," add `visitors_in_quarter` and `days_elapsed_in_quarter`.
- In the formula definition, delete the two lines that set those variables. Those variables will now be added directly to the formula, so we don't need the cell references.

```sql
  visitors_in_quarter, B2,
  days_elapsed_in_quarter, C2,
```

Then, save the function.

Now you can replace the formula with the named function:

```sql
=DAILY_VISITOR_RATE(B2, C2)
```

Before, anyone would have to read all the code or comments to understand what was happening. Now, it's probably clear from just the name. And if they need to understand the inner workings of this formula, they can look it up in the list of custom formulas.


### Summary

We started with this:

```sql
=IF(C2 = 0,
  "Data is pending.",
  CONCATENATE("visitors per day: ", TEXT(ROUND(B2 / C2)))
)
```

We're ending with this:

```sql
=DAILY_VISITOR_RATE(B2, C2)
```

And behind that named function is a formula with clear variable names using `LET`, separated components using `LAMBDA`, and comments to clarify the code. This approach is a relatively new option available to us.

Using software design principles and practices, our formula is much easier to read, understand, and change. Future readers will thank us — including ourselves, because we're future readers too!

Code that is easier to read is easier to understand. And code that is easier to understand is easier to change without fear and maintain over time. Go forth and write fearless formulas!
