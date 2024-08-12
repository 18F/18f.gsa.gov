---
title: "Measuring culture on our engineering team"
date: 2019-10-29
authors:
- amy-mok
- alex-soble
- peter-burkholder
tags:
- culture
- tools you can use
excerpt: "To be inclusive and effective, a team needs a culture where everyone is
respected, treated fairly, and feels that they belong. We don’t see this
diversity, equity, and inclusion work as a “nice-to-have” or optional."
image: /assets/blog/culture-climate-survey-2019/header.png
---

As a team of public servants, one of our key values at 18F is to
[reflect the diversity of the public we
serve](https://handbook.18f.gov/tts-history/#our-values). To be
inclusive and effective, a team needs a culture where everyone is
respected, treated fairly, and feels that they belong. We don’t see this
diversity, equity, and inclusion work as a “nice-to-have” or optional —
it is a fundamental for a strong team, one where everyone is
contributing to the best of their abilities.

These fundamentals are borne out from research on effective teams.
Google’s Project Aristotle demonstrated that the most effective teams instill psychological
safety and inclusivity. High-performing software-delivery organizations have cultures built on
learning from mistakes, welcoming innovation, and supporting inquiry.

Within the 18F engineering team, we decided that we wanted to take a
baseline on these important aspects of team culture. So we set about
organizing our 2019 culture and climate survey.

The 18F engineering chapter has been running internal climate surveys
since at least 2016, but most of the questions were in yes/no format. We
wanted to improve on this in 2019 and bring in more data reflecting
what’s known about optimal team environments, diversity, and inclusion.

## What did we choose to measure and why?

Designing a survey is hard work. We’re not psychometricians by any
stretch, but we decided to devote some of our [eight hours a
week](https://handbook.18f.gov/tock/#how-many-hours-am-i-expected-to-bill-per-week)
of non-billable time to develop and usability test a short culture and
climate survey. Members of 18F’s engineering team who lead our DevOps
guild worked with teammates focused on diversity and inclusion to expand
what we were asking and how we could use the answers.

We set out to do more research about what has been done by others in the
field, and borrow or adapt the best and the most relevant questions from
other surveys. We ended up adopting questions from a mix of sources: the
annual Accelerate State of DevOps report, CultureAmp, Google’s Project
Aristotle, and past 18F engineering surveys.

We ended up [with 21 statements about team
culture](https://gist.github.com/alexsoble/305714b7f9bd4bc13af3cc69895b770e)
— covering topics from team dynamics (“I feel like I belong on this
team”) to individual satisfaction and growth (“I feel I am growing as an
engineer”). We iterated on the questions and improved the wording
through usability testing with volunteers from our engineering chapter.

For each question, we asked engineers to rate themselves on a scale from
1 (“Strongly Disagree”) to 7 (“Strongly Agree”). At the end of the
survey, team members had the option to give their name if they wanted to
share their responses with their supervisor, but could remain totally
anonymous if they preferred.

We also let participants self-identify as belonging to a group or groups
that are under-represented in technology. We didn’t want to ask about or
store sensitive demographic or personally identifiable information as
part of our survey, but we did want to be aware of differences. Giving
people the option to self-identify — but not choosing from a pre-written
list of specific groups or identities — felt like the right balance.

## What were the results?

When we analyzed the responses, we found results that made us proud, and
others that showed where our culture needs improvement. Some questions
had dramatically positive results:

<div aria-hidden="true">
{% image "assets/blog/culture-climate-survey-2019/chart-easy-to-ask-for-help.svg" "Chart - 'It is easy to ask other members of this team for help'" %}
</div>

<table class="usa-sr-only">
  <caption>
    "It is easy to ask other members of this team for help." (1 means "Strongly Disagree", 7 means “Strongly Agree,” trend: 7.)
  </caption>
  <tbody>
    <tr>
      <th scope="row">Score</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th scope="row">How many responses?</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>4</td>
      <td>15</td>
    </tr>
  </tbody>
</table>

<div aria-hidden="true">
{% image "assets/blog/culture-climate-survey-2019/chart-contrary-opinion.svg" "Chart - 'On this team, I can voice a contrary opinion without fear of negative consequences'" %}
</div>

<table class="usa-sr-only">
  <caption>
    "On this team, I can voice a contrary opinion without fear of negative consequences." (1 means “Strongly Disagree”, 7 means “Strongly Agree, trend: 7.”)
  </caption>
  <tbody>
    <tr>
      <th scope="row">Score</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th scope="row">How many responses?</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>2</td>
      <td>8</td>
      <td>1</td>
    </tr>
  </tbody>
</table>

Other questions also showed strengths, but with more room for
improvement — trending at 5 instead of 7.

<div aria-hidden="true">
{% image "assets/blog/culture-climate-survey-2019/chart-satisfied-with-my-work.svg" "Chart - 'I am satisfied with my work'" %}
</div>

<div class="usa-sr-only">
</div>

<table class="usa-sr-only">
  <caption>
    "I am satisfied with my work." (1 means “Strongly Disagree”, 7 means “Strongly Agree, trend: 5.”)
  </caption>
  <tbody>
    <tr>
      <th scope="row">Score</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th scope="row">How many?</th>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>6</td>
      <td>5</td>
    </tr>
  </tbody>
</table>

<div aria-hidden="true">
{% image "assets/blog/culture-climate-survey-2019/chart-growing-as-engineer.svg" "Chart - 'I feel I am growing as an engineer'" %}
</div>

<table class="usa-sr-only">
  <caption>
    "I feel I am growing as an engineer." (1 means “Strongly Disagree”, 7 means “Strongly Agree, trend: 5.”)
  </caption>
  <tbody>
    <tr>
      <th scope="row">Score</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th scope="row">How many?</th>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>5</td>
      <td>10</td>
      <td>5</td>
      <td>1</td>
    </tr>
  </tbody>
</table>

When we analyzed the data through the lens of self-identified status as
belonging to an under-represented group in technology, we saw important
patterns.

For example:

<div aria-hidden="true">
![Chart - 'Administrative or clerical tasks that don’t have a specific owner are
fairly divided"]({{ "/assets/blog/culture-climate-survey-2019/chart-administrative-tasks-fairly-divided.svg" | url }})
</div>

<table class="usa-sr-only">
  <caption>
    “Administrative or clerical tasks that don’t have a specific owner are fairly divided.” (1 means “Strongly Disagree”, 7 means “Strongly Agree.”)
  </caption>
  <tbody>
    <tr>
      <th scope="row">Score</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th scope="row">How many? (Self-ID as well-represented in tech.)</th>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>1</td>
      <td>4</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th scope="row">How many? (Self-ID as under-represented in tech.)</th>
      <td>0</td>
      <td>2</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>2</td>
      <td>2</td>
    </tr>
  </tbody>
</table>


The data showed us that different teammates had different perspectives
on how fairly tasks were being divided in the organization. And the two
responses furthest in the “Disagree” direction both came from teammates
who self-identified as underrepresented in technology. These data points
showed us clear areas where we needed to take action and try to improve
elements of our team culture.

## What did we do with the information?

After we gathered and synthesized all of the survey results, we started
to share and further discuss them with the engineering chapter.

-   We started by presenting the results to the engineering leadership team.
-   We then hosted an all-hands team meeting to share and discuss the results with everyone on the team.
-   We also brainstormed possible actions to take based on the results. For example:
    -   We [made changes to our organization’s Handbook](https://handbook.18f.gov/leading-projects/#rotating-tasks-among-teammates) to capture recommendations on how teams can work better by rotating administrative tasks.
    -   Since we saw some room to improve on “I am growing as an engineer,” we decided to turn our 2019 in-person engineering team gathering into an internal engineering conference.
-   Finally, when we saw responses or answers in the survey that concerned us and the respondent chose to include their name, we followed up to learn more about their particular situation and what we could do to help.

## What did we learn along the way?

Here are three key takeaways to keep in mind if you decide to run your
own culture and climate survey:

1.  Implementing a good survey doesn’t have to take too much time for respondents to complete. Our usability testing showed that the survey only took about five minutes, but the amount of information we got from the survey was tremendous.

2.  Consider letting team members anonymously self-identify as belonging to under-represented groups in technology. This can give you a more nuanced understanding without asking teammates potentially sensitive questions about their identities.

3.  Follow-up actions are key. Make sure to plan time when the entire team can gather to share and discuss the results of the survey. Consider what actions you will take to address what you find before sending the survey.

We see the survey as one way to create a space for discussion. We have continued to share what we’ve learned with other parts of the organization. And we will keep exploring ways to maintain and improve our engineering team culture.

<br/>
<br/>
