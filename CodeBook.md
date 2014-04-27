#Codebook

## Variables naming convention

-subject: an integer in range from 1 to 30 that uniquely identify person who was a part of experiment.
-activity: corresponds to activity which subject performs. There are 6 different values (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING).
-t: as first character of variable name, corresponds to time domain signals.
-f: as first character of variable name, corresponds to frequency domain signals.
-body: in the name of variable means that this signal is related to body of subject.  
-gravity: in the name of variable means that this signal is related to gravity.
-acc: in the name of variable means that this signal is acceleration signal from smartphone accelerometer. The units are standard gravity units 'g'.
-gyro: in the name of variable means that this signal is angular velocity from smartphone gyroscope. The units are radians/second.
-jerk: in the name of variable means that this is jerk signal (the body linear acceleration and angular velocity were derived in time to reach this signal).
-mag: in the name of variable means that magnitude of three dimensional signals is calculated using Euclidean norm.
-mean: in the name of variable means that this is mean value of signal.
-std: in the name of variable means that this is standard deviation of signal.
-x: as last character of variable name, corresponds to x axis signal.
-y: as last character of variable name, corresponds to y axis signal. 
-z: as last character of variable name, corresponds to z axis signal.


## List of variables

1.subject
2.activity
3.tbodyaccmeanx
4.tbodyaccmeany
5.tbodyaccmeanz
6.tbodyaccstdx
7.tbodyaccstdy
8.tbodyaccstdz
9.tgravityaccmeanx
10.tgravityaccmeany
11.tgravityaccmeanz
12.tgravityaccstdx
13.tgravityaccstdy
14.tgravityaccstdz
15.tbodyaccjerkmeanx
16.tbodyaccjerkmeany
17.tbodyaccjerkmeanz
18.tbodyaccjerkstdx
19.tbodyaccjerkstdy
20.tbodyaccjerkstdz
21.tbodygyromeanx
22.tbodygyromeany
23.tbodygyromeanz
24.tbodygyrostdx
25.tbodygyrostdy
26.tbodygyrostdz
27.tbodygyrojerkmeanx
28.tbodygyrojerkmeany
29.tbodygyrojerkmeanz
30.tbodygyrojerkstdx
31.tbodygyrojerkstdy
32.tbodygyrojerkstdz
33.tbodyaccmagmean
34.tbodyaccmagstd
35.tgravityaccmagmean
36.tgravityaccmagstd
37.tbodyaccjerkmagmean
38.tbodyaccjerkmagstd
39.tbodygyromagmean
40.tbodygyromagstd
41.tbodygyrojerkmagmean
42.tbodygyrojerkmagstd
43.fbodyaccmeanx
44.fbodyaccmeany
45.fbodyaccmeanz
46.fbodyaccstdx
47.fbodyaccstdy
48.fbodyaccstdz
49.fbodyaccjerkmeanx
50.fbodyaccjerkmeany
51.fbodyaccjerkmeanz
52.fbodyaccjerkstdx
53.fbodyaccjerkstdy
54.fbodyaccjerkstdz
55.fbodygyromeanx
56.fbodygyromeany
57.fbodygyromeanz
58.fbodygyrostdx
59.fbodygyrostdy
60.fbodygyrostdz
61.fbodyaccmagmean
62.fbodyaccmagstd
63.fbodyaccjerkmagmean
64.fbodyaccjerkmagstd
65.fbodygyromagmean
66.fbodygyromagstd
67.fbodygyrojerkmagmean
68.fbodygyrojerkmagstd

## Data set and applied transformations 

This dataset is created from Human Activity Recognition Using Smartphones Data Set (archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

First, we combine all individual files concerning training and testing part of data set,respectively, and than we merge the training and the test sets to create one data set. This data set included 563 columns and 10229 rows.

Second, we extract only the measurements on the mean and standard deviation for each measurement. This resulted in selection of 66 columns from data set.

Third, we substitute numeric values that represent activity in dataset with more descriptive activity names. 

Forth, we created independent tidy data set with the average of each selected measurement for each activity and each subject. Tidy data set have 68 columns (subject, activity, and 66 averages of measurements) and 180 rows (corresponds to activity/subject combination).
This representation corresponds to tidy data principles:

- Each variable you measure should be in one column
- Each different observation (average value of measure for combination of subject and activity) of that variable should be in a different row.

Finally, the names of variables are transformed to lowercase and special signs such as . () are removed. Furthermore it is noticed that in some variable names there are duplicates od "body" string so we removed one such string from variable names.   
  
 