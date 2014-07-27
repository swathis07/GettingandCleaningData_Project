XTest <- read.table("X_test.txt") #Reading data fpr Test variables
YTest <- read.table("y_test.txt")
SubTest <- read.table("subject_test.txt")
Test <- cbind(SubTest, YTest, XTest) #Doing column wise binding to combine all Test data

XTrain <- read.table("X_Train.txt") #Reading data for Train variables
YTrain <- read.table("y_train.txt")
SubTrain <- read.table("subject_train.txt")
Train <- cbind(SubTrain, YTrain, XTrain) #Doing column wise binding to combine all Train data

TotalData <- rbind(Test, Train) #Row wise binding on Test and Train data (Step 1)

feature <- read.table("features.txt")  #Reading feature names
Col <- as.character(feature[,2]) #Extracting feature names as a character vector
colnames(TotaData) <- c("Subject","Activity",Col) #Naming columns of dataset 

Subject <- TotalData[,1]
Activity <- TotalData[,2]

MeanData <- TotalData[,grep("mean()",colnames(TotalData))] #Extracting all mean values (46 columns)
STDData <- TotalData[,grep("std()",colnames(TotalData))] #Extracting all std values (33 columns)
FinalData <- cbind(Subject,Activity,MeanData,STDData) #Combining subject,activity, mean and std values (Step 2)



write.table(MeanColnames,"MeanColnames.txt") #Writing Column names of mean values into a text file to rename into descriptive variable names
write.table(STDColnames,"STDColnames.txt") #Writing Column names of std values into a text file to rename into descriptive variable names
MeanColnames1 <- read.table("MeanColnames.txt") #Reading back above files after editing variable names
STDColnames1 <- read.table("STDColnames.txt")
colnames(MeanData) <- as.character(MeanColnames1[,2]) #Assigning new descriptive variable names (Step 4)
colnames(STDData) <- as.character(STDColnames1[,2]) #Assigning new descriptive variable names (Step 4)
FinalData <- cbind(Subject,Activity,MeanData,STDData) #Putting final data back together


library(plyr)
TidyData <- ddply(FinalData,c("Subject","Activity"), numcolwise(mean)) #(Step 5)

TidyData[,2] <- gsub("1","Walking",TidyData[,2]) #Assigning descriptive activity names (Step 3)
TidyData[,2] <- gsub("2","Walking Upstairs",TidyData[,2])
TidyData[,2] <- gsub("3","Walking Downstairs",TidyData[,2])
TidyData[,2] <- gsub("5","Standing",TidyData[,2])
TidyData[,2] <- gsub("4","Sitting",TidyData[,2])
TidyData[,2] <- gsub("6","Laying",TidyData[,2])