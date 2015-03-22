library(dplyr)
setwd("C:/users/vladimir/desktop/r")

### This is done assuming that working directory is in the desktop r folder

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
variable_labels <- read.table("UCI HAR Dataset/features.txt")

### Merging the data frames here. Creates full_set which has all the labels.

names(x_test) <- variable_labels[,2]
full_test <- cbind(y_test, test_subject)
full_test <- cbind(full_test, x_test)
names(x_train) <- variable_labels[,2]
full_train <- cbind(y_train,train_subject)
full_train <- cbind(full_train, x_train)
full_set <- rbind(full_train, full_test)
names(full_set)[1:2] <- c("activity","vol_id")

### Extract the means and the standard deviations from "full_data" and separating them into another data frame

sub_set <- data.frame()
meanCols <- grep("mean()[^Freq]", names(full_set))
sdCols <- grep("std()[^Freq]", names(full_set))
labels <- full_set[,1:2]
means <- full_set[,meanCols]
stds <- full_set[,sdCols]
sub_set <- rbind(sub_set,labels)
sub_set <- cbind(sub_set,means)
sub_set <- cbind(sub_set,stds)
sub_set <- merge(sub_set,activity_labels, by.x="activity", by.y ="V1")
names(sub_set)[69] <- "activity_label"

### Use dplyr to rearrange the data into final dataset
final_set <- tbl_df(sub_set)
final_set <- select(final_set, 1:68)
grp_cols <- names(final_set[,1:2])
dots <- lapply(grp_cols, as.symbol)
dat <- final_set %>%
    group_by_(.dots=grp_cols) %>%
    summarise_each(funs(mean))
dat <- merge(dat,activity_labels, by.x= "activity", by.y = "V1")
dim(dat) #### <<<< Just a check to see that dimensions seem correct while running the script

### Swapping activity labels column round here

dat[,1] <- dat[,69]
dat <- select(dat, -V2)
write.table(dat, file = "final_data.txt", row.name=FALSE)    
    

