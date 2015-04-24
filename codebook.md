#Getting and Cleaning Data Course Project Codebook
##By: Chad Naujoks
###April 23, 2015


**Raw data**

RCI_HAR_Dataset.zip retrieved from: http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This zip file contains:
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The files that we retrieved the raw data include
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Description**
We want to get the average(mean) of all features that are either means or standard deviations, but subject and by activity

**Codebook**
1. Loaded all of the files into individual data frames using read.table defaults
  - Features -- features.txt
  - Activities -- activity_lables.txt
  - TrainX -- X_train.txt
  - TrainY -- y_train.txt
  - TrainSubj -- subject_train.txt
  - TestX -- X_test.txt
  - TestY -- t_test.txt
  - TestSubj -- subject_test.txt
2. Used the features data frame to name the columns in the training set and the test set
3. Added labels to the Training Subject data frame and the Activities data frame
4. Merged the TrainX, TrainY and the TrainSubj data frames by column (cbind) into TrainMerged
5. Merged the TestX, TestY and the TestSubj data frames by column (cbind) into TestMerged
6. Merged the TrainMerged and TestMerged by row (rbind) into MergedTrainandTestData
7. Removed all Columns that did not have a Mean or a Standard Deviation (leaving the Subject and Activity Columns as well) into a new Data Frame called MeanAndSTD_TrainandTestData
8. Factored the Activities Column with labels from the activities data frame
9. Aggregated the data by Subject and Activity for all other columns into a data frame called TidyData
10. Renamed the Column Group.1 back to Subject and the Column Group.2 back to Activity
11. Write out the data frame to a new text file called tidydata.txt