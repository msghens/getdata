README
======

This repository contains the final project for Coursera Getting and
Cleaning Data. The project is to clean data for later analysis. Included
in this repository will be:

R Script: run\_analysis.R that will accomplish:

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.

3.  Uses descriptive activity names to name the activities in the data
    set

4.  Appropriately labels the data set with descriptive variable names.

5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject

Data was obtained from
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Data was unzipped in the repository. The resultant directory was renamed
to Dataset then moved to the first level directory. This was to ease
data import.

Data required the reading of data into r-stat.

Only one script is required to create Tidy data: run\_analysis.R

This script requires no input to run, but to be located in directory
that is above the data directory. The output is the file tidy.txt

Data is not located in this repository.
