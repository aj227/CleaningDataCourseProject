---
title: "Getting and Cleaning Data - Course Project"
date: "Saturday, September 26, 2015"
output: html_document
---

## Project Description
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run the script and generate the tidy dataset described in Step 5. above

1. Download the data source into a folder in your working directory and extract the zipped file. This will create a ```UCI HAR Dataset``` folder in your working directory.
2. Put ```run_analysis.R``` in your working directory.
3. Run the file, which will create a new text file ```tidyData.txt``` in your working directory that consists of the tidy data set in Step 5 above saved in a CSV file format.
