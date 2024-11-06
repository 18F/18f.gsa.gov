---
date: 2022-11-14
title: >
  Improving inclusion, continuously: how we iterated on our bot to promote more
  inclusive and thoughtful language
authors:
  - anne-petersen
  - michael-walker
tags:
  - culture change
  - inclusion
excerpt: >
  In 2015, TTS created a Slack bot to help us use more inclusive language. Over time, we found this bot could use some improvements. So starting in 2019, we
  began conducting research and iterating on our bot to further our goal of
  a welcoming, inclusive culture.
---

## Background and history

In 2015, people working at 18F noticed their colleagues using the word “guys” to
describe groups of people. An effort began to consider ways to nudge colleagues
into using more inclusive language. The effort’s goal was not to shame or
penalize anyone, but to encourage everyone to be more thoughtful and intentional
with their words. The result was a simple [customization of our internal Slack
chat’s Slackbot]({{ "/2016/01/12/hacking-inclusion-by-customizing-a-slack-bot/" | url }})
auto-response: whenever it saw the word “guys,” it would respond and ask if the
person meant something else, such as “friends” or “y’all.”

{% image "assets/blog/inclusion-bot/legacy-guys-bot.png" "Screenshot of the legacy Slackbot response. It says, Did you mean y'all? and includes a link to learn more about the response." %}

Telling the stories of our work through avenues such as our blog is an important
way we adhere to our core values like working in the open and scaling our impact
beyond those we are fortunate enough to partner with directly.  This is one
example, among many, of our internal practices that have helped us grow as an
organization. 

Over the years, the bot’s automatic nudge became known informally as “guys bot,”
and it stuck with us, dutifully doing its job until we made some changes to it
in 2020.

## Shortcomings and iteration

Over the years, we observed that our “guys bot” was far from perfect. The bot
would respond publicly, and some people felt that a public call-out was shaming.
It was absolutist, responding to any type of ‘guys’ reference, which meant it
flagged some language accidentally, like conversations about businesses or shows
with the word “guy” in their names or even discussions about the bot itself. The
bot offered suggestions that relied on cultural references, which were confusing
to those not familiar with those particular movies or songs. 

At the time of the bot’s development, Slack’s built-in Slackbot offered few
customization options, so we could not address the accidental/erroneous
responses. TTS has a separate custom Slack bot called
[Charlie](https://github.com/18f/charlie), which provides a variety of
interactive functionality, such as looking up government codes used to identify
offices, reminding people to fill out their timesheets, and scheduling random 
teammates for virtual coffees to build team cohesion and community. With
Charlie’s flexibility, we realized we could begin addressing the erroneous
responses from “guys bot” by migrating it from a built-in Slack auto-response
to a Charlie behavior. 

In 2019, the TTS Diversity Guild began gathering feedback and building an
outline of what a brand new, less limited “guys bot” might look like. The
“guys bot” was ported entirely to Charlie in 2020, and we collaboratively
refined its behavior. Initially, Charlie was provided with a list of phrases to
ignore, so lunch plans or afternoon tea breaks wouldn’t prompt nudges. We also
taught Charlie to ignore the word “guys” in quotes, so we could talk about the
bot without triggering the bot. Pretty soon, we realized that we could introduce
a lot more language nudges than just “guys,” and we renamed “guys bot” to
“Inclusion Bot.”

With Inclusion Bot now in service, we quickly began to get feedback. People
still sometimes felt called out, and they were often unsure why the bot was
suggesting different language. To help with these concerns, we updated the bot
so that only the person who triggers it will see a response. The Inclusion Bot
also adds an emoji to the original statement, signifying that it has responded:

{% image "assets/blog/inclusion-bot/bot-response.png" "Screenshot from a Slack conversation with Charlie Demonstrata (he/him; DC) and the Inclusion Bot. Charlie says, Hey guys! Just wanted to let you know this project was being grandfathered into the previous structure. Inclusion Bot responds with a private message that's only visible to Charlie: Hello! Our inclusive TTS culture is built one interaction at a time, and inclusive language is the foundation. This bot helps us practice our inclusive values here in TTS. Some of your message could be unintentionally non-inclusive. Here are some alternatives that might work better: Insteat of saying grandfathered, how about included retroactively? Instead of saying guys, how about folks? You can view the full list of words and phrases this bot watches for. There's also a Why this suggestion? button for more information." %}

Additionally, we added a button that users can click to get more information
about why the highlighted words or phrases can be problematic:

{% image "assets/blog/inclusion-bot/bot-info-popup.png" "Screenshot of Inclusion Bot sharing information about the words guys and grandfathered. The first paragraph reads: 'Guys' is commonly used to refer to groups of people, but it is a gendered pronoun. It can make people who do not identify as 'guys' feel excluded, even if that's not the intent. Regardless of cultural background or innocent intent, we recommend alternative language that makes it clear everyone is included in the conversation! Consider a word like y'all or folks instead! The second paragraph says: 'Grandfathered' arose from voter restrictions that prevented Black people from voting. We want to avoid slavery and racist oppression references. The third paragraph says: See our blog post for more information about this bot." %}

## Why it matters to TTS

The [TTS Handbook](https://handbook.tts.gsa.gov/about-us/tts-history/#our-values)
lists inclusion as our top value, and the original bot was inspired by our
desire to increase everyone’s sense of belonging by not using a gendered term to
refer to broad groups of people. The Inclusion Bot furthers that goal, and even
reflects this critical organizational value right in its name. As our
[Code of Conduct](https://handbook.tts.gsa.gov/about-us/code-of-conduct/) states:

> We strive to create a welcoming and inclusive culture that empowers people to
> provide outstanding public service. That kind of atmosphere requires an open
> exchange of ideas balanced by thoughtful guidelines.

Inclusion Bot is a tool that we use to help us find and maintain that balance by
gently letting us know when we use language that can be hurtful or un-inclusive,
without being intrusive or stopping a conversation. We want to create an
environment where everyone feels safe to contribute, and that means being
mindful of how we say things.

Learning about inclusive and caring language is important, but it can also be
difficult. The bot makes this a little easier by educating us at the moment we
use potentially hurtful language, and teaching us about words and phrases that
many of us didn’t know have troubling roots, such as
“[grandfathering](https://github.com/18F/charlie/blob/main/InclusionBot.md#racist:~:text=Jargon%20for%20more.-,grandfathered,-legacy%0Aincluded%20retroactively).”

## Where we are now

With a few years of iteration on Inclusion Bot in our pocket, we now have a
public, open source
[list of the words and phrases](https://github.com/18F/charlie/blob/main/InclusionBot.md)
the bot is listening for and an active community contributing to the list,
refining not just what language we want to be thoughtful about but also how we
want to educate ourselves about that language. Anyone (including you!) can make
suggested changes directly to the word list through the GitHub repository. Once
changes have been approved and merged, the additions will appear in the bot immediately.
The goal is to make maintaining and modifying the bot as accessible and
inclusive as possible, in the spirit of the bot itself.

We’ve also spent more time thinking about automated responses and reconsidering
how people engage with them. We learned that newcomers to TTS often perceived
bot messages as potentially punitive. To help address this, we now introduce new
staff to Inclusion Bot as part of their initial onboarding. We want everyone to
understand and value the bot as one tool to help us build a thoughtful,
inclusive organization. 

Inclusion Bot is not a language policing tool, nor is it a disciplinary tool.
The bot cannot understand context – it is a blunt instrument. As a result, we
offer it as a tool to help TTS staff identify accidental non-inclusive or
hurtful language. It is meant to help us learn. Intentionally harmful or
exclusionary language is a matter for management to address, not a bot.

## Future

TTS is an iterative organization, and the Inclusion Bot will continue to evolve,
as it reflects changes in language. We’ll continue to research and observe how
people engage with and understand the bot. And we always welcome feedback, even
from people who aren’t in TTS! Do you have ideas on how we could make the bot
even better? Feel free to share them with us on our
[GitHub discussions](https://github.com/18F/charlie/discussions/categories/inclusion-bot)!
