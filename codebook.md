Project Description
-------------------

Course Project for Cleaning and Getting Data

Study design and data processing
--------------------------------

### Collection of the raw data

Data was downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and was originally from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Notes on the original (raw) data

From the researchers: "The experiments have been carried out with a
group of 30 volunteers within an age bracket of 19-48 years. Each person
performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and
gyroscope, we captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was
selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain."

Creating the tidy datafile
--------------------------

### Guide to create the tidy data file

1.  Download data from above link
2.  Merge the training and the test sets to create one data set.
3.  Extract only the measurements on the mean and standard deviation for
    each measurement.
4.  Use descriptive activity names to name the activities in the data
    set
5.  Appropriately label the data set with descriptive variable names.
6.  From the data set in step 5, create a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

### Cleaning of the data

The cleaning script merges the training and test sets with subject sets
and activity lables, extracts only measurements of mean and standard
deviations, and cleans up descriptive variable names from features.txt
and assigns those names to columns. A new data set is then created which
provides just the average of each variable for each activity and each
subject. [link to the readme document that describes the code in greater
detail]()

Description of the variables in the tiny\_data.txt file
-------------------------------------------------------

General description of the file including: - Dimensions of the dataset:
11880 x 4 - Summary of the data activityname subjectcode variable
averagevalue\
 LAYING :1980 Min. : 1.0 tBodyAccMeanX: 180 Min. :-0.99767\
 SITTING :1980 1st Qu.: 8.0 tBodyAccMeanY: 180 1st Qu.:-0.96205\
 STANDING :1980 Median :15.5 tBodyAccMeanZ: 180 Median :-0.46989\
 WALKING :1980 Mean :15.5 tBodyAccStdX : 180 Mean :-0.48436\
 WALKING\_DOWNSTAIRS:1980 3rd Qu.:23.0 tBodyAccStdY : 180 3rd
Qu.:-0.07836\
 WALKING\_UPSTAIRS :1980 Max. :30.0 tBodyAccStdZ : 180 Max. : 0.97451\
 (Other) :10800

-   Variables present in the dataset -- activityname levels: LAYING
    SITTING STANDING WALKING WALKING\_DOWNSTAIRS WALKING\_UPSTAIRS
    units: no units

-- subjectcode 1 through 30 units: no units

-- variable From the researchers: "The features selected for this
database come from the accelerometer and gyroscope 3-axial raw signals
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote
time) were captured at a constant rate of 50 Hz. Then they were filtered
using a median filter and a 3rd order low pass Butterworth filter with a
corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth
filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:\
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

"Features are normalized and bounded within [-1,1]."

tBodyAccMeanX\
tBodyAccMeanY\
tBodyAccMeanZ\
tBodyAccStdX\
tBodyAccStdY tBodyAccStdZ tGravityAccMeanX tGravityAccMeanY\
tGravityAccMeanZ tGravityAccStdX tGravityAccStdY tGravityAccStdZ\
tBodyAccJerkMeanX tBodyAccJerkMeanY tBodyAccJerkMeanZ tBodyAccJerkStdX\
tBodyAccJerkStdY tBodyAccJerkStdZ tBodyGyroMeanX tBodyGyroMeanY\
tBodyGyroMeanZ tBodyGyroStdX tBodyGyroStdY tBodyGyroStdZ\
tBodyGyroJerkMeanX tBodyGyroJerkMeanY tBodyGyroJerkMeanZ
tBodyGyroJerkStdX\
tBodyGyroJerkStdY tBodyGyroJerkStdZ tBodyAccMagMean tBodyAccMagStd\
tGravityAccMagMean tGravityAccMagStd tBodyAccJerkMagMean
tBodyAccJerkMagStd\
tBodyGyroMagMean tBodyGyroMagStd tBodyGyroJerkMagMean
tBodyGyroJerkMagStd\
fBodyAccMeanX fBodyAccMeanY fBodyAccMeanZ fBodyAccStdX\
fBodyAccStdY fBodyAccStdZ fBodyAccJerkMeanX fBodyAccJerkMeanY\
fBodyAccJerkMeanZ fBodyAccJerkStdX fBodyAccJerkStdY fBodyAccJerkStdZ\
fBodyGyroMeanX fBodyGyroMeanY fBodyGyroMeanZ fBodyGyroStdX\
fBodyGyroStdY fBodyGyroStdZ fBodyAccMagMean fBodyAccMagStd\
fBodyBodyAccJerkMagMean fBodyBodyAccJerkMagStd fBodyBodyGyroMagMean
fBodyBodyGyroMagStd\
fBodyBodyGyroJerkMagMean fBodyBodyGyroJerkMagStd

-- averagevalue mean of all measurements for
activity/subject/measurement grouping units: none, normalized and
bounded within [-1,1]

Sources
-------

README.txt features\_info.txt from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
