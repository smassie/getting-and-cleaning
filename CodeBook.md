---
title: "CodeBook"
author: "Vladimir Emelianov"
date: "Friday, March 20, 2015"
output:
  html_document:
    keep_md: yes
---


Project Desription

The project was essentially to create a neat dataset for submission in the Cleaning and Getting Data course on coursera. I started off with different untidy sets of data and had to compile them and then extract relevant data from the resulting set.

Study Design and Data Processing

Collection of the Raw Data
The raw data was originally collected by receiving data from 30 volunteers after they perfomed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). This was done so by attaching a smartphone (Samsung Galaxy S II) to the volunteers and taking measurements using video recordings to label the data manually.

Creating the tidy datafile

Guide to creating the tidy data file

1) Download the data from here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2) Set working directory to folder that contains the download

3) Run the script

4) A new file will be created after running the script called "final_data.txt"

Cleaning of the Data

The code works in several steps. First it imports all of the neccessary files and stores them in relevant variables. Next it extracts the columns containing the means and standard deviation measures (excluding the frequency measures). After doing this, the dplyr packages is then used to shape the data into a tidy a format and takes the means of the grouped data. Then finally the tidy dataset is written to a text file named "final_data.txt"

Description of the variables in the "final_data.txt" file



Dimension: 180 x 68
Summary: 

Variable 1: activity - The name of the activity performed
    Values:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - LAYING
    - STANDING
    - SITTING

Variable 2: vol_id - The id number attached the volunteer
Values: 30 volunteers, range from 1-30

Variables 3-68: Measure the means of the means and standard deviations from the original data set.

