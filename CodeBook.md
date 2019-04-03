
Code Book: A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

The script takes the http address, download the dataset, then unzip the file.
I set the download part in comment since it is supposing that the file are there already.

The variables used in this program are:

X_train, X_test for the observation data of the features
y_train, y_test for the activity
subject_test and train for the subjects
activity_labels are for labels of each activity with the codes
features_labels are the labels of each features 

fullData is the full set of data.

filterMeanStd are the columns of features containing mean/std data + subject and activity
filterData is the fullData on which we applied the filter.

we then go through the activities and convert the interger in code.

tidyData is the tidy data set with the average of each variable for each activity and each subject.

Here is the list of the final columns of features containing mean/std data:

[1] "TimeBodyAccelerometer-mean()-X"                     "TimeBodyAccelerometer-mean()-Y"                    
[3] "TimeBodyAccelerometer-mean()-Z"                     "TimeBodyAccelerometer-std()-X"                     
[5] "TimeBodyAccelerometer-std()-Y"                      "TimeBodyAccelerometer-std()-Z"                     
[7] "TimeGravityAccelerometer-mean()-X"                  "TimeGravityAccelerometer-mean()-Y"                 
[9] "TimeGravityAccelerometer-mean()-Z"                  "TimeGravityAccelerometer-std()-X"                  
[11] "TimeGravityAccelerometer-std()-Y"                   "TimeGravityAccelerometer-std()-Z"                  
[13] "TimeBodyAccelerometerJerk-mean()-X"                 "TimeBodyAccelerometerJerk-mean()-Y"                
[15] "TimeBodyAccelerometerJerk-mean()-Z"                 "TimeBodyAccelerometerJerk-std()-X"                 
[17] "TimeBodyAccelerometerJerk-std()-Y"                  "TimeBodyAccelerometerJerk-std()-Z"                 
[19] "TimeBodyGyroscope-mean()-X"                         "TimeBodyGyroscope-mean()-Y"                        
[21] "TimeBodyGyroscope-mean()-Z"                         "TimeBodyGyroscope-std()-X"                         
[23] "TimeBodyGyroscope-std()-Y"                          "TimeBodyGyroscope-std()-Z"                         
[25] "TimeBodyGyroscopeJerk-mean()-X"                     "TimeBodyGyroscopeJerk-mean()-Y"                    
[27] "TimeBodyGyroscopeJerk-mean()-Z"                     "TimeBodyGyroscopeJerk-std()-X"                     
[29] "TimeBodyGyroscopeJerk-std()-Y"                      "TimeBodyGyroscopeJerk-std()-Z"                     
[31] "TimeBodyAccelerometerMagnitude-mean()"              "TimeBodyAccelerometerMagnitude-std()"              
[33] "TimeGravityAccelerometerMagnitude-mean()"           "TimeGravityAccelerometerMagnitude-std()"           
[35] "TimeBodyAccelerometerJerkMagnitude-mean()"          "TimeBodyAccelerometerJerkMagnitude-std()"          
[37] "TimeBodyGyroscopeMagnitude-mean()"                  "TimeBodyGyroscopeMagnitude-std()"                  
[39] "TimeBodyGyroscopeJerkMagnitude-mean()"              "TimeBodyGyroscopeJerkMagnitude-std()"              
[41] "FrequencyBodyAccelerometer-mean()-X"                "FrequencyBodyAccelerometer-mean()-Y"               
[43] "FrequencyBodyAccelerometer-mean()-Z"                "FrequencyBodyAccelerometer-std()-X"                
[45] "FrequencyBodyAccelerometer-std()-Y"                 "FrequencyBodyAccelerometer-std()-Z"                
[47] "FrequencyBodyAccelerometer-meanFreq()-X"            "FrequencyBodyAccelerometer-meanFreq()-Y"           
[49] "FrequencyBodyAccelerometer-meanFreq()-Z"            "FrequencyBodyAccelerometerJerk-mean()-X"           
[51] "FrequencyBodyAccelerometerJerk-mean()-Y"            "FrequencyBodyAccelerometerJerk-mean()-Z"           
[53] "FrequencyBodyAccelerometerJerk-std()-X"             "FrequencyBodyAccelerometerJerk-std()-Y"            
[55] "FrequencyBodyAccelerometerJerk-std()-Z"             "FrequencyBodyAccelerometerJerk-meanFreq()-X"       
[57] "FrequencyBodyAccelerometerJerk-meanFreq()-Y"        "FrequencyBodyAccelerometerJerk-meanFreq()-Z"       
[59] "FrequencyBodyGyroscope-mean()-X"                    "FrequencyBodyGyroscope-mean()-Y"                   
[61] "FrequencyBodyGyroscope-mean()-Z"                    "FrequencyBodyGyroscope-std()-X"                    
[63] "FrequencyBodyGyroscope-std()-Y"                     "FrequencyBodyGyroscope-std()-Z"                    
[65] "FrequencyBodyGyroscope-meanFreq()-X"                "FrequencyBodyGyroscope-meanFreq()-Y"               
[67] "FrequencyBodyGyroscope-meanFreq()-Z"                "FrequencyBodyAccelerometerMagnitude-mean()"        
[69] "FrequencyBodyAccelerometerMagnitude-std()"          "FrequencyBodyAccelerometerMagnitude-meanFreq()"    
[71] "FrequencyBodyAccelerometerJerkMagnitude-mean()"     "FrequencyBodyAccelerometerJerkMagnitude-std()"     
[73] "FrequencyBodyAccelerometerJerkMagnitude-meanFreq()" "FrequencyBodyGyroscopeMagnitude-mean()"            
[75] "FrequencyBodyGyroscopeMagnitude-std()"              "FrequencyBodyGyroscopeMagnitude-meanFreq()"        
[77] "FrequencyBodyGyroscopeJerkMagnitude-mean()"         "FrequencyBodyGyroscopeJerkMagnitude-std()"         
[79] "FrequencyBodyGyroscopeJerkMagnitude-meanFreq()"     "angle(tBodyAccelerometerMean,gravity)"             
[81] "angle(tBodyAccelerometerJerkMean),gravityMean)"     "angle(tBodyGyroscopeMean,gravityMean)"             
[83] "angle(tBodyGyroscopeJerkMean,gravityMean)"          "angle(X,gravityMean)"                              
[85] "angle(Y,gravityMean)"                               "angle(Z,gravityMean)"                              
[87] "Subject"                                            "Activity"                                    
