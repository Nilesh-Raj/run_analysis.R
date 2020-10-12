#Project of Getting and cleaning data course 3 Data science specialization John Hopkins University
#By Nilesh Raj

# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#-------------------Downloading and loading required packages---------------

install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("reshape2")
library(reshape2)
#--------------download and unzipping data for the project--------------------------
getwd()
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL,destfile = "F:/coursera/run_analysis/data.zip", method = "curl")
unzip("F:/coursera/run_analysis/data.zip")

#----------reading test dataset-------------------------------
Test_set <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/test/X_test.txt")
str(Test_set)

subject_test <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/test/subject_test.txt")
str(subject_test) 
colnames(subject_test) <- c("activity_1")
head(subject_test)

Test_labels <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/test/y_test.txt")
str(Test_labels)
colnames(Test_labels) <- c("activity_2")
head(Test_labels)

#---------reading train dataset----------------------------
Training_set <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/train/X_train.txt")
str(Training_set)

subject_train <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- c("activity_1")
str(subject_train)

Training_labels <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/train/y_train.txt")
colnames(Training_labels) <- c("activity_2")
str(Training_labels)

#-----------reading features and activity_labels dataset-----------------
features_list <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/features.txt")
str(features_list)
colnames(features_list) <- c("Index","Measurement")

activity_labels <- read.table("F:/coursera/run_analysis/UCI HAR Dataset/activity_labels.txt")
head(activity_labels)
colnames(activity_labels) <- c("Id","Activity_names")

#----------naming all column of Taining_set as content of second column of features_list

colnames(Test_set) <- features_list$Measurement
str(Test_set)

#selecting columns having column name std() ans mean() in Taining_set and name that as set_training

Set_test <- select(Test_set,matches(("(mean|std)\\(\\)")))
str(Set_test)

#------comibinsubjell test dataset in to one dataset----------------
Test <- cbind(subject_test,Test_labels,Set_test)
str(Test)

#----------naming all column of Taining_set as content of second column of features_list
colnames(Training_set) <- features_list$Measurement
str(Training_set)

#selecting columns having column name std() ans mean() in Taining_set and name that as set_training
Set_training <- select(Training_set,matches(("(mean|std)\\(\\)")))
str(Set_training)

#------combining all training dataset in to one--------------
Training  <- cbind(subject_train,Training_labels,Set_training)
str(Training)

##-----combining Test and Training dataset in to single dataset-----
Combined_data <- rbind(Test,Training)
str(Combined_data)


Combined_data[,1] <- as.factor(Combined_data[,1])
Combined_data[,2] <- factor(Combined_data[,2]
                            , levels = activity_labels[["Id"]]
                            , labels = activity_labels[["Activity_names"]])
str(Combined_data)


Combined_data<- melt(data = Combined_data, id = c("activity_1", "activity_2"))
Combined_data <- dcast(data = Combined_data, activity_1 + activity_2 ~ variable, mean)
head(Combined_data)
write.table(Combined_data,"run.analysis.txt",row.name = F)
