## Coursera Getting and Cleaning Data Course Project Code Book

## Summary
Provides details of the raw data, the transformations performed and the resulting data and variables.

## Data Source
The dataset is derived from the ([Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  A copy of this dataset was made available as the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) which represents the source data used for this analysis.

The original dataset was presented at IWAL 2012 and may be used AS-IS with the following attribution:
`Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012`

## Dataset Overview
The dataset captures information on experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset the following information is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Feature Information
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Data Sets

### Raw Data
The raw dataset represents the measurements of the mean and the standard deviation for each measurement from the original feature vector.  These measurements were obtained by using a regular expression
```
-(mean|std)\\(\\)
```
to filter out the required features.  This results in 66 features from the original dataset's 561 being selected.  Along with the subject identifier `subject` and activity label `activity` we have a total of 68 columns in the raw data set.

## Processed Data
The processed dataset contains the averages for the measurements of the mean and the standard deviation.  Original variable names were modified as follows:

1. Replace `-mean` with `Mean`
2. Replace `-std` with `Std`
3. Remove parenthesis `-()`
4. Replace `BodyBody` with `Body`

### Renamed variables

Raw Data                    | Processed Data
----------------------------|-------------------------
fBodyAccJerk-mean()-X       | fBodyAccJerkMeanX
fBodyAccJerk-mean()-Y       | fBodyAccJerkMeanY
fBodyAccJerk-mean()-Z       | fBodyAccJerkMeanZ
fBodyAccJerk-std()-X        | fBodyAccJerkStdX
fBodyAccJerk-std()-Y        | fBodyAccJerkStdY
fBodyAccJerk-std()-Z        | fBodyAccJerkStdZ
fBodyAccMag-mean()          | fBodyAccMagMean
fBodyAccMag-std()           | fBodyAccMagStd
fBodyAcc-mean()-X           | fBodyAccMeanX
fBodyAcc-mean()-Y           | fBodyAccMeanY
fBodyAcc-mean()-Z           | fBodyAccMeanZ
fBodyAcc-std()-X            | fBodyAccStdX
fBodyAcc-std()-Y            | fBodyAccStdY
fBodyAcc-std()-Z            | fBodyAccStdZ
fBodyBodyAccJerkMag-mean()  | fBodyAccJerkMagMean
fBodyBodyAccJerkMag-std()   | fBodyAccJerkMagStd
fBodyBodyGyroJerkMag-mean() | fBodyGyroJerkMagMean
fBodyBodyGyroJerkMag-std()  | fBodyGyroJerkMagStd
fBodyBodyGyroMag-mean()     | fBodyGyroMagMean
fBodyBodyGyroMag-std()      | fBodyGyroMagStd
fBodyGyro-mean()-X          | fBodyGyroMeanX
fBodyGyro-mean()-Y          | fBodyGyroMeanY
fBodyGyro-mean()-Z          | fBodyGyroMeanZ
fBodyGyro-std()-X           | fBodyGyroStdX
fBodyGyro-std()-Y           | fBodyGyroStdY
fBodyGyro-std()-Z           | fBodyGyroStdZ
tBodyAccJerkMag-mean()      | tBodyAccJerkMagMean
tBodyAccJerkMag-std()       | tBodyAccJerkMagStd
tBodyAccJerk-mean()-X       | tBodyAccJerkMeanX
tBodyAccJerk-mean()-Y       | tBodyAccJerkMeanY
tBodyAccJerk-mean()-Z       | tBodyAccJerkMeanZ
tBodyAccJerk-std()-X        | tBodyAccJerkStdX
tBodyAccJerk-std()-Y        | tBodyAccJerkStdY
tBodyAccJerk-std()-Z        | tBodyAccJerkStdZ
tBodyAccMag-mean()          | tBodyAccMagMean
tBodyAccMag-std()           | tBodyAccMagStd
tBodyAcc-mean()-X           | tBodyAccMeanX
tBodyAcc-mean()-Y           | tBodyAccMeanY
tBodyAcc-mean()-Z           | tBodyAccMeanZ
tBodyAcc-std()-X            | tBodyAccStdX
tBodyAcc-std()-Y            | tBodyAccStdY
tBodyAcc-std()-Z            | tBodyAccStdZ
tBodyGyroJerkMag-mean()     | tBodyGyroJerkMagMean
tBodyGyroJerkMag-std()      | tBodyGyroJerkMagStd
tBodyGyroJerk-mean()-X      | tBodyGyroJerkMeanX
tBodyGyroJerk-mean()-Y      | tBodyGyroJerkMeanY
tBodyGyroJerk-mean()-Z      | tBodyGyroJerkMeanZ
tBodyGyroJerk-std()-X       | tBodyGyroJerkStdX
tBodyGyroJerk-std()-Y       | tBodyGyroJerkStdY
tBodyGyroJerk-std()-Z       | tBodyGyroJerkStdZ
tBodyGyroMag-mean()         | tBodyGyroMagMean
tBodyGyroMag-std()          | tBodyGyroMagStd
tBodyGyro-mean()-X          | tBodyGyroMeanX
tBodyGyro-mean()-Y          | tBodyGyroMeanY
tBodyGyro-mean()-Z          | tBodyGyroMeanZ
tBodyGyro-std()-X           | tBodyGyroStdX
tBodyGyro-std()-Y           | tBodyGyroStdY
tBodyGyro-std()-Z           | tBodyGyroStdZ
tGravityAccMag-mean()       | tGravityAccMagMean
tGravityAccMag-std()        | tGravityAccMagStd
tGravityAcc-mean()-X        | tGravityAccMeanX
tGravityAcc-mean()-Y        | tGravityAccMeanY
tGravityAcc-mean()-Z        | tGravityAccMeanZ
tGravityAcc-std()-X         | tGravityAccStdX
tGravityAcc-std()-Y         | tGravityAccStdY
tGravityAcc-std()-Z         | tGravityAccStdZ