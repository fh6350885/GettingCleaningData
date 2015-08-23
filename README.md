# Getting and Cleaning Data Course Project

## Plz note that I dont have a single more minutes to upload and push everything to repo. So I will jsut attach my files here in a single README. SORRY ABOUT THIS
## this is my code.

# read features
 features <- read.table("./features.txt")
 features <- features[,2]
 features <- as.character(features)
 rowName <- c("subject", "activity", features)

# read txt files from test folder 
 testDataSubject <- read.table("./test/subject_test.txt", sep = ",")
 testDataX <- read.table("./test/X_test.txt", sep = "", fill = TRUE)
 testDataY <- read.table("./test/y_test.txt", sep = ",")

# merge test files
 testData <- cbind(testDataSubject,testDataY,testDataX)

# read txt files from train folder
 trainDataSubject <- read.table("./train/subject_train.txt", sep = ",")
 trainDataX <- read.table("./train/X_train.txt", sep = "", fill = TRUE)
 trainDataY <- read.table("./train/y_train.txt", sep = ",")


# merge train files
 trainData <- cbind(trainDataSubject,trainDataY,trainDataX)

# merge the feature, test and train
 Data <- rbind(testData,trainData)
 names(Data) <- rowName

# extract mean and standard deviation
 columns <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,
              227:228,240:241,253:254,266:271,345:350,424:429,
              503:504,529:530) + 2

# make new matrix and rename
 newData <- cbind(Data[,1:2],Data[,columns])

# order based on subjects and activities
 suppressWarnings(as.numeric(newData$subject))
 suppressWarnings(as.numeric(newData$activity))
 newData[order(newData$subject,newData$activity),]
 
# rename the activities  
 newData$activity[newData$activity == 1] <- "WALKING"
 newData$activity[newData$activity == 2] <- "WALKING_UPSTAIRS"
 newData$activity[newData$activity == 3] <- "WALKING_DOWNSTAIRS"
 newData$activity[newData$activity == 4] <- "SITTING"
 newData$activity[newData$activity == 5] <- "STANDING"
 newData$activity[newData$activity == 6] <- "LAYING"



 
# write into txt file
 write.table(newData, file = "tidydata.txt", row.names = FALSE)



## Project Description
*the code combines the samples from "test" files and "train" files (each one of them is composed of X_train,y_train, and subject)
*the only the mean and std value were extracted out from the generated data frame
*the names of column have to be changed to subject, activity, and associated measurement names
*the name codes of activities were changed from 1,2,3,4,5,6 to walking, walking_up... blabla
*the final should be written into a txt file, with averaged value for each section (e.g: each subject in one activity). I havent finished the "taking average" step yet


## Codebook
*Subject column: 
* 1
* 2
* 3
* 4
* 5
* 6
* 7
* ...
* 30
* means the different subjects (different person)

*activities
* 1: walking
* 2: walking upstair
* 3: walking downstair
* 4: sitting
* 5: standing
* 6: laying


* acitivies measurement 
* the mean and average of 
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* and etc 
* tBodyAcc-std()-Z

