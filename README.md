cleaningdata
============
Setup: There are eight input files used in this project.  They represent a series of measurements
taken while test subjects were performing different activities. The subjects (and their measurements) were divided into two groups - a test group and a training group.

The test and training group files are in separate directories for each group.  The top level directory
contains  two files listing the measurements taken and the activities carried out.

The goal of the project is to produce a tidy data set representing the average of only the mean and
standard deviation measurements by activity for each subject.

The tidy data set contains only the data needed and uses descriptive activity and column names.

The tidy data set is created by running the script run_analysis.R - it outputs the result as a
file named final.txt.

NOTE: To reproduce the results the working directory  will need editing to follow the directory 
structure on the computer used to run the analysis script run_analysis.R.  All data file pathes are relative to the working directory. Obtain and Unzip the original data
from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into the working directory.

Comments in the script run_analysis.R explain the working of the script.




