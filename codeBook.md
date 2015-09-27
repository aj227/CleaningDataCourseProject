---
title: "Getting and Cleaning Data - Course Project"
date: "Saturday, September 26, 2015"
output: html_document
---

# Code Book for Course Project

### Analysis description

The analysis script, `run_analysis.R` performs the following tasks:

 - Ensures and loads all the packages required for analysis
 - Reads training and test datasets and adds the following colmuns to each dataset - activityID, 
   activityName, subjectID and subjectGroup
 - Merges the two datasets into a single dataset and assingns column names for each measurement using the `features.txt` file.
 - Columns that contain mean and standard deviation measurements are selected from the merged dataset for further analysis
 - The data is grouped by subjectID and activityName to calculated the mean of each measurement for  each subject and activity
 - The columns names in the resulting dataset are renamed using a standard and descriptive naming scheme
 - Finally, the sumarrised tidy dataset is stored in a CSV format file , `tidyData.txt`.

Each section of the script has comments to provide further details on the analysis process.

### Column names in the tidy dataset

The columns included in the tidy dataset are described below:

- subjectID     - The id of the participant.
- subjectGroup  - Text identifying whetere the participant belongs to the test or the training group
- activityID    - The id of the activity for each set of observation
- activityName  - The name of the activity for each set of observation
 
The columns listed below represent the mean of the measurements for each subject by activity. The file `features_info.txt` provides further details for each measurement.

-	tBodyAccMeanX        
-	tBodyAccMeanY        
-	tBodyAccMeanZ        
-	tBodyAccStdX        
-	tBodyAccStdY         
-	tBodyAccStdZ         
-	tGravityAccMeanX     
-	tGravityAccMeanY    
-	tGravityAccMeanZ     
-	tGravityAccStdX      
-	tGravityAccStdY      
-	tGravityAccStdZ     
-	tBodyAccJerkMeanX    
-	tBodyAccJerkMeanY    
-	tBodyAccJerkMeanZ    
-	tBodyAccJerkStdX                       
-	tBodyAccJerkStdY                        
-	tBodyAccJerkStdZ                        
-	tBodyGyroMeanX       
-	tBodyGyroMeanY     
-	tBodyGyroMeanZ       
-	tBodyGyroStdX        
-	tBodyGyroStdY       
-	tBodyGyroStdZ       
-	tBodyGyroJerkMeanX   
-	tBodyGyroJerkMeanY   
-	tBodyGyroJerkMeanZ   
-	tBodyGyroJerkStdX   
-	tBodyGyroJerkStdY    
-	tBodyGyroJerkStdZ    
-	tBodyAccMagMean      
-	tBodyAccMagStd      
-	tGravityAccMagMean   
-	tGravityAccMagStd    
-	tBodyAccJerkMagMean  
-	tBodyAccJerkMagStd 
-	tBodyGyroMagMean    
-	tBodyGyroMagStd      
-	tBodyGyroJerkMagMean 
-	tBodyGyroJerkMagStd 
-	fBodyAccMeanX        
-	fBodyAccMeanY        
-	fBodyAccMeanZ        
-	fBodyAccStdX        
-	fBodyAccStdY        
-	fBodyAccStdZ         
-	fBodyAccJerkMeanX    
-	fBodyAccJerkMeanY   
-	fBodyAccJerkMeanZ    
-	fBodyAccJerkStdX     
-	fBodyAccJerkStdY     
-	fBodyAccJerkStdZ    
-	fBodyGyroMeanX       
-	fBodyGyroMeanY       
-	fBodyGyroMeanZ       
-	fBodyGyroStdX       
-	fBodyGyroStdY        
-	fBodyGyroStdZ        
-	fBodyAccMagMean      
-	fBodyAccMagStd     
-	fBodyAccJerkMagMean  
-	fBodyAccJerkMagStd   
-	fBodyGyroMagMean     
-	fBodyGyroMagStd     
-	fBodyGyroJerkMagMean 
-	fBodyGyroJerkMagStd

### More information

The original data and a detailed description of the experiement design can be found at [homepage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Please refer to the `README.txt` and `features_info.txt` files included in the raw dataset.