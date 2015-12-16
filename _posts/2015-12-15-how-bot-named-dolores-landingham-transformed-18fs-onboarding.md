---
title: "How a bot named Dolores Landingham transformed 18F’s onboarding"
date: 2015-12-15
authors:
- jessie
tags:
- onboarding
- how we work
excerpt: "
Over the past few months, we’ve released several products — including checklists, a handbook, and classes — to help new hires orient themselves to 18F.

By far the most successful onboarding item we’ve released is a Slack bot that sends scheduled messages to new hires so that they don’t experience information overload during their first week."
description: "By far the most successful onboarding item we’ve released is a Slack bot that sends scheduled messages to new hires so that they don’t experience information overload during their first week."
image: /assets/blog/onboarding/landingham-slack.jpg
---
Over the past few months, we’ve released [several products](https://18f.gsa.gov/2015/12/01/how-we-dramatically-improved-18fs-onboarding-process-in-3-months/) — including checklists, a handbook, and classes — to help new hires orient themselves to 18F.

By far the most successful onboarding item we’ve released is a Slack bot that sends scheduled messages to new hires so that they don’t experience information overload during their first week.

[Mrs. Landingham](https://github.com/18F/dolores-landingham-bot), as the bot is affectionately called, drips out all kinds of information to new hires, like how to fill out forms, participate in discussions, and learn what certain terms mean. As the lead developer on Mrs. Landingham, I want to share how we developed the concept and built the bot, and detail where we plan to go next.

## Developing the concept for the Mrs. Landingham MVP

In keeping with our [agile methodologies](https://18f.gsa.gov/2015/11/20/how-we-use-a-lean-approach-to-product-design/), we started development of the Slack bot by discussing the absolute minimum feature set required to get Mrs. Landingham up and running.

The problem we were aiming to solve was simple: We wanted to prevent information overload for new 18F employees. The solution? We weren’t sure exactly, but Slack felt like the right medium for the job because:

1. Slack is the primary medium for communication at 18F.

2. Receiving a message on Slack feels more fun and immediate than other mediums, such as email, which would help with our goal of “not stressing out new employees.”

3. Developing a Slack bot would provide opportunities down the line for interesting experiments, such as allowing employees to reply to the bot with questions (and receive answers!).

4. We wanted a way to automate and then trickle out messages so that new hires were not overwhelmed during their first days and Slack direct messages (DMs) seemed like they would work well.

For the MVP, we decided that the simplest solution possible was to set up a small Rails app with a database for storing new employee Slack names, start dates, and scheduled messages. We decided to use Rails instead of a lighter framework because we also planned to create a frontend web interface for our 18F colleagues to add and edit information without needing to understand Ruby or Git.

Each scheduled message would have a “day” associated with it. One message would be for “day 1,” one for “day 2” and so on. Once per day, the app would run a job that would match employees and messages based on the “day” of the message and the start date of the employee and the Slack bot.

## Naming the bot

Naming is a fun and important step for any project. 18F already had a Slackbot named “slackbot”, so that name was out. We started bouncing around names, from “Onb04rd1ngb0t3000” to “Siri” to “Joanne” — but nothing felt right.

Then, Greg Boone suggested “Landingham”, which was immediately greeted with a heart-eyes emoji reaction. There are many [West Wing](https://en.wikipedia.org/wiki/The_West_Wing) fans at 18F, and something felt right about bringing back the beloved character Dolores Landingham, who served as fictional President Bartlett’s wise and sometimes ornery secretary, to guide new employees through the turbulent waters of onboarding.

![Screenshot of Dolores Landingham being named.](/assets/blog/onboarding/landingham-slack.jpg)

Voila! `Mrs. Landingham` was born.

## Building the bot

We’ll spend the next section talking about bot development. If you’d like to go directly to our future plans, [skip ahead to the "A future for Mrs. Landingham" section."](#a-future-for-mrs.-landingham).

In the [Ruby section on the Slack integrations page](https://api.slack.com/community#ruby), there are dozens of examples of Slack integrations, though none specifically addressed drip campaigns. (A drip campaign is when messages are sent to users based on a schedule or trigger event, such as number of days after being added to a Slack bot.) This meant we would have to build something from scratch rather than clone and edit an existing bot.

To handle our Slack API integration, we chose the [Slack Ruby Client gem](https://github.com/dblock/slack-ruby-client), a tool for handling Slack’s web and real time messaging APIs. To start, we [added a new bot user](https://api.slack.com/bot-users) to the 18F Slack organization and configured the gem using the API token for the bot user.

```ruby
 # Gemfile

gem 'slack-ruby-client'

group :test, :development do
  gem 'dotenv'
end
```

```ruby
# .env

SLACK_API_TOKEN='DOLORES_BOT_API_TOKEN'
```

Next, we started work on our database. The two database tables required for a drip campaign bot are `employees` and `scheduled_messages`. The bare minimum fields for `employees` are `slack_username` and`started_on`: the first is so the bot knows who to direct message, and the second is so we know where in the drip campaign an employee is located.

```ruby
# db/migrate/20150917233323_create_employees.rb`

class CreateEmployees < ActiveRecord::Migration
def change
  create_table :employees do |t|
    t.timestamps null: false
    t.string :slack_username, null: false
    t.date :started_on, null: false
    end
  end
end
```

```ruby
# db/migrate/20150918175357_create_scheduled_messages.rb`

class CreateScheduledMessages < ActiveRecord::Migration
  def change
    create_table :scheduled_messages do |t|
      t.timestamps null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :days_after_start, null: false
    end
  end
 end
```

For our first iteration, we decided we would run a task once per day that would send out messages to employees. This meant iterating through each message and figuring out which employees should receive that message based on their start date:

```ruby
# app/services/message_sender.rb

require "slack-ruby-client"

class MessageSender
  def initialize
    configure_slack
  end

  def run
    ScheduledMessage.all.each do |message|
      employee_slack_usernames_for_messages = find_employees(message)

      employee_slack_usernames_for_messages.each do |slack_username|
        channel_id = SlackChannelIdFinder.new(slack_username, client).run

        client.chat_postMessage(
          channel: channel_id,
          as_user: true,
          text: message.body
        )
      end
    end
  end

  private

  def configure_slack
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end
  end

  def find_employees(message)
    MessageEmployeeMatcher.new(message).run
  end

  def client
    @client ||= Slack::Web::Client.new
  end
end
```

```ruby
#app/services/message_employee_matcher.rb

Class MessageEmployeeMatcher
  def initialize(message)
    @message = message
  end

  def run
    Employee.where(started_on day_count.days.ago).pluck(:slack_username)
  end

  private

  attr_reader :message

  def day_count
    message.days_after_start
  end
 end
```

One of the trickiest parts of writing this code was figuring out how to send a message to a user as a direct message. Sending a direct message via the Slack API is exactly the same as sending a message, except that the ID of the channel is the ID of the direct message channel between the bot user and another Slack user. When sending a message to a regular channel, you can just use the name of the channel. For example, you could send the message “Hello world” to the general Slack channel of your organization like this:

```ruby
client.chat_postMessage(
  channel: "general",
  text: "Hello world"
)
```

When you want to send a direct message to a user, you cannot just set the channel as their Slack username. Instead, you must open an “IM” (the Slack API method for opening a direct message is `im_open`) with that user and find the ID of the IM channel. We wrote a small service class to do this:

```ruby
# app/services/slack_channel_id_finder.rb

class SlackChannelIdFinder
  def initialize(slack_username, client)
    @slack_username = slack_username
    @client = client
  end

  def run
    slack_user_id = slack_user["id"]
    chat = client.im_open(user: slack_user_id)
    chat["channel"]["id"]
  end

  private

  attr_accessor :client, :slack_username

  def slack_user
    all_slack_users.find { |user_data| user_data["name"] = slack_username }
  end

  def all_slack_users
    client.users_list["members"]
  end
end
```

Once we had our class that found the correct message to send to each employee, we needed a way to automatically run the task once per day. We chose [Clockwork](https://github.com/tomykaira/clockwork) for the job:

 ```ruby
# Gemfile

gem "clockwork"
```

```ruby
# config/clock.rb

require "clockwork"
require_relative "boot"
require_relative "environment"

module Clockwork
  every(1.day, "scheduled_messages.send", at: "19:30", tz: "UTC") do
    puts "Sending scheduled messages"
    MessageSender.new.run
  end
end
```

Since we were deploying Mrs. Landingham to [cloud.gov](https://cloud.gov/), we updated our `manifest.yml` instructions to run `script/start`:

```yml
# manifest.yml

domain: 18f.gov
command: script/start

# environment-specific configuration
applications:
- name: dolores-app
buildpack: https://github.com/cloudfoundry/ruby-buildpack.git
memory: 1GB
env:
DEFAULT_URL_HOST: dolores-app.18f.gov
RESTRICT_ACCESS: true
```
and set up `script/start` to run foreman:

```sh
# script/start

#!/bin/sh

set -e
set -x

bin/rake cf:on_first_instance db:migrate
foreman start -p $PORT
```

and added a clock process to our `Procfile`:

```sh
# Procfile

web: bundle exec puma -p $PORT -C ./config/puma.rb
clock: bundle exec clockwork config/clock.rb
```

If you are deploying an app with Clockwork to Heroku, the Clockwork README has a nice [quickstart script](https://github.com/tomykaira/clockwork#quickstart-for-heroku).


## A future for Mrs. Landingham

Once we established Mrs. Landingham’s basic functionality, we started creating content and onboarding employees with the messages. And it wasn’t just new employees who received the new messages. Employees who started working at 18F months or even years ago started requesting to be added to the bot, since the messages contained valuable information.

Soon enough, we realized small enhancements would improve the functionality even more. We added support for employee time zones and the ability to send messages multiple times per day. We also added tagging capabilities to make it possible for employees to subscribe to a certain type of message, such as “benefits” or “legalstuff,” without receiving every single message in the system.

Looking forward, we have a lot of exciting ideas for how Mrs. Landingham could be even more helpful to 18F’s employees, new and old. You can check out some of the ideas on [GitHub](https://github.com/18F/dolores-landingham-bot/issues).

## Feedback

In addition to the positive reaction to Mrs. Landingham internally, we’ve heard from many other organizations that they would also like a Slackbot drip campaign for new employees. Like everything we build at 18F, [Mrs. Landingham’s code](https://github.com/18F/dolores-landingham-bot) is open source and available for anyone who would like to use or adapt it for their needs.

Mrs. Landingham’s primary contributors so far have been [Brian Hedburg](https://github.com/gemfarmer), [Carlo Costino](https://github.com/ccostino), and myself. We welcome any outside [contributions](https://github.com/18F/dolores-landingham-bot/blob/master/CONTRIBUTING.md) and hope that others who find Mrs. Landingham useful will send code for exciting features our way so that we can all continue to create a better onboarding experience together.
