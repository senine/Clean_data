## requirement 1
#training set
subject<-read.table("~/train/subject_train.txt")
X<- read.table("~/train/X_train.txt")
y<- read.table("~/train/y_train.txt")

training <- cbind(subject,y,X)

#test set
subject1<-read.table("~/test/subject_test.txt")
X1<- read.table("~/test/X_test.txt")
y1<- read.table("~/test/y_test.txt")

test <- cbind(subject1,y1,X1)

# merge test and training
data <- rbind(training, test)

names <- as.character(read.table("~/features.txt")[,2])

## requirement 4
colnames(data) <- c("subject", "y", names)

## requirement 2
data1 <- data[,sort(c(1,grep("-mean\\(\\)-", names(data)),grep("-std\\(\\)-", names(data))))] 
# checked, gravityMean is not a statistical method.



## requirement 5
namelist <- t(as.data.frame(sapply(names(data1),strsplit,"-")))[,1]
namelist <- as.character(namelist)[-1]

data2 <- as.matrix(data1[,-1])
colnames(data2) <- namelist
rownames(data2) <- data[,1]

library(reshape2)
data3 <- melt(data2,varnames = c("subject", "activity"))
newdata <- with(data3,tapply(value, list(subject,activity),mean))

write.table(newdata, file = "prj.txt",row.name=FALSE)