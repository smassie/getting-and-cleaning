---
title: "Readme"
author: "Vlademel"
date: "Sunday, March 22, 2015"
output: html_document
---

run_analysis

THis script extracts the relevant data, calculates the means of the extracted columns then shapes the data appropriately.

The script starts off by importing everything as a table, it imports the x_test and y_test (same for train) files. It then also imports all the axis labels and stores them in the variables in the first chunk of code within the script.

The second part of the script extract the names of the axis and then merges all of the data together. I decided to bind the y_train and test files to x_train and test files. I then binded the resulting files together to form one big dataset with the appropriate variable names contained within the "variable_names" variable.

The third part of the script creates a subset of the resulting data frame from the second part. It then extracts the columns that measure the mean and standard deviations using a grep command, it excludes the "freq" columns.

The final part of the script groups the data using the dplyr package. It groups the data by the activity performed and then groups by volunteer id. After doing this it then takes the means of each varaible. This information is then stored in a variable called "dat". After this I decided to merge the data with the activity labels again as I had some issues with this in the first few steps of the script.
After this merge the script then just rearranges some of the columns (dropping the numerical representation of the activity and replacing it with the labels.)

Finally the script then writes the data into a file called "final_data.txt".

