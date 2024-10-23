# Load necessary library
install.packages("dplyr")
library(dplyr)

# Read the dataset
df <- read.csv("House.csv")

# Set seed for reproducibility
set.seed(123)

# Reduce dataset to 3,250 observations
df_reduced <- df %>% sample_n(3250)

# Introduce 60 random missing values
for(i in 1:60) {
  # Select a random row and column
  row <- sample(1:nrow(df_reduced), 1)
  col <- sample(2:ncol(df_reduced), 1)  # starting from 2 to avoid the 'id' column
  
  # Introduce a missing value
  df_reduced[row, col] <- NA
}

# Check for missing values within the entire dataset
total_missing_values <- sum(is.na(df_reduced))
print(total_missing_values)

# Check for missing values for each column separately
missing_values_per_column <- colSums(is.na(df_reduced))
print(missing_values_per_column)

# Save the modified dataset as House_Dataset
write.csv(df_reduced, "House_Dataset.csv", row.names = FALSE)
