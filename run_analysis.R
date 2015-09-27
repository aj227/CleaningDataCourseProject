## This script is design to complete the following tasks:
## 1. Merge the training and the test sets to create one data set.
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive variable names. 
## 5. From the data set in step 4, create a second, independent tidy data set with the average of   
##    each variable for each activity and each subject.
##
##  Finally, the tidy dataset created in Step 5, is stored in the local directory as a text file in  
##  csv format in a file called 'tidyData.txt'


## Ensure all the required packages are loaded
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("dplyr")) {
  install.packages("dplyr")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")
require("dplyr")

##Create activity number-name look-up table
activityNames = read.table("./UCI HAR Dataset/activity_labels.txt")[,2]


## Reading the train feature table
trainFeatureTable = read.table("./UCI HAR Dataset/train/X_train.txt")

## Reading the train activity table
trainActivityTable = read.table("./UCI HAR Dataset//train//y_train.txt")
trainActivityTable[,2] = activityNames[trainActivityTable[,1]]
colnames(trainActivityTable) = c("activityID","activityName")


## Reading the train subject table
trainSubjectTable = read.table("./UCI HAR Dataset/train//subject_train.txt")
trainSubjectTable = cbind(trainSubjectTable,"Train")
colnames(trainSubjectTable) = c("subjectID","subjectGroup")
                                
## Combining all the train tables into one single table
trainTable = cbind(trainSubjectTable,trainActivityTable,trainFeatureTable)



## Reading the test feature table
testFeatureTable = read.table("./UCI HAR Dataset/test/X_test.txt")

## Reading the test activity table
testActivityTable = read.table("./UCI HAR Dataset//test//y_test.txt")
testActivityTable[,2] = activityNames[testActivityTable[,1]]
colnames(testActivityTable) = c("activityID","activityName")

## Reading the test subject table
testSubjectTable = read.table("./UCI HAR Dataset/test//subject_test.txt")
testSubjectTable = cbind(testSubjectTable,"Test")
colnames(testSubjectTable) = c("subjectID","subjectGroup")

## Combining all the test tables into one single table
testTable = cbind(testSubjectTable,testActivityTable,testFeatureTable)


## Creating combined dataset
fullDataTable = rbind(trainTable,testTable)

## reading feature names
featureNames = read.table("./UCI HAR Dataset/features.txt")

## Assign column names to the merged data table
colnames(fullDataTable) = c("subjectID","subjectGroup","activityID","activityName",as.character(featureNames[,2]))

## Selecting columns with meaningful means and standard deviations and adding the two custom 
## columns created above
filteredDataTable = fullDataTable[,c(1:4,grep("mean\\()|std\\()",names(fullDataTable)))]

## Creating tidy dataset from the filteredDataTable
meltedDataTable = melt(filteredDataTable,id=c("subjectID","subjectGroup","activityID","activityName"))
tidyDataSet = dcast(meltedDataTable,subjectID + subjectGroup + activityID + activityName ~ variable, mean)

## Assigning standard names to columns in the tidy data table
variableNames = colnames(tidyDataSet)[5:ncol(tidyDataSet)]
variableNames = gsub('std','Std',variableNames)
variableNames = gsub('mean','Mean',variableNames)
variableNames = gsub('\\()-','',variableNames)
variableNames = gsub('-','',variableNames)
variableNames = gsub('\\()','',variableNames)
variableNames = gsub('BodyBody','Body',variableNames)
colnames(tidyDataSet) = c("subjectID","subjectGroup","activityID","activityName",variableNames)

write.table(tidyDataSet,"tidyData.txt",row.names=FALSE,sep=",")
