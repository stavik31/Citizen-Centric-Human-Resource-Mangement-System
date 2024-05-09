---
title: 2024-05-08 Expert Interview Questions
author: Hikaru, Jesse
---

For the purposes of this interview, we would like you to act as a smart city manager who is responsible for managing human capital in your city. 

We are proposing a system that will assist in the process of reskilling citizens to fit occupational demand in an administrative region. To achieve this goal, we are looking to implement the following capabilities:

* Present data to smart city managers to assist them in making decisions regarding demand for different occupations
* Allow smart city managers to set demand targets for each occupation category
* Allow citizens to sign up, input their current occupation, and view information about reskilling (demand, skill overlap, news, educational material, etc)
* Report citizen engagement with various elements of the site back to the smart city managers so they can better understand how people are transitioning between fields

For the purpose of occupation categorization, we are looking to use US SOC codes, which are a hierarchical system for classifying jobs. For example:

00-0000 - Top level code, all occupations
15-0000 - Computer and mathematical occupations (first 2 digits, major group)
15-2000 - Mathematical science occupations (third digit, minor group)
15-2050 - Data Scientists (fourth and fifth digit, broad occupation)
15-2051 - Data Scientists (sixth digit, detailed occupation)

Each level comes with detailed descriptions and short titles that we believe are applicable and complete for all countries, not just the US. For further reference, the 2018 standard is described [here](https://www.bls.gov/soc/2018/)

Given that context, we would like to ask you a couple of questions to help formulate requirements to achieve our stated vision.

## 1. What kind of information do you need to make an informed decision about occupational demand?

We currently plan to support the following data for each occupation code. Are these sufficient, are any of them inappropriate, and do you have any suggestions for information that we missed?

* Chart of time series forecasted labor trends based on historical employement data
* Correlation between different occupations based on the above historical data (does job A seem to follow job B, etc)
* Number of citizens engaging with the system that self identify as a specific occupation
* What occupations are citizens of a specific occupation trying to learn about (are data scientists trying to reskill as programmers, or farmers)
* What occupation do citizens that engage with a specific occupation currently hold (who wants to transition to data science? programmers or database admins?)
* News articles related to the specific occupation

## 2. What kind of information would be helpful for citizens to decide which occupation to reskill towards?

Currently, we plan to emphasize occupations in the same minor group as their current job (from above, this would group all mathematical science occupations together) in a summary view. For each occupation, we plan to show a brief description, summary of the historical trend, the percentage difference between the most recent worker count and the city managers' estimated demand, and a link to learn more.

What other information would be useful for citizens in this summary view (i.e., what is the most important information for them at a glance)

If the user clicks to learn more, we would then open a more detailed view on the occupation. This view would present them with news articles, courses, certifications, and job postings related to the selected occupation.

What other resources would be useful for citizens who are interested in reskilling?

## 3. How can we measure whether or not the system is helpful?

What key performance indicators can we capture to gauge success?
