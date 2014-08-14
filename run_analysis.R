######################################
# Project: Getting and Cleaning Data #
# Author: fenderOne                  #
######################################

###
### Info about the project and this script: README.md and CodeBook.md
###
### To run the script: > source("run_analysis.R")
###
### Output: 
###     1. The object 'tidyDataSet' in the R global environment
###     2. The file 'tidyDataSet.txt' on the working directory
###

cat("Processing...\n")

# Directory of the original dataset files
dataSetDirectory <- "./UCI HAR Dataset"

if(!file.exists(dataSetDirectory)) { 
    # If the directory for the dataset does not exist on the working directory, it will read the source zip file
    # from the Internet and unzip it on the working directory 
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipFile <- "./UCI-HAR-Dataset.zip"
    download.file(fileUrl, destfile = zipFile, mode="wb" )
    dateDownLoadedZip <- date()
    unzip(zipFile, exdir = ".", overwrite = TRUE, unzip = "internal")
}

cat("Processing files...\n")

## Read the vbles names from the feature file.
    #It skips the first column, and it reads the second column as character.
featuresFile <- paste0(dataSetDirectory, "/features.txt")
featuresFrame <- read.table(featuresFile, sep="", stringsAsFactors = FALSE, colClasses = c("NULL","character"))
variablesNamesVector <- featuresFrame[[1]]
    # Remove auxiliary objects
rm(featuresFile,featuresFrame) 

## Read the activity labels from the activity_labels file.
    # It skips the first column, and it reads the second column as character
activityLabelsFile <- paste0(dataSetDirectory, "/activity_labels.txt")
activityLabelsFrame <- read.table(activityLabelsFile, sep="", stringsAsFactors = FALSE, colClasses = c("NULL","character"))
activityLabelsVector <- activityLabelsFrame[[1]]
    # Clean up the "_" from the labels
activityLabelsVector <- gsub("_"," ",activityLabelsVector)
    # Remove auxiliary objects
rm(activityLabelsFile,activityLabelsFrame) 

## Reads the test and training dataset from their files, and includes the descriptive vble names
    # If we specify the type of our vbles with colClasses, the read op. is much faster
classes <- rep("numeric",length(variablesNamesVector))
    # Read train data
trainDataFile <- paste0(dataSetDirectory, "/train/X_train.txt")
trainDataFrame <- read.table(trainDataFile, sep="", col.names = variablesNamesVector, check.names = FALSE, colClasses= classes)
    # Read test data
testDataFile <- paste0(dataSetDirectory, "/test/X_test.txt")
testDataFrame <- read.table(testDataFile, sep="", col.names = variablesNamesVector, check.names = FALSE, colClasses= classes)
    # Combine the two data frames
dataFrame <- rbind(trainDataFrame,testDataFrame,deparse.level = 0)
    # Remove auxiliary objects
rm(trainDataFile,trainDataFrame,testDataFile,testDataFrame, classes)

## Extracts only the measurements on the mean and std for each measurement (only Mean() and Std() are chosen)
dataFrame <- dataFrame[,grepl('mean\\(\\)|std\\(\\)', variablesNamesVector)]


## Reads the activity data files.
    # Train activity data
activityDataTrainFile <- paste0(dataSetDirectory, "/train/y_train.txt")
activityDataTrainFrame <- read.table(activityDataTrainFile,  colClasses= "factor")
activitydataTrainFactor <- activityDataTrainFrame[[1]]
    # Test activity data
activityDataTestFile <- paste0(dataSetDirectory, "/test/y_test.txt")
activityDataTestFrame <- read.table(activityDataTestFile,  colClasses= "factor")
activitydataTestFactor <- activityDataTestFrame[[1]]
    # All the activity data together
activitydataFactor <- unlist(list(activitydataTrainFactor,activitydataTestFactor))
    # Labels the activity data factor with descriptive activity label
levels(activitydataFactor) <- activityLabelsVector
    # Remove auxiliary objects
rm(activityDataTrainFile,activityDataTrainFrame,activitydataTrainFactor,
   activityDataTestFile,activityDataTestFrame,activitydataTestFactor) 

## Read the subject data files
    # Train subject data
subjectDataTrainFile <- paste0(dataSetDirectory, "/train/subject_train.txt")
subjectDataTrainFrame <- read.table(subjectDataTrainFile,  colClasses= "integer")
subjectdataTrainLVector <- subjectDataTrainFrame[[1]]
    # Test subject data
subjectDataTestFile <- paste0(dataSetDirectory, "/test/subject_test.txt")
subjectDataTestFrame <- read.table(subjectDataTestFile,  colClasses= "integer")
subjectdataTestLVector <- subjectDataTestFrame[[1]]
    # All the subject data together
subjectdataLVector <- unlist(list(subjectdataTrainLVector,subjectdataTestLVector))
    # Remove auxiliary objects
rm(subjectDataTrainFile,subjectDataTrainFrame,subjectdataTrainLVector,
   subjectDataTestFile,subjectDataTestFrame,subjectdataTestLVector) 

## Add the subject and activity columns to the left of our dataset.
dataFrame <- cbind(activity = activitydataFactor, subject = subjectdataLVector, dataFrame)

## Remove auxiliary objects
rm(activitydataFactor,subjectdataLVector,activityLabelsVector,
   variablesNamesVector,dataSetDirectory) 

## Using reshape2
## Creates our tidy dataset with the average of each vble for each activity and each subject
library(reshape2)
tidyDataSet <- melt(dataFrame, id = c("activity", "subject"), na.rm = TRUE)
tidyDataSet <- dcast(tidyDataSet, activity+subject ~ variable, mean)
    # Transforms the vble names to camel case and integrating the axis variable inside the function name.
names(tidyDataSet) <- gsub("mean", "Mean", names(tidyDataSet))
names(tidyDataSet) <- gsub("std","Std", names(tidyDataSet))
names(tidyDataSet) <- gsub("\\(\\)-Y", "(Y)", names(tidyDataSet))
names(tidyDataSet) <- gsub("\\(\\)-X", "(X)", names(tidyDataSet))
names(tidyDataSet) <- gsub("\\(\\)-Z", "(Z)", names(tidyDataSet))
names(tidyDataSet) <- gsub("-","",names(tidyDataSet))

### Using data.table
### Create our tidy dataset with the average of each vble for each activity and each subject
#library(data.table)
#dataTable <- data.table(dataFrame)
#dataTable <- dataTable[,lapply(.SD, mean), by=list(Activity,Subject)]
## It needs sort the columns because the op. on table preserve the order of the rows.
#dataTable <- dataTable[order(dataTable$Activity,dataTable$Subject),]

cat("Data process completed\n")
cat("\nThe object tidyDataSet contain the result.\n")
cat("\nWriting the object tidyDataSet to './tidyDataSet.csv'\n")

## Writes the tidy dataset to a txt file on the working directory.
resultFile <- "tidyDataSet.txt"
write.table(tidyDataSet, file = resultFile, row.name = FALSE)

cat("\nProcess ended.\n")
################################## End of FIle ############################################

