############################################################
# PART 5: Simple Linear Regression
# Author: Suman Bhowmick
# Description:
# Learn to build, interpret, and visualize a simple linear 
# regression model in R.
############################################################

### 0. Install and Load Required Packages
# We'll use tidyverse for data manipulation and plotting.
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

### 1. Load and Prepare Data
# We use the built-in 'mtcars' dataset.
df <- mtcars
df <- df %>%
  mutate(
    cyl = factor(cyl),
    gear = factor(gear),
    car = rownames(mtcars)
  )

cat("\n??? Data prepared. Let's predict MPG from Weight.\n")
print(head(df))

### 2. Build the Simple Linear Regression Model
# We want to model how 'mpg' (Miles Per Gallon) changes with 'wt' (Weight).
# The formula `mpg ~ wt` means "predict mpg using wt".
# The lm() function is used to fit linear models.

model <- lm(mpg ~ wt, data = df)

cat("\n??? Linear model built successfully.\n")

### 3. Interpret the Model Summary
# The summary() function gives us detailed statistics about the model.
cat("\n???? MODEL SUMMARY:\n")
print(summary(model))

cat("
--------------------------------------------------------------------
INTERPRETATION OF THE SUMMARY:
--------------------------------------------------------------------
1.  **Coefficients (Estimate column):**
    - **(Intercept) = 37.285:** This is the predicted MPG for a car with zero weight.
      It's often just a baseline and may not be meaningful in reality.
    - **wt = -5.344:** For each 1000 lbs increase in weight, the MPG is predicted
      to DECREASE by 5.344 miles. This is the slope of our regression line.

2.  **P-value (Pr(>|t|) column):**
    - The tiny p-value for 'wt' (e.g., 1.29e-10) is much smaller than 0.05.
      This means the relationship between weight and MPG is statistically significant.
      In other words, weight is a reliable predictor of MPG.

3.  **Multiple R-squared = 0.7528:**
    - This tells us that approximately 75% of the variation in MPG can be
      explained by the car's weight. This is a good fit!
--------------------------------------------------------------------
")

### 4. Visualize the Regression Line with ggplot2
# We can plot our data and add the regression line to see how well it fits.

cat("\n???? VISUALIZING the regression line:\n")
p_regression <- ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl), size = 3) +  # Scatter plot of original data
  geom_smooth(method = "lm", se = FALSE, color = "black") + # Add the linear model line
  labs(
    title = "MPG vs. Weight: Simple Linear Regression",
    x = "Weight (1000 lbs)",
    y = "Miles Per Gallon (MPG)"
  ) +
  theme_minimal()

print(p_regression)
cat("??? Plot generated. The black line is our model's prediction.\n")

### 5. Making Predictions
# We can use our model to predict MPG for new weight values.
new_data <- data.frame(wt = c(2.0, 3.0, 4.0)) # Create a new data frame with weights

predictions <- predict(model, newdata = new_data)

cat("\n???? PREDICTIONS for new data:\n")
print(data.frame(Weight = new_data$wt, Predicted_MPG = predictions))
cat("
As expected, as weight increases, the predicted MPG decreases.
")

### 6. Checking Model Assumptions (Diagnostics)
# Linear regression has assumptions. A quick way to check them is to plot the model.
# These plots help identify issues like non-linearity or outliers.

par(mfrow = c(2, 2)) # Arrange plots in a 2x2 grid
plot(model)
par(mfrow = c(1, 1)) # Reset plotting window

cat("\n\n???? DIAGNOSTIC PLOTS generated. These help verify model assumptions.\n")
cat("
- **Residuals vs. Fitted:** Should show no clear pattern (random cloud).
- **Normal Q-Q:** Points should fall close to the straight line.
- **Scale-Location:** Spread of points should be roughly constant.
- **Residuals vs. Leverage:** Helps identify influential outlier points.
")

cat("\n\n-- End of Part 5 --\n")
