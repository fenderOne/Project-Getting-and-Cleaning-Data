Project: Getting and Cleanning Data
-----------------------------------  

CodeBook
========

A **code book** describes the variables, the data, and any transformations or work that has been done to clean up the data.

Intro
-----

The original data is distributed across many files as we can see reading the readme.txt file. These files contain **561** variables related to the data capture from the accelerometer and gyroscope of a Samsung Galaxy S II weared for **30** volunteer performing six activities (WALKING, WALKING UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Our tidy dataset contains the average of each variable for each activity and each subject from a sub dataset of the original variables; it presents only variables of the measurements on the mean and standard deviation for each measurement. That means **66** variables, plus the variables o columns of aggregation avtivity and subject, totaling **68**:
```
> names(tidyDataSet)
```
```
 [1] "activity"                   "subject"                    "tBodyAccMean(X)"            "tBodyAccMean(Y)"           
 [5] "tBodyAccMean(Z)"            "tBodyAccStd(X)"             "tBodyAccStd(Y)"             "tBodyAccStd(Z)"            
 [9] "tGravityAccMean(X)"         "tGravityAccMean(Y)"         "tGravityAccMean(Z)"         "tGravityAccStd(X)"         
[13] "tGravityAccStd(Y)"          "tGravityAccStd(Z)"          "tBodyAccJerkMean(X)"        "tBodyAccJerkMean(Y)"       
[17] "tBodyAccJerkMean(Z)"        "tBodyAccJerkStd(X)"         "tBodyAccJerkStd(Y)"         "tBodyAccJerkStd(Z)"        
[21] "tBodyGyroMean(X)"           "tBodyGyroMean(Y)"           "tBodyGyroMean(Z)"           "tBodyGyroStd(X)"           
[25] "tBodyGyroStd(Y)"            "tBodyGyroStd(Z)"            "tBodyGyroJerkMean(X)"       "tBodyGyroJerkMean(Y)"      
[29] "tBodyGyroJerkMean(Z)"       "tBodyGyroJerkStd(X)"        "tBodyGyroJerkStd(Y)"        "tBodyGyroJerkStd(Z)"       
[33] "tBodyAccMagMean()"          "tBodyAccMagStd()"           "tGravityAccMagMean()"       "tGravityAccMagStd()"       
[37] "tBodyAccJerkMagMean()"      "tBodyAccJerkMagStd()"       "tBodyGyroMagMean()"         "tBodyGyroMagStd()"         
[41] "tBodyGyroJerkMagMean()"     "tBodyGyroJerkMagStd()"      "fBodyAccMean(X)"            "fBodyAccMean(Y)"           
[45] "fBodyAccMean(Z)"            "fBodyAccStd(X)"             "fBodyAccStd(Y)"             "fBodyAccStd(Z)"            
[49] "fBodyAccJerkMean(X)"        "fBodyAccJerkMean(Y)"        "fBodyAccJerkMean(Z)"        "fBodyAccJerkStd(X)"        
[53] "fBodyAccJerkStd(Y)"         "fBodyAccJerkStd(Z)"         "fBodyGyroMean(X)"           "fBodyGyroMean(Y)"          
[57] "fBodyGyroMean(Z)"           "fBodyGyroStd(X)"            "fBodyGyroStd(Y)"            "fBodyGyroStd(Z)"           
[61] "fBodyAccMagMean()"          "fBodyAccMagStd()"           "fBodyBodyAccJerkMagMean()"  "fBodyBodyAccJerkMagStd()"  
[65] "fBodyBodyGyroMagMean()"     "fBodyBodyGyroMagStd()"      "fBodyBodyGyroJerkMagMean()" "fBodyBodyGyroJerkMagStd()" 
```  
Data description
----------------  

**activity**
> Strings containing one of these values: 'WALKING', 'WALKING UPSTAIRS', 'WALKING DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'.  

**subject**
> Integer containing values from 1 to 30 (identification for the volunteers).  

**All other variables**  
   
>1. Al the variables contain decimal numbers normalized and bounded within [-1,1], except **subject** that contain integer numbers, and **activity** that contain strings.  
2. The **'t'** at the beginning of the variable name indicate **time**.  
3. The **'f'** at the beginning of the variable name indicate **frequency**.  
4. The letter **X** indicated **X-axis**.
5. The letter **Y** indicated **Y-axis**.  
6. The letter **Z** indicated **Z-axis**.  
7. **Acc** indicates an linear acceleration measurement. For instance BodyAcc indicates body linear acceleration. Standard gravity units 'g'.
8. **Gyro** indicates an angular velocity. The units are radians/second.
9. **Jerk** indicates Jerk signals.
10. **Mag** indicates the use of the Euclidean norm.
11. **Mean** indicate a mean value.  
12. **Std** indicate a standart deviation value.

### Citation Request

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###License

MIT  

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse.

**Free Software, Hell Yeah!**

