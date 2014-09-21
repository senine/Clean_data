## requirement 1
#training set
subject<-read.table("./train/subject_train.txt")
X<- read.table("./train/X_train.txt")
y<- read.table("./train/y_train.txt")

training <- cbind(subject,y,X)

#test set
subject1<-read.table("./test/subject_test.txt")
X1<- read.table("./test/X_test.txt")
y1<- read.table("./test/y_test.txt")

test <- cbind(subject1,y1,X1)

# merge test and training
data <- rbind(training, test)

names <- as.character(read.table("./features.txt")[,2])

## requirement 4
colnames(data) <- c("subject", "activity", names)

## requirement 2
data1 <- data[,sort(c(1,2,grep("-mean\\(\\)-", names(data)),grep("-std\\(\\)-", names(data))))] 
# checked, gravityMean is not a statistical method.



## requirement 5
newdata<- with(data1,split(data1, list(subject,activity)))
newdata1 <-t(as.data.frame(lapply(newdata, colMeans)))


write.table(newdata1, file = "prj.txt",row.name=FALSE)
