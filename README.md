# Assignment description of script
1> i have downloaded required package for the assignment named _data.table,dplyr,reshape2_
2> i have downloaded the dataset using download.file function and saved by the name of data.zip.
   the file downloaded was in the zip file, for that first i have to unzip it first using unzip function.
3> unzipping the _data.zip_ file using _unzip_ function

4> we used function read.table function to read the dataset in txt extension.
5> reading all the test dataset.
  _X_test_ named in files named as _Test_set_, and checked the structure of the data set. we can see that no. of columns is 561 and no. of observations/rows is 2947
  _subject_test_ named in files named same and checked its structure,
     no. of column was 1 and rows are 2947.and its column name matched with one column of X_test so its column name set as _activity_1_and after 
     that using head function looked at the data 
  _y_test_ named in files named as _Test_labels_, and checked their structure,
     no. of column was 1 and rows are 2947.
     column name also matches with one column of _X_test_ so named as _activity_2_ and after that using head function look at the dataset.

6> Reading all training dataset
    _X_train_ named in files named as _Training_set_, and checked the structure of the data set.we can see that no. of columns is 561 and no. of observations/rows is             7352.
    _subject_train_ named in files named same and checked its structure,
        no. of column was 1 and no. of rows were 7352.
        and its column name matched with one column of X_train so its column name set as _activity_1_and after 
        that using head function looked at the data 

   _y_test_ named in files named as _Training_labels_, and checked their structure,
      no. of column was 1 and no. of rows were 7352.
      and column name also matches with one column of _X_train_ so named as _activity_2_ and after that using head function look at the dataset.

7> Reading _features_ and _activity_labels_ dataset
   _features_ is named as _features_list_ and read using read.table function. Using str() function  we have seen no. of column is 2 and no. of observations is 561.
        as its first column was index number and second column shows the measurement show its column name is renamed as _Index_ and _measurement_

  _activity_labels_ is named as same and by looking at the structure,
        no. of column was 2 and rows were 6
        its column name was renamed as _Id_ and _Activity_names_

8> as the no. of column in _Test_set_ is same as no. of rows of _features_list_ so i renamed _Test_set_ column name as rows of second column of _features_list_
    and after that checking wheter Test_set column names was changed.
    here using select function of _dplyr_ package to select all the column of _Test_set_ having named in that as mean() or std() and name that as _Set_training_
    after that using cbind function all the test dataset bind together and that named as _Test_set_ and finally looked at the structure of _Test_set_

9> similarly did all things for training dataset and after binding named that final dataset as _Training_.
10>  now binding Test and Training dataset using rbind() function into one and named as _Combined_data_.

11> now factor function is used for 1st column as their number.
factors functiion is used for second column as _activity_names_. 

12 >for finding average of each all the column except 1st and 2nd. for that we have to melt the combined_data to keep 1st and second column as variable and then using the dcast function and using mean function inside to find average .

finally using read.table function,final tidy data set that is _combined_data_ is saved as _run.analysis.txt_,setting rownames as false.










