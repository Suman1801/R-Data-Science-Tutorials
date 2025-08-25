############################################################
# PART 6: Multiple Linear Regression
# Author: Suman Bhowmick
# Description:
# Demonstration of multiple linear regression with several 
# predictors using the mtcars dataset.
############################################################

### 0. Install and Load Required Packages
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("car")) install.packages("car") # For VIF check
library(tidyverse)
library(car)

### 1. Data Preparation
df <- mtcars %>%
  mutate(
    cyl = factor(cyl),
    gear = factor(gear),
    car = rownames(mtcars)
  )

cat("\nData prepared. Using predictors: wt, hp, cyl to model mpg.\n")
print(head(df))

### 2. Model Building
multi_model <- lm(mpg ~ wt + hp + cyl, data = df)
cat("\nMultiple linear regression model built.\n")

### 3. Model Summary
cat("\nMODEL SUMMARY:\n")
print(summary(multi_model))

### 4. Multicollinearity Check
vif_values <- vif(multi_model)
cat("\nVARIANCE INFLATION FACTOR (VIF):\n")
print(vif_values)

### 5. Prediction
new_car <- data.frame(
  wt = 2.5,    # 2500 lbs
  hp = 150,    # 150 horsepower
  cyl = factor(6)
)

prediction <- predict(multi_model, newdata = new_car)
cat("\nPrediction for new car:\n")
print(paste("Predicted MPG:", round(prediction, 2)))

### 6. Model Comparison
simple_model <- lm(mpg ~ wt, data = df)

cat("\nMODEL COMPARISON (Adjusted R-squared):\n")
cat(paste("Simple model (mpg ~ wt):", round(summary(simple_model)$adj.r.squared, 4), "\n"))
cat(paste("Multiple model (mpg ~ wt + hp + cyl):", round(summary(multi_model)$adj.r.squared, 4), "\n"))

cat("\n-- End of Part 6 --\n")
