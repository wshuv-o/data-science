library("dplyr")
mydataset<-read.csv("C:/Users/Shuvo/Downloads/employee_data.csv",header=TRUE, sep=",")
mydataset
md2<-select(mydataset, number)
md2
which(is.na(mydataset$number))
is.na(mydataset$number)
remove<-na.omit(mydataset)
mydataset