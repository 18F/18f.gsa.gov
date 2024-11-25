---
title: "Ask 18F - How can I best advocate for the addition of open-source tools?"
date: 2019-02-06
authors:
- andrew-burnes
- tadhg
tags:
- ask 18f
- open source
excerpt: " Ask 18F is an advice column that answers questions sent in by federal employees. In this edition, two of our enginners share how to best advocate for the addition of open-source tools in the analytics space."
---

*Ask 18F is an advice column that answers questions sent in by federal employees. Our technical experts aim to provide you helpful resources and a good starting point to tackle your problem. Got a question? No matter how small the task or how big the project, email us at [18f@gsa.gov](mailto:8f@gsa.gov).*

**Dear 18F: How can I best advocate for the addition of open-source tools? The leading tools in the analytics space (R and Python) are both open-source tools that are not currently supported at my agency.**

**Andrew Burnes with contributions from Tadhg O'Higgins – Engineers**

Before joining 18F, I ran into the same conundrum doing geographical analysis at two different agencies within the U.S. Department of Agriculture and the U.S. Department of the Interior. How do you use these great tools when your agency is unaware of their capabilities? Your best shot will be a two-pronged approach:

- Champion the capabilities of these tools for management
- Minimize their risk for IT

The best way to present your case is using these tools through [Jupyter Notebooks](https://jupyter.org).

Jupyter Notebooks are interactive applications that let you create and share live code, visualizations, and text via published web pages. You can work in different languages, such as Python or R, to write code for data transformations, graphs, statistical analysis, machine learning, and more. Their portability allows you to install Jupyter on your computer or start a [new notebook from your web browser](https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-Notebooks) — no setup required! This is the best way to start using these open source tools with a ton of public notebooks available to copy, adapt, reuse, and inspire.

Getting support from your supervisor or management is the first step. Scroll through Jupyter’s gallery of notebooks to find your favorite examples of published notebooks to show off their full capabilities. (As a former geographer I like this [census example](https://anaconda.org/jbednar/census/notebook)!) Notebooks provide intuitive access to reports, reproducible analysis, portability, and streamlined data updates so analysts can collaborate and focus on outputs while management doesn’t have to email you for reports.

Step two is to get IT on board. Jupyter and supporting open source tools can be installed locally on your Windows, Mac, on Linux computer. If your IT group is averse to installing open source software to a network
connected device, companies like [Microsoft](https://notebooks.azure.com/), [Google](https://research.google.com/colaboratory/unregistered.html), and [others](https://github.com/markusschanta/awesome-jupyter#hosted-notebook-solutions) provide cloud hosted solutions to get started analyzing and publishing notebooks instantly.

Jupyter makes working with R and Python super useful and really fun. It’s the best medium for building your own analysis, and it seems hard for someone to deny that.

These two steps will hopefully provide a way to demonstrate the power and usefulness of Python, R, and their ecosystems, and once your organization comes to appreciate these capabilities it should be easier to advocate for further forays into the open-source realm. Best of luck!

Additional resources:

- [A curated list of Jupyter libraries, tools, and resources](https://github.com/markusschanta/awesome-jupyter)
- [Probabilistic Programming and Bayesian Methods for Hackers](https://github.com/CamDavidsonPilon/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers)
- [Notebooks using machine learning to create music](https://magenta.tensorflow.org/demos/colab/)

[Read more answers from the Ask 18F column.]({{ "/tags/ask-18f/" | url }})
