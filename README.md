---
title: "Virga Labs Data Fellow Work Product"
author: "Maria Sevillano"
date: "02/06/2022"
output: html_document
---

As part of the Virga Labs data fellowship interview process, a work request has been proposed to assess candidate's technical abilities. The following prompts were proposed:

1.  Provide an example of the most complex data analysis project you've completed including either the R or Python code written to generate analysis

2.  Provide an example or description of the most complex data visualization project you've worked on

3.  Provide an example of a data model, statistical model, or machine learning model you've built

4.  Provide an example of a data visualization you produced to communicate to diverse parties

5.  Provide an example of a water management/hydrology/geology paper you've written or a study you've completed

The samples have been organized in 3 folders.

Folder 1_3 contains answers representatives to **prompts 1 and 3**. Undergraduate student mentoring was part of my PhD training. I wanted my students not only to be exposed to wet lab techniques, but to also have the tools to tackle processing of data with computational resources. I did not routinely worked with a flow cytometer; however, I was curious about the instrument as well as the data output. Therefore, I devised a small project to get exposure to both and involved my undergraduate student in it. The idea was to apply machine learning algorithms to classify samples based on sampling type. In this R markdown, I documented the different stages of data processing (e.g., wrangling, exploration, model evaluation, and visualization).

Folder 2_4 contains screenshots representative of answers to **prompts 2 and 4.** At the onset of the COVID-19 pandemic, I had the opportunity to participate in a wastewater-based epidemiology (WBE) project. This was a collaboration between a city in Massachusetts, an Engineering company, and the Environmental Ecosystems Laboratory (Pinto Lab) at Northeastern University. Collectively, we decided on sampling locations, the city provided epidemiology data and decided on actionable measures, the engineering team collected the samples, and the team at Pinto Lab processed and analysed samples. My role within the Northeastern team consisted of designing, deploying and maintaining a dashboard to summarize results to all parties. The dashboard was developed with Shiny and deployed in shinyapps.io. It allowed for diverse parties to interactively explore data.

Folder 5 contains a completed assignment as an example of water management for **prompt 5**. During my graduate coursework, I took Remote Sensing of the Environment. The course introduced remote sensing techniques and allowed me to visualize and analyse satellite datasets, and investigate current and past conditions of terrestrial and ocean surfaces on Earth. In this assignment, I obtained and processed data products from the Gravity Recovery and Climate Experiment (GRACE) mission to determine water storage changes in time series for Lake Victoria in Africa. The final plot (Figure 5) shows the scaled total water storage anormalities recorded by three different data product sources.This course was taken in 2016 and the use of R reflects that stage of my coding experience, I have since switched from base R to the tidyverse and currently apply better coding habits, such as isolating all files associated with a specific project together (e.g., inputs, scripts, results, plots) in RStudio projects.

------------------------------------------------------------------------

To learn about other projects, take a look at my personal website <https://msevi.github.io/>, created with R and deployed on github pages. I also used to participate on the TidyTuesday project and have a repository with my entries <https://github.com/msevi/TidyTuesdays>.
