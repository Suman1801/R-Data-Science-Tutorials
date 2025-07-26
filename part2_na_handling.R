##################################################
# PART 2: Handling Missing Values (NA) in R
# Author: Suman Bhowmick
# Description:
# Learn how to detect, replace, visualize, and clean NA values in datasets.
##################################################

### 0. Load Required Packages
packages <- c("dplyr", "tidyr", "naniar", "VIM")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg)
  library(pkg, character.only = TRUE)
}

### 1. Load and Prepare Dataset
data("mtcars")
df <- mtcars
df <- df %>%
  rename(
    mpg = mpg,
    cyl = cyl,
    disp = disp,
    hp = hp,
    drat = drat,
    wt = wt,
    qsec = qsec,
    vs = vs,
    am = am,
    gear = gear,
    carb = carb
  )

# Simulate Missing Data
set.seed(123)
df[sample(1:nrow(df), 5), "mpg"] <- NA
df[sample(1:nrow(df), 3), "hp"] <- NA
df[sample(1:nrow(df), 2), "wt"] <- NA

cat("\n✅ Missing values introduced.\n")
print(colSums(is.na(df)))

### 2. Visualize Missing Values
cat("\n📊 Visualizing Missingness Matrix\n")
naniar::vis_miss(df)

cat("\n📉 Missing Value Pattern Table\n")
print(mice::md.pattern(df))

### 3. Check NA by Column and Row
cat("\n🔍 NA Count by Column:\n")
print(colSums(is.na(df)))

cat("\n🔍 NA Count by Row:\n")
df$NA_count <- rowSums(is.na(df))
print(head(df[, c("mpg", "hp", "wt", "NA_count")]))

### 4. Replace NA with Zero
df_zero <- df %>% mutate(across(c(mpg, hp, wt), ~replace_na(., 0)))
cat("\n✅ Replaced NA with 0. Check result:\n")
print(head(df_zero[, c("mpg", "hp", "wt")]))

### 5. Replace NA with Mean
df_mean <- df %>% mutate(across(c(mpg, hp, wt), ~ifelse(is.na(.), mean(., na.rm = TRUE), .)))
cat("\n✅ Replaced NA with column mean. Preview:\n")
print(head(df_mean[, c("mpg", "hp", "wt")]))

### 6. Replace NA with Median
df_median <- df %>% mutate(across(c(mpg, hp, wt), ~ifelse(is.na(.), median(., na.rm = TRUE), .)))
cat("\n✅ Replaced NA with column median. Preview:\n")
print(head(df_median[, c("mpg", "hp", "wt")]))

### 7. Replace NA with Mode (Custom Function)
get_mode <- function(x) {
  ux <- unique(na.omit(x))
  ux[which.max(tabulate(match(x, ux)))]
}
df_mode <- df %>% mutate(across(c(mpg, hp, wt), ~ifelse(is.na(.), get_mode(.), .)))
cat("\n✅ Replaced NA with column mode. Preview:\n")
print(head(df_mode[, c("mpg", "hp", "wt")]))

### 8. Drop Rows with Any NA
df_drop_row <- df %>% drop_na()
cat("\n🗑️ Dropped rows with NA. Rows before:", nrow(df), ", after:", nrow(df_drop_row), "\n")

### 9. Drop Columns with Too Many NAs
# Simulate extra NA column
df$dummy <- NA
cat("\n🔍 Checking for columns with all NAs:\n")
print(colSums(is.na(df)))

df_drop_col <- df[, colSums(is.na(df)) < nrow(df)]
cat("✅ Dropped full-NA columns. Columns remaining:\n")
print(names(df_drop_col))

### 10. Flag Missing as New Column
df_flagged <- df %>%
  mutate(mpg_missing = ifelse(is.na(mpg), 1, 0))

cat("\n🚩 Added flag column 'mpg_missing':\n")
print(head(df_flagged[, c("mpg", "mpg_missing")]))

### 11. Final Check
cat("\n✅ Final NA Count in Cleaned Data:\n")
print(colSums(is.na(df_flagged)))
