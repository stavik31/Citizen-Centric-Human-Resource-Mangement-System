---
title: May 7st Meeting Minutes
parent: Schedule and Planning
nav_order: 11
---

Atendees: Everyone

Objectives: Continue development of requirements and ask interview questions


- Andi & Jerry
  - Focused on creating a survey to understand user requirements from their perspective
 
- Everyone else
  - Worked on creating questions for the expert interview
  - Asked proffesor Mate to act as our expert for the interview (quesitons and responses below)
 
- After the interview
  - Received new information regarding what truly is the purpose of this system for the citizens and city managers
  - Received information regarding what statistical analysis methods we can use for the system
  - Hiro, Sushaant, Satvik
    - Look up the models that proffesor Mate suggested
  - Jerry, Andi
    - Continue working on the survey for currently working employees
  - Hikaru
    - Format the questions to be ready to send to out of country expert (Austria)     
 

Question 1: How to classify/categorize types of human capital? Is this the right way, do we need a different kind of classification?
- Will the same coding system work in other countries?
  - Can be applicable to others countries

Question 2: how can we use historical data to predict demand? Can we use linear/polynomial/exponential regression? (is it sufficient)
- Time serious(series?) prediction (can use linear) and .XG boost model (grading boosting models)
- Can be useful to predict demand
  - Not interested in short term but long term
  - Usability depends on frequency 
  - ARIMA model (statistical model). moving average
    - Fast and easy to implement

Question 3: Might not be accurate. SHould we allow smart city managers to overwrite predictions?
- Would only be assistant tools, never tells what to do exactly
  - Many other factors to make choices

Question 4: How can we visualize the data? Would a simple graph (area rane, column range, pie chart) work?
- Know the number itself (and percentage of all areas. Different graphs) and the trend 
- See one by one the relationship between them 
- Core relation between sub SOC codes
  - Identify negative and positive correlations between jobs. Does one job change affect another

Question 5: Explain how to match user info to SOC codes. Would an mapping algorithm be able to make the decision correcly? Is it sufficient?
- Why users need to know what SOC codes are (how help users understand SOC codes)
  - Choose higher level, then go lower and lower (not about code but the names)
  - Can assume the job the person has (not the codes)

Question 6: Are there any pre-trained models that can map CV/job descriptions to job titles/job descriptions?
- Ommited question 6

Question 7: What are possible metrics to use to understand if the system is correct? (KPIs)
- How to tell if we are succeeding
  - How many people try to transfer
  - How many people have success to transfer
    - Be able to see from one point to another (change in job)

Question 8: How to present predictions to the users in a user-friendly way?
- If system is being used then it can be assumed that people do want to shift careers
  - Can outright tell them to move?
    - Important not to force people
    - Show data, data does not lie
    - Need more people vs don't need people (how can we analyze the trend?)
    - Interpretation up to the smart city manager
- To be able to see closely related job trends
  - How to get manual info about trends? (smart city manager?)

Question 9: What can the system provide to the user to get their goal once its identified?
- News articles about specific jobs and related ones
  - Easy way to do for prototype
    - Scrape titles 
    - Calculate cosine similarity between job description and title
      - Word vectors
    - In a priority order using cosine similarity 
    - Can also use keyword finding
      - Keywords for SOC code -> news article
- People want to see offers to target job
  - Up to the user to select scope
- Need to identify what main skills needed for a job, then connect to training/certifications
  - Skills linked to certifications

Question 10: How can we organize learning resources for users?
- How to flow from finding the job to getting the skill
  - Show everything from the start (certifications and learning resources)
    - Managers want to see data 
    - Want to see what resources used to get towards that job
    - Manager should not be able to know specific people 

Overall Missed Points
- Need to show statistics for almost everything
  - From what job to another job (trend) -> percentage?
    - Visualization good to have but not critical 
- Visualization idea
  - Visualize soc codes in a map
    - Location important (encrypt)
    - Make privacy features as optional as possible
  - As a manager
    - Info about how many people might use system (agriculture < IT)
    - Who doesn't use it as well
