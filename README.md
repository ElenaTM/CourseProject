# CourseProject

This course project has 5 different parts:

1. First, the training and the test sets are merged to create one data set.
2. The measurements on the mean and standard deviation for each measurement are selected (some variables meanFreq are in my file not selected).
3. The names of the activities are changed: instead of using id numbers (1, 2, 3, 4, 5, 6), the names than can be found in the activity_labels.txt are used. 
4. The names of the data set are changed. Descriptive variable names are here used. 
5. From the data set in step 4, a second data set is created. Independent tidy data set with the average of each variable for each activity and each subject are here selected. 


Variables that are included:
1. Time body accelerometer mean -XYZ.
2. Time gravity accelerometer mean -XYZ.
3. Time body accelerometer Jerkmean -XYZ.
4. Time body gyroscope mean -XYZ.
5. Time body gyroscope Jerkmean -XYZ.
6. Time body accelerometer Magmean. 
7. Time gravity accelerometer Magmean.
8. Time body accelerometer JerkMagmean.
9. Time body gyroscope Magmean.
10. Time body gyroscope JerkMagmean.
11. Frequency body accelerometer mean -XYZ.
12. Frequency body accelerometer Jerkmean -XYZ.
13. Frequency body gyroscope mean -XYZ.
14. Frequency body accelerometer Magmean.
15. Frequency body Bodyaccelerometer JerkMagmean.
16. Frequency body Bodygyroscope Magmean.
17. Frequency body Bodygyroscope JerkMagmean.
18. Time body accelerometer standard deviation -XYZ.
19. Time gravity accelerometer standard deviation -XYZ. 
20. Time body accelerometer Jerkstandard deviation -XYZ.
21. Time body gyroscope standard deviation -XYZ.
22. Time body gyroscope Jerkstandard deviation -XYZ.
23. Time body accelerometer Magstandard deviation.
24. Time gravity accelerometer Magstandard deviation.
25. Time body accelerometer JerkMagstandard deviation.
26. Time body gyroscope Magstandard deviation.
27. Time body gyroscope JerkMagstandard deviation.
28. Frequency body accelerometer standard deviation -XYZ.
29. Frequency body accelerometer Jerkstandard deviation -XYZ.
30. Frequency body gyroscope standard deviation -XYZ.
31. Frequency body accelerometer Magstandard deviation.
32. Frequency body Bodyaccelerometer JerkMagstandard deviation.
33. Frequency body Bodygyroscope Magstandard deviation.
34. Frequency body Bodygyroscope JerkMagstandard deviation.

For an explanation of these magnitudes, see features.txt:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
