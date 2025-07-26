##################################################
# PART 1: DATA CLEANING (Advanced Beginner Tutorial)
# Author: Suman Bhowmick
# Description:
# A complete tutorial for beginner-to-intermediate learners.
# Demonstrates full data cleaning workflow using base R and tidyverse.
##################################################

### 0. Install & Load Packages
packages <- c("dplyr", "janitor", "skimr", "summarytools")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg)
  library(pkg, character.only = TRUE)
}

### 1. Load Dataset
data("mtcars")
df <- mtcars
df <- df %>% janitor::clean_names()  # Convert to snake_case

cat("\n✅ Data Loaded and Column Names Cleaned\n")
print(names(df))

### 2. Initial Data Profiling
cat("\n📊 Dataset Dimensions:\n")
cat("Rows:", nrow(df), "Cols:", ncol(df), "\n")

cat("\n🔍 Glimpse of Data:\n")
glimpse(df)

cat("\n🧹 Quick Summary (skimr):\n")
print(skimr::skim(df))

cat("\n📋 Descriptive Stats (summarytools):\n")
print(dfSummary(df), method = "viewer")

### 3. Rename Columns (Tidyverse)

df <- df %>%
  rename(
    miles_per_gallon = mpg,
    cylinders = cyl,
    displacement = disp
  )

cat("\n✏️ Renamed selected columns:\n")
print(names(df)[1:5])

### 4. Reorder & Relocate Columns
df <- df %>%
  mutate(car_id = row_number()) %>%
  relocate(car_id, .before = mpg)

cat("\n🔀 Moved car_id column to front:\n")
print(head(df, 3))

### 5. Convert Data Types
df <- df %>%
  mutate(cyl = as.factor(cyl))

cat("\n🔁 Converted 'cyl' to factor:\n")
str(df$cyl)

### 6. Filtering Rows
cat("\n🔍 Filtering: mpg > 25 and cyl == 4\n")
filtered_df <- df %>% filter(mpg > 25, cyl == 4)
print(filtered_df)

### 7. Dropping Columns
cat("\n🗑️ Dropping columns: gear and carb\n")
df <- df %>% select(-gear, -carb)
cat("Remaining columns:\n")
print(names(df))

### 8. Sorting and Ranking
cat("\n⬇️ Sorting by mpg descending...\n")
df <- df %>% arrange(desc(mpg))
print(head(df[, c("car_id", "mpg")]))

### 9. Detect & Remove Duplicates
df_dup <- bind_rows(df, df[1, ])  # Add a duplicate
cat("\n🔍 Number of duplicates: ", sum(duplicated(df_dup)), "\n")
df_clean <- df_dup %>% distinct()
cat("✅ Duplicates removed. Final rows:", nrow(df_clean), "\n")

### 10. Standardize Column Names
cat("\n🔠 Final column names (standardized):\n")
print(names(df_clean))
