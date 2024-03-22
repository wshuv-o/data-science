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
complete_rows <- updated2DataFrame[!updated2DataFrame$Infection == "", ]
updated2DataFrame <- complete_rows
colSums(is.na(updated2DataFrame))
updated2DataFrame


updatedDataFrame3 <- updated1DataFrame
updatedDataFrame3
which(is.na(updatedDataFrame3))
updatedDataFrame3$DiastolicBP[is.na(updatedDataFrame3$DiastolicBP)] <- as.integer(mean(updatedDataFrame3$DiastolicBP, na.rm = TRUE))
updatedDataFrame3$Smoking[is.na(updatedDataFrame3$Smoking)] <- as.integer(mean(updatedDataFrame3$Smoking, na.rm = TRUE))
updatedDataFrame3$Age[is.na(updatedDataFrame3$Age)] <- as.integer(mean(updatedDataFrame3$Age, na.rm = TRUE))
mode_infection <- names(sort(table(updatedDataFrame3$Infection), decreasing = TRUE))[1]
updatedDataFrame3$Infection[updatedDataFrame3$Infection == ""] <- mode_infection
updatedDataFrame3

updatedDataFrame4 <- updated1DataFrame
updatedDataFrame4
mode_diastolicBP <- as.character(names(sort(table(updatedDataFrame4$DiastolicBP), decreasing = TRUE))[1])
mode_smoking <- as.character(names(sort(table(updatedDataFrame4$Smoking), decreasing = TRUE))[1])
mode_age <- as.character(names(sort(table(updatedDataFrame4$Age), decreasing = TRUE))[1])
updatedDataFrame4$DiastolicBP[is.na(updatedDataFrame4$DiastolicBP)] <- mode_diastolicBP
updatedDataFrame4$Smoking[is.na(updatedDataFrame4$Smoking)] <- mode_smoking
updatedDataFrame4$Age[is.na(updatedDataFrame4$Age)] <- mode_age
mode_infection <- as.character(names(sort(table(updatedDataFrame4$Infection), decreasing = TRUE))[1])
updatedDataFrame4$Infection[updatedDataFrame4$Infection == ""] <- mode_infection
updatedDataFrame4



detect_noisy_values <- function(data) {
  if("BodyTemp" %in% colnames(data)) {
    BodyTemp <- data$BodyTemp
    if(is.numeric(BodyTemp)) {
      mean_val <- mean(BodyTemp, na.rm = TRUE)
      noisy_indices <- which(BodyTemp > mean_val * 1.5 | BodyTemp < mean_val/1.5)
      return(noisy_indices)
    } else {
      return(NULL)  
    }
  } else {
    return(NULL)
  }
}
noisy_indices <- detect_noisy_values(updatedDataFrame4)
print(noisy_indices)
updatedDataFrame4$BodyTemp[noisy_indices]<-as.integer(mean(updatedDataFrame4$BodyTemp, na.rm = TRUE))
updatedDataFrame4


unique_values <- unique(updatedDataFrame4$Infection)
replacevalue<-c("yesss", "yoo")
updatedDataFrame4$Infection[updatedDataFrame4$Infection %in% replacevalue] <- as.character(names(sort(table(updatedDataFrame4$Infection), decreasing = TRUE))[1])
unique_val--------------------------------------------------------------------------------------------------------------------------------------------------------------ues <- unique(updatedDataFrame4$Infection)
unique_values
updatedDataFrame4



calculate_mode <- function(x) {
  ux <- unique(x)
  if(length(ux) == 1 && is.na(ux)) return(NA)
  ux[which.max(tabulate(match(x, ux)))]
}

attributes <- names(updatedDataFrame4)
mean_values <- numeric(length(attributes))
median_values <- numeric(length(attributes))
mode_values <- numeric(length(attributes))

for (i in seq_along(attributes)) {
  attr <- updatedDataFrame4[[attributes[i]]]
  if (is.numeric(attr)) {
    mean_values[i] <- mean(attr, na.rm = TRUE)
    median_values[i] <- median(attr, na.rm = TRUE)
    mode_values[i] <- calculate_mode(attr)
  } else {
    mean_values[i] <- 0
    median_values[i] <- 0
    mode_values[i] <- 0
  }
}

summary_df <- data.frame(Attribute = attributes,
                         Mean = mean_values,
                         Median = median_values,
                         Mode = mode_values)

barplot_data <- t(summary_df[, -1])
pdf("summary_plot1.pdf", width = 12, height = 8)  
barplot(barplot_data, beside = TRUE, col = c("red", "blue", "green"),
        legend.text = c("Mode", "Median", "Mean"), args.legend = list(x = "topright"),
        main = "Summary of Attributes (Mode, Median, Mean)",
        xlab = "Attributes", ylab = "Values",
        names.arg = summary_df$Attribute)
dev.off()


bs<-updatedDataFrame4$BS
min_bs<-min(bs, na.rm = TRUE)
max_bs<-max(bs, na.rm = TRUE)
normalized_bs<-(bs - min_bs)/(max_bs - min_bs)
updatedDataFrame4$BS <- normalized_bs
updatedDataFrame4

updatedDataFrame4$Smoking[updatedDataFrame4$Smoking == "1"] <- "yes"
updatedDataFrame4$Smoking[updatedDataFrame4$Smoking == "2"] <- "sometimes"
updatedDataFrame4$Smoking[updatedDataFrame4$Smoking == "3"] <- "no"
updatedDataFrame4