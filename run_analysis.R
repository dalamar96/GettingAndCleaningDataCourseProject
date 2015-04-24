if (!file.exists("UCI HAR Dataset"))
{
  download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Dataset.zip")
  unzip("UCI_HAR_Dataset.zip")
} 
root_Directory = "UCI HAR Dataset"
test_Directory = "test"
train_Directory = "train"

TestX<- read.table(paste(root_Directory, "/", test_Directory, "/", "X_test.txt", sep=""))
TestY<- read.table(paste(root_Directory, "/", test_Directory, "/", "y_test.txt", sep=""))
TestSubj<-read.table(paste(root_Directory, "/", test_Directory, "/", "subject_test.txt", sep=""))
TrainX<- read.table(paste(root_Directory, "/", train_Directory, "/", "X_train.txt", sep=""))
TrainY<- read.table(paste(root_Directory, "/", train_Directory, "/", "y_train.txt", sep=""))
TrainSubj<-read.table(paste(root_Directory, "/", train_Directory, "/", "subject_train.txt", sep=""))
features<- read.table(paste(root_Directory, "/", "features.txt", sep=""))
activities<-read.table(paste(root_Directory, "/", "activity_labels.txt", sep=""))
activityLabels<-activities[,2]
colnames(TestX) <- features[,2]
colnames(TrainX) <- features[,2]
colnames(TrainSubj) <- "subject"
colnames(TestY) <- "activity"
colnames(TrainY) <- "activity"
colnames(TestSubj) <- "subject"

TestMerged<-cbind(TestY, TestX, TestSubj)
TrainMerged<-cbind(TrainY, TrainX, TrainSubj)

MergeTrainandTestData<-rbind(TestMerged,TrainMerged)

colsToKeepSearch <- c("mean", "Mean", "std", "subject", "activity")
colsToKeep <- grep(paste(colsToKeepSearch,collapse="|"), names(MergeTrainandTestData), value=TRUE)
MeanandSTD_TrainandTestData<-MergeTrainandTestData[,colsToKeep, drop=FALSE]

MeanandSTD_TrainandTestData$activity<-factor(MeanandSTD_TrainandTestData$activity, labels=activityLabels)

TidyDataset<-aggregate(MeanandSTD_TrainandTestData[,2:87], list(MeanandSTD_TrainandTestData$subject, MeanandSTD_TrainandTestData$activity), mean)
write.table(TidyDataset, file="tidydataset.txt", row.names=FALSE)
