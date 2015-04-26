## Coursera Getting and Cleaning Data Course Project
Repository containing the course project for the [Geting and Cleaning Data Course] (https://www.coursera.org/course/getdata) offered by Johns Hopkins University on Coursera.

## Summary
The project demonstrates the ability to collect, work with and clean a data set with a goal of preparing tidy data that can be used for later analysis.

## Data
The data used for this project was obtained from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html) and is represents ([Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)).

## Processing
The data is processed by an R script called run_analysis.R which does the following:
1.  Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files
1. `run_analysis.R` contains the R script that processes the raw data and produces the tidy data set
2. `CodeBook.md` provides details of the transformations performed on the raw data and the resulting data and variables

## Analysis
The code to perform the analysis is contained in the `run_analysys.R` script.  The source for the script must be loaded into the workspace, and the analysis can be initiated by executing the `process.data()` function.  This executes the steps:
1. Check and install the [downloader](http://cran.r-project.org/web/packages/downloader/index.html) and [plyr](http://cran.r-project.org/web/packages/plyr/index.html) packages if required
2. Check for the raw data file `UCI HAR Dataset.zip` in the `data` subdirectory before extracting the files for processing.  If the file is not present it will be downloaded from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. Process the raw data files to produce the tidy dataset in the file `averages_data.txt`.  The tidy data set will be placed in the working directory where the analysis was initated from
4. Working files are removed but the raw data file `UCI HAR Dataset.zip` is retained to avoid further downloads for addiitonal processing runs

Upon return from the `process.data()` function the file `averages_data.txt` will be in the working directory and will contain the average of each variable for each activity and each subject.
