Project: Getting and Cleanning Data
=================================== 
Intro
-----

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data used for this assigment is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
>[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][1]

Here are the data for the project: 

>[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip][2]

Data to Work with
-----------------
The former link gives us a zip file that when unzipped will show a directory structure with a lot of data files as follow:

>**/UCI HAR Dataset**  
>>**/train**  
>>>/Inertial Signals  
*y_train.txt*  
*X_train.txt*  
*subject_train*  

>>**/test**  
>>>/Inertial Signals  
*y_train.txt*  
*X_train.txt*  
*subject_train* 

>README.txt  
*features_info.txt*  
*features.txt*  
*activity_labels*  

The **README.txt** include info about all of these files. We are going to work basically with all of them except the files inside the Inertia Signals directories.

Objectives
----------    
    
>1.	**Merge** the training and the test sets to create one data set.
2.	**Extract** only the measurements on the **_mean_** and **_standard deviation_** for each measurement. 
3.	Uses **descriptive activity names** to name the activities in the data set
4.	Appropriately labels the data set with **descriptive variable names**. 
5.	Creates a second, independent **_tidy data set with the average of each variable for each activity and each subject_**

The run_analysis.R Script
---------------------------  
This is the script to run to obtain the output:

```
> source("run_analysis.R")
```  

After running the script you will have:
>1. The **tidyDataSet** object in the R global environment
2. The **tidyDataSet.txt** file on the working directory

For a definition of the variables involved in the result set look up the [CodeBook.md] file.  

### How this script works

 1. If the default directory for the dataset ("**./UCI HAR Dataset**") is not in the working directory, the script dowload the zip file from the Internet and unzip it generating the structure described before. If the zip  file is already unzipped in the working directory the script will use it.  

 2. Read the variables names from the **feature.txt** file. There are 561 variable names; it very difficult to determine what are suitable descriptive variable names in this large case. My approach is let the original variable names as they are because they are descriptive enought.  
**Note:** we will do clean up variable names for demostrations porpuses on the final tidy dataset, which have shorter variable names.  
Example for an original name: **tGravityAcc-mean()-X**  
Example for a transformed name: **tGravityAccMean(X)**  

 3. Reads the activity labels from the **activity_labels.txt** file. It gets the labels from the second column, and It also change the char "_" to space to make the label more readable.  
 4. Reads the training and test dataset from their files, **X_train.txt** and **X_test.txt** respectively, and combines them in a data frame including the descriptive vble names from step 2.  

 5. Extracts only the measurements on the **mean** and **std** for each measurement. Only mean() and std() are chosen but if you want to include all of the mean and std variables change this:
    ```
    dataFrame <- dataFrame[,grepl('mean\\(\\)|std\\(\\)', variablesNamesVector)]
    ```
for this:
    ```
    dataFrame <- dataFrame[,grepl('mean|std', variablesNamesVector)]
    ```  

 6. Reads the activity data files **y_train.txt** and **y_test.txt**. The two files are combined as a factor. The level are stablished from the activity label from step 3.  

 7. Read the subject data files **subject_train.txt** and **subject_test.txt**. The two files are combined in a vector.  

 8. Add the activity (step 6) and subject (step 7) columns to the left of our dataset (step 4).  

 9. Using the library **reshape2**, it creates a tidy dataset with the average of each variable for each activity and each subject.  
It also transforms the variable names to **CamelCase** and integrate the axis variable inside the function name. Example for a transformed name: **tGravityAccMean(X)**  

 10. Finaly it write the tidy dataset to a text file called tidyDataSet.txt to the working directory.

### Citation Request

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###License

MIT


**Free Software, Hell Yeah!**

[1]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[2]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[CodeBook.md]:https://github.com/fenderOne/Project-Getting-and-Cleaning-Data/blob/master/CodeBook.md
