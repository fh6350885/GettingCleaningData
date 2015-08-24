library(dplyr)

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
write.table(Tidy, file = "tidydata.txt", row.names = FALSE)
