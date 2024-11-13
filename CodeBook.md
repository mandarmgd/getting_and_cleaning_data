## Getting and cleaning data 

This project demonstrates the many features of R to fetch data as well as transform it in order to make it look cleaner as well as usable. The 
data sets for the following can be found here: 

[download link for the data sets](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained: 

[Human activity recognition using smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The final data set obtained is the 'avg' data set. Its variables and the data contained by those variables is described below: 

- activity: contains one of the six activities: 'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING' and 'LAYING'  
- subject: contains numbers ranging from 1 to 30, each number denoting a subject.  
- feature: contains 1 of the 561 features as seen in features.txt, some of the features were renamed to avoid data repetition.   
- average: contains the averages across all the possible features for a subject.   

In order to clean data, first both the training and test sets were loaded into R. Then, they were merged together into one single data set. 
Only data regarding mean and standard deviations were extracted and the activity names were transformed into their respective names 
by left joining it with activity_labels.txt. Followed by this, the data set was labeled with variable names which would make it more understandable. 
Finally, an independent tidy data set is created out of the dataset obtained. 




