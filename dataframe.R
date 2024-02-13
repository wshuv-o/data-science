# install.packages("tibble")
# install.packages("dplyr")
# library("tibble")
# library("dplyr")

stdId<-c(2,3,4,5,6)
stdName<-c("wahid", "shuvo", "sajin", "akash", "araf")
stdDept<-c("CS", "EEE", "IPE", "BBA", "MMC")
df<-data.frame(stdId, stdName, stdDept)
# print(df)
stdMajor<-c("a", "b","c", "d", "e")
df1<-cbind(df, stdMajor)
print(df1)
stdMinor<-c("b", "b","cc", "dd", "ee")

#df2<-add_column(df1, stdMinor, after=1)
df2[c("stdId", "stdName")]

g<-"dd"
h<-c(25,26,39)
j<-matrix(1:10, nrow=5)
k<-c("one", "two", "three")
mylist<-list(title=g, ages=h, j, k)
mylist