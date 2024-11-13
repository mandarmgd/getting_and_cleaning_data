# Load all significant datasets into R 
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# Create a new X_train dataset including a column for training subjects 
new_X_train <- cbind(subject_train, X_train)
# Create a new X_test dataset including a column for testing subjects 
new_X_test <- cbind(subject_test, X_test)

# Merge into one single dataset containing independent variables
X <- rbind(new_X_train, new_X_test)
# Merge into one single dataset containing dependent variables 
y <- rbind(y_train, y_test)

# Merge the datasets obtained above into one final dataset 
dataset <- cbind(X, y)

# Label the dataset with descriptive variable names 
features <- read.table('./UCI HAR Dataset/features.txt')$V2
colnames(dataset)[1] <- 'subject'
colnames(dataset)[ncol(dataset)] <- 'activity'
colnames(dataset)[2 : (ncol(dataset) - 1)] <- features

# Extract only the measurements of the mean and standard deviation for each measurement
library(dplyr)
mean.n.std <- dataset %>% select(contains('mean()'), 
                   contains('std()'))

# Use descriptive activity names to name the activities
activity <- read.table('./UCI HAR Dataset/activity_labels.txt')
names(dataset)[ncol(dataset)] <- 'V1'
data2 <- merge(x = dataset, y = activity, by = "V1", all.x = TRUE, 
               all.y = FALSE)
dataset <- data2 %>% setNames(make.names(names(.), unique = TRUE)) %>%
  select(-(V1)) %>% rename(activity = V2)
colnames(dataset)[2 : (ncol(dataset) - 1)] <- features

# Create a second, independent dataset with the average of each variable for each activity and each subject 
avg <- dataset %>% setNames(make.names(names(.), unique = TRUE)) %>%
  group_by(activity, subject) %>% summarize(across(everything(), mean, .names = "mean_{.col}")) %>% ungroup()
names(avg)[3 : ncol(avg)] <- features

# Convert into a tidy dataset 
library(tidyr)
avg <- avg %>% pivot_longer(cols = contains('mean'), 
                            names_to = 'feature', 
                            values_to = 'average')




  


















