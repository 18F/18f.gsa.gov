---
title: We built server monitoring in a day
authors:
  - matt-cloyd
  - john-skinner
  - magdaline-derosena
  - ethan-marcotte
excerpt: |
  We needed to know when our server went down, so we built our own monitor — in a day.

---

Our partners at one government agency experience periodic internet outages at one of their rural data centers. They would sometimes get emails from users who encountered problems during the outages, but our partners didn't have a good way to reliably know when their servers went down — until 18F stepped in.

We're working on a root-cause solution — deploying to the cloud, avoiding the need for rural data centers. But our partner's immediate need was to know when their servers were down, so they could take corrective actions quickly.

We considered procuring commercial server monitoring services. But that would mean we'd have to do a marketplace analysis, draft and publish a solicitation, go through a contracting process, and set up full-fledged server monitoring. Why go through a whole procurement and pay for features beyond our immediate needs, when we only need a simple monitor to see if the server is up or down?

So, we thought some more, and someone asked — _"why not make it a spreadsheet"_? What if we ran a script that would check if the server is up or down, and log the status in a spreadsheet? From there, we'd figure out how to automatically read the spreadsheet, and alert the team when the server went down.

We iterated on this solution idea a few more times, and landed on the following solution.

1. Every fifteen minutes, run a script to see if the server is up or down. We decided to use GitHub Actions to run the script at no cost.

2. Log the server status, the HTTP response code (for a little extra detail), and the current time in a plain text log file, also hosted for free on GitHub.

The log file looks like this:

```
timestamp                 | http | up_or_down
2024-12-04T00:00:00-05:00 | 200  | up
2024-12-04T00:15:00-05:00 | 200  | up
2024-12-04T00:30:00-05:00 | 503  | dn
```

3. In the same script on GitHub Actions, check if the server has just gone down (or just come back up). We do this by comparing the last two lines of the log file.

4. If the status has changed, we send a notification through GitHub to the team to let them know. Our team members receive emails for GitHub notifications, so they're notified in near real time.

5. We host a webpage using GitHub Pages, also for free, to show the current server status and recent status history. This page reads the last 24 hours of history and shows [a nice monitor page](https://doi-os-orda.github.io/uptime/).

![Screenshot 2025-01-29 at 5 11 26 PM](https://github.com/user-attachments/assets/cafb0c48-ab73-420a-ba6a-08fb1e4bd76e)


We developed a working solution in less than one day. We refined it over the next few weeks: we brought it into alignment with Section 508 / WCAG accessibility guidelines, improved the overall look, and clarified the content based on user feedback.

We also discovered that one component we wanted to monitor was not accessible over the public internet, and ran in a Windows environment. This meant that we couldn't reach the component using our GitHub Actions script, nor could we use the Unix-based GitHub Actions script on a Windows operating system. So, we worked with our partner to adapt the script to run on a Windows server, allowing us to monitor the complete system.


### Fast facts

**Procurement cost**: None.

**Labor cost**: Negligible. Required significantly fewer hours than would have been needed for a procurement.

**Time**: About a day for basic working software. It's been described by one team member as "maybe the fastest delivery that's ever happened on a partner project".

Since this is open-source software, any government agency already using GitHub Pages has everything they need to set up no-cost server monitoring and alerting. All they have to do is copy the code and change a few configuration details.

We designed the software to be very simple and therefore easy to read. Theoretically, anyone in the country with a basic knowledge of HTML and JavaScript could use this to monitor their website. 


### Questions engineers might have

**Won't the file you're logging to become huge?** Checking the server status every 15 minutes, it will take about 40 years before GitHub starts warning us that the file is getting too large. It will take 80 years for the file to reach GitHub's file size limits.

**Won't it take a long time to read the log file once it becomes large?** Nope! Every time we log the server status, we copy the last 24 hours of logs to a separate smaller file. This keeps the page load zippy!

**What frameworks did you use?** We used zero frameworks! The current version is about 300 lines of hand-coded HTML, CSS, and JavaScript, with no frameworks. We use one CSS reset stylesheet, and that's it.

