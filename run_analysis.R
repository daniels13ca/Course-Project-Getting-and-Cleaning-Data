# Stetp 0: Install and load package "plyr"

if(!is.element("plyr", installed.packages()[,1]))
    install.packages(c("plyr"))
library(plyr)

# Step 1: Merge the training and test sets to create one data set

x_train <- read.table("DataSamsung/train/X_train.txt")
y_train <- read.table("DataSamsung/train/y_train.txt")
subject_train <- read.table("DataSamsung/train/subject_train.txt")

x_test <- read.table("DataSamsung/test/X_test.txt")
y_test <- read.table("DataSamsung/test/y_test.txt")
subject_test <- read.table("DataSamsung/test/subject_test.txt")

# Step 1.1: Create data set for 'x'
x_data <- rbind(x_train, x_test)

# Step 1.2: Create data set for 'y'
y_data <- rbind(y_train, y_test)

# Step 1.3: Create data set for 'subject'
subject_data <- rbind(subject_train, subject_test)

# Step 2: Extract only the measurements on the mean and standard deviation for 
# each measurement 

features <- read.table("DataSamsung/features.txt")

# Step 2.1: Get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Step 2.2: Subset the desired columns
x_data <- x_data[, mean_and_std_features]

# Step 2.3: Correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# Step 3: Use descriptive activity names to name the activities in the data set

activities <- read.table("DataSamsung/activity_labels.txt")

# Step 3.1: Update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# Step 3.2: Correct column name
names(y_data) <- "activity"

# Step 4: Appropriately label the data set with descriptive variable names

# Step 4.1: Correct column name
names(subject_data) <- "subject"

# Step 4.2: Bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# Step 5: Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject

# Step 5.1: 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "DataSamsung/averages_data.txt", row.name=FALSE)