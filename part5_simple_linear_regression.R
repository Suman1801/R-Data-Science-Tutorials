############################################################
# PART 5: Simple Linear Regression
# Author: Suman Bhowmick
# Description:
# Build, fit, and visualize a simple linear regression model in R.
############################################################

### 0. Install and Load Required Packages
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

### 1. Load and Prepare Data
# Using the built-in 'mtcars' dataset.
df <- mtcars
df <- df %>%
  mutate(
    cyl = factor(cyl),
    gear = factor(gear),
    car = rownames(mtcars)
  )

cat("\nData prepared. Using MPG as dependent variable and Weight as predictor.\n")
print(head(df))

### 2. Build the Simple Linear Regression Model
# Formula: mpg ~ wt
model <- lm(mpg ~ wt, data = df)
cat("\nLinear model fitted successfully.\n")

### 3. Model Summary
cat("\nMODEL SUMMARY:\n")
print(summary(model))

### 4. Visualize the Regression Line
cat("\nGenerating regression plot...\n")
p_regression <- ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl), size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title = "MPG vs. Weight: Simple Linear Regression",
    x = "Weight (1000 lbs)",
    y = "Miles Per Gallon (MPG)"
  ) +
  theme_minimal()

print(p_regression)
cat("Regression plot generated.\n")

### 5. Making Predictions
# Predict MPG for new weights
new_data <- data.frame(wt = c(2.0, 3.0, 4.0))
predictions <- predict(model, newdata = new_data)

cat("\nPredictions for new data:\n")
print(data.frame(Weight = new_data$wt, Predicted_MPG = predictions))

### 6. Model Diagnostics
cat("\nGenerating diagnostic plots...\n")
par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

cat("\nDiagnostic plots generated.\n")
cat("\n-- End of Part 5 --\n")
