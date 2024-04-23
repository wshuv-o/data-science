library("dplyr")
data <- read.csv("C://Users//Shuvo//Downloads//archive//Housing.csv")

str(data)
colSums(is.na(data))

data$date <- as.Date(data$date, format = "%Y%m%dT%H%M%S")
data$quarter <- cut(data$date, breaks = "quarter")
data$quarter <- as.integer(data$quarter)
head(data)


pearson_corr_id <- cor(data$id, data$price, method = "pearson")
spearman_corr_id <- cor(data$id, data$price, method = "spearman")
print(paste("Pearson correlation coefficient:", pearson_corr_id))
print(paste("Spearman correlation coefficient:", spearman_corr_id))


pearson_corr_bedrooms <- cor(data$bedrooms, data$price, method = "pearson")
spearman_corr_bedrooms <- cor(data$bedrooms, data$price, method = "spearman")
print(paste("Pearson correlation coefficient:", pearson_corr_bedrooms))
print(paste("Spearman correlation coefficient:", spearman_corr_bedrooms))



calculate_correlation_with_price <- function(data, column_names) {
  correlation_results <- list()
  for (var in column_names) {
    pearson_correlation <- cor(data$price, data[[var]], method = "pearson")
    spearman_correlation <- cor(data$price, data[[var]], method = "spearman")
    correlation_results[[var]] <- list(Pearson = pearson_correlation, Spearman = spearman_correlation)
  }
  
  correlation_results_df <- do.call(rbind, correlation_results)
  return(as.data.frame(correlation_results_df))
}

columns <- c("bedrooms", "bathrooms", "sqft_living", "sqft_lot", "floors", 
             "waterfront", "view", "condition", "grade", "sqft_above", 
             "sqft_basement", "yr_built", "yr_renovated", "zipcode", 
             "lat", "long", "sqft_living15", "sqft_lot15","quarter")

correlation_results <- calculate_correlation_with_price(data, columns)
print(correlation_results)



anova <- aov(price ~ quarter, data = data)
summary(anova)
kendall <- cor.test(data$quarter, data$price, method = "kendall")
print(kendall)


data2 <- subset(data, select = -date)


calculate_correlation <- function(x, y) {
  pearson_corr <- cor.test(x, y, method = "pearson")
  pearson_coef <- pearson_corr$estimate
  spearman_corr <- cor.test(x, y, method = "spearman")
  spearman_coef <- spearman_corr$estimate
  return(list(pearson = pearson_coef, spearman = spearman_coef))
}

attributes <- c("bedrooms", "bathrooms", "sqft_living", "sqft_lot", "floors", 
                "waterfront", "view", "condition", "grade", "sqft_above", 
                "sqft_basement", "yr_built", "yr_renovated", "zipcode", 
                "lat", "long", "sqft_living15", "sqft_lot15", "quarter")

for (target_attr in attributes) {
  cat("Correlation between 'price' and '", target_attr, "' as target attribute:\n")
  target <- data2[[target_attr]]  
  
  for (attr in attributes) {
    if (attr != target_attr) {  
      correlation <- calculate_correlation(target, data2[[attr]])
      cat("Attribute:", attr, "\n")
      cat("Pearson correlation coefficient:", correlation$pearson, "\n")
      cat("Spearman correlation coefficient:", correlation$spearman, "\n\n")
    }
  }
  cat("---------------------------------------------------\n")
}

