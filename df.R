install.packages("dplyr")
library("dplyr")

originalDataFrame <- read.csv("C://Users//Shuvo//Downloads//Dataset_midterm.csv")
originalDataFrame
print(str(originalDataFrame))

colSums(is.na(originalDataFrame))

str(originalDataFrame)

originalDataFrame$X <- NULL
originalDataFrame$X.1 <-NULL
originalDataFrame$X.2 <-NULL
str(originalDataFrame)

updated1DataFrame <- originalDataFrame
updated1DataFrame

missing_counts <- sapply(updated1DataFrame, function(Age) sum(is.na(Age)))
barplot(missing_counts, names.arg = colnames(updated1DataFrame), main = "Missing Value Counts", ylab = "Number of Missing Values")

updated2DataFrame <- updated1DataFrame
updated2DataFrame
which(is.na(updated2DataFrame))

complete_rows <- complete.cases(updated2DataFrame[, "Age"])
updated2DataFrame <- updated2DataFrame[complete_rows, ]
complete_rows <- complete.cases(updated2DataFrame[, "Smoking"])
updated2DataFrame <- updated2DataFrame[complete_rows, ]
complete_rows <- complete.cases(updated2DataFrame[, "DiastolicBP"])
updated2DataFrame <- updated2DataFrame[complete_rows, ]
colSums(is.na(updated2DataFrame))

updatedDataFrame3 <- updated1DataFrame
updatedDataFrame3
which(is.na(updated2DataFrame))

mean_value <- mean(updatedDataFrame3$age,na.rm =TRUE)