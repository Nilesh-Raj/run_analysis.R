## Assignment description of script
first i have downloaded the dataset using download.file function and saved at the location specified in the function.
the file downloaded was in the zip file, for that first i have to unzip it first using unzip function.


we used function read.table function to read the dataset i.e. in txt extension.

##reading all the test dataset.
_X_test_ named in files named as _Test_set_, and checked the structure of the data set. we can see that no. of columns is 561 and no. of observations/rows is 2947
_subject_test_ named in files named same and checked its structure,
no. of column was 1 and rows are 2947.and its column name matched with one column of X_test so its column name set as _activity_1_and after 
that using head function looked at the data 

_y_test_ named in files named as _Test_labels_, and checked their structure,
no. of column was 1 and rows are 2947.
column name also matches with one column of _X_test_ so named as _activity_2_ and after that using head function look at the dataset.

##Reading all training dataset
_X_train_ named in files named as _Training_set_, and checked the structure of the data set.we can see that no. of columns is 561 and no. of observations/rows is 7352.
_subject_train_ named in files named same and checked its structure,
no. of column was 1 and no. of rows were 7352.
and its column name matched with one column of X_train so its column name set as _activity_1_and after 
that using head function looked at the data 

_y_test_ named in files named as _Training_labels_, and checked their structure,
no. of column was 1 and no. of rows were 7352.
and column name also matches with one column of _X_train_ so named as _activity_2_ and after that using head function look at the dataset.

##Reading features and activity_labels dataset
features is named as features_list and read using read.table function.using str() function  we have seen no. of column is 2 and no. of observations is 561.
as its first column was index number and second column shows the measurement show its column name is renamed as _Index_ and _measurement_

activity_labels is named as same and by looking at the structure,
no. of column was 2 and rows were 6
its column name was renamed as _Index_ and _Activity_names_

 as the no. of column in Test_set is same as no. of rows of features_list so i renamed Test_set column name as rows of second column of features_list
and after that checking wheter Test_set column names was changed.

 here using select function of dplyr package to select all the column of Test_set having named in that as mean() or std() and name that as Set_training

after that using cbind function all the test dataset bind together and that named as Test_set and finally looked at the structure of Test_set

**similarly did all things for training dataset and after binding named that final dataset as Training**
now binding Test and Training dataset using rbind() function into one and named as Combined_data.

now factor function is used for 1st as well as second, 1st for ID itself and second as the activity_names i.e. second column of activity_labels.

for finding average of each variabe and each activity first we have to melt the combined_data then using the dcast function we can apply mean function to find average.
i used melt function that that reshape the first column and second column as it is and 3rd column as the column name of combined_data and 4th column as the data correspond to 3rd column.
for the 5th step answer i used dcast function to find average as required.

now 










