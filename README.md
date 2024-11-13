# Getting and cleaning data 

Solution to the 'Getting and Cleaning Data' course project from the course of the same name 
provided by Johns Hopkins University: 'https://www.coursera.org/learn/data-cleaning'

The script run_analysis.R contains all the tasks performed on the data set to transform it. The script: 

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data set 'dataset' is obtained through merging all the training and test sets, then the table containing al the feature names is 
extracted from features.txt and the columns are renamed. 
The 'dplyr' library commonly used in data manipulation was used for the steps following that. 
The 'tidyr' library was used to convert our independent dataset obtained through renaming columns and joining tables into a tidy data set. 