GettingandCleaningData_Project
==============================

Summary

1)Data from test folder was first read into separate variables (XTest, ytest, subtest). This data was merged using cbind into a variable called 'Test'

2)The above step was repeated for the train folder. The combined data was stored in a variable called 'Train'

3)Rbind was done on Test and Train to combine into 1 single dataset called TotalData.

4)The feature names were extracted from features.txt file and assigned as column names to the TotalData.

5)Then the mean and standard deviation variables were extracted from the dataset. This was done using grep searching for "mean()" and "std()" in the column names. 46 columns were extracted for mean and 33 for standard deviation.

6)The column names for mean and std variables were extracted to a text file. This was done so that the text file could be edited to rename the variable names and assign it back to column names of the mean and std variable columns.

7)The data with mean and standard deviation variables with descriptive column names was put together using cbind into a dataset 'FinalData'. 

8)Finally, ddply was applied on 'FinalData' to group the data w.r.t "Subject" and "Activity".

9)The "Activity" was still identified as numbers from 1 through 6. As a last step, the numbers were replaced with descriptive activity names such as "Walking","Sitting" etc..
