Refer to README.md for the background on the project.


The input files are:
features.txt - contains a list of 561 'features', each representing a specific data measurement. The
file is indexed by feature number and feature name.

activity_labels.txt - constains a list of 6 activities. The file is indexed by activity number and
activity name. 

The train and test directories contain the subject, activity and measurement data files.  
NOTE: The Inertial Signals files are not used - they contain data not relevent to this project.

subject_train - contains 7352 rows indicating which subject the corresponding data in 
y_train and X_train refers to.
y_train - contains 7352 rows indicating which activity was being done during the corresponding X_train measurements.
X_train - contains 7352 rows of 561 data measurements


subject_test - contains 2947 rows indicating which subject the corresponding data in 
y_test and X_test refers to.
y_test - contains 2947 rows indicating which activity was being done during the corresponding X_test measurements.
X_test - contains 2947 rows of 561 data measurements


Method:
The three files in the train directory are appended to each other columnwise - producing one dataframe
containing all the training data.  Unneeded measurement columns are dropped from X_train and 
appropriate column names applied.

The three files in the test directory are appended to each other columnwise - producing one dataframe
containing all the test data. Unneeded measurement columns are dropped from X_test and 
appropriate column names applied.

The training and test dataframes are appended producing one combined dataframe with all of the data.

The activity column is updated, replacing number with descriptive text.

Finally the data is summarized by subject and activity to btain the average value for each data
measurement.

NOTE: The results are not sorted by subject as that was not a stated requirement.

