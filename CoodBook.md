#Documentation of Algorithm
#####Authot: Daniel Silva silvdaniel@gmail.com  
The algorithm developed to solve the problem is the following:
1. Step 0: Install and load package "plyr"
2. Step 1: Merge the training and test sets to create one data set
3. Step 1.1: Create data set for 'x'
4. Step 1.2: Create data set for 'y'
5. Step 1.3: Create data set for 'subject'
6. Step 2: Extract only the measurements on the mean and standard deviation for each measurement
7. Step 2.1: Get only columns with mean() or std() in their names
8. Step 2.2: Subset the desired columns
9. Step 2.3: Correct the column names
10. Step 3: Use descriptive activity names to name the activities in the data set
11. Step 3.1: Update values with correct activity names
12. Step 3.2: Correct column name
13. Step 4: Appropriately label the data set with descriptive variable names
14. Step 4.1: Correct column name
15. Step 4.2: Bind all the data in a single data set
16. Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
17. Step 5.1: Create the output file  
##Variables
###Input
Please extract all data files in a folder named `DataSamsung`.  
The files are read in the variables `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test`.
###Process
`x_data`, `y_data` and `subject_data` are used to merge the previous datasets.  `features` and `activities` contains the correct names for the colums.  
`all_data` merges `x_data`, `y_data` and `subject_data` in a only dataset with all information.
###Output
`averages_data` contains the relevant averages which will be later stored in the `averages_data.txt` file.  
The function `ddply()` from the `plyr` package is used to ease the development.
