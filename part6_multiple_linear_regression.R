############################################################
# PART 6: Multiple Linear Regression
# Author: Suman Bhowmick
# Description:
# Learn to build a multiple linear regression model with
# several predictors.
############################################################

### 0. Install and Load Required Packages
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("car")) install.packages("car") # For checking multicollinearity
library(tidyverse)
library(car)

### 1. Load and Prepare Data
df <- mtcars
df <- df %>%
  mutate(
    cyl = factor(cyl),
    gear = factor(gear),
    car = rownames(mtcars)
  )

cat("\n✅ Data prepared. Let's predict MPG from multiple variables.\n")
print(head(df))

### 2. Build the Multiple Linear Regression Model
# Now we predict 'mpg' using 'wt', 'hp' (Horsepower), and 'cyl' (Cylinders).
# The formula `mpg ~ wt + hp + cyl` adds more predictors.

multi_model <- lm(mpg ~ wt + hp + cyl, data = df)

cat("\n✅ Multiple linear model built successfully.\n")

### 3. Interpret the Model Summary
cat("\n📊 MODEL SUMMARY:\n")
print(summary(multi_model))

cat("
--------------------------------------------------------------------
INTERPRETATION OF THE SUMMARY:
--------------------------------------------------------------------
1.  **Coefficients (Estimate column):**
    - **wt = -3.18140:** For each 1000 lbs increase in weight, MPG is predicted
      to DECREASE by 3.18 miles, *holding horsepower and cylinders constant*.
    - **hp = -0.02312:** For each 1 unit increase in horsepower, MPG is predicted
      to DECREASE by 0.023 miles, *holding weight and cylinders constant*.
    - **cyl6 = -3.35902:** A 6-cylinder car is predicted to have 3.36 less MPG
      than a 4-cylinder car (the baseline), *holding weight and horsepower constant*.

2.  **P-values (Pr(>|t|)):**
    - 'wt' and 'cyl' have significant p-values (< 0.05), making them strong predictors.
    - The p-value for 'hp' is 0.0636. At a standard 0.05 significance level,
      **hp is not a statistically significant predictor** in this model.

3.  **Adjusted R-squared = 0.8361:**
    - We use **Adjusted R-squared** for multiple regression. It adjusts for the
      number of predictors in the model.
    - An Adjusted R-squared of 0.8361 means ~83.6% of the variance in MPG
      is explained by our model. This is a strong fit and an improvement
      over the simple model.
--------------------------------------------------------------------
")

### 4. Checking for Multicollinearity
# Multicollinearity is when predictors are highly correlated with each other.
# This can make coefficient estimates unstable.
# The Variance Inflation Factor (VIF) helps detect this.
# A VIF value > 5 or 10 is often considered high.

vif_values <- vif(multi_model)
cat("\n🔎 VARIANCE INFLATION FACTOR (VIF):\n")
print(vif_values)

cat("
--------------------------------------------------------------------
INTERPRETATION OF VIF:
--------------------------------------------------------------------
- The VIF values for 'wt' and 'hp' are well below 5.
- The GVIF for 'cyl' is ~5.1, which is slightly over the threshold of 5.
  However, for categorical predictors, we look at the GVIF^(1/(2*Df)) value,
  which is ~1.50 and is low.
- Overall, multicollinearity is not a major issue in our model.
--------------------------------------------------------------------
")


### 5. Making Predictions with the Multiple Regression Model
# Let's predict MPG for a car with specific characteristics.
new_car_data <- data.frame(
  wt = 2.5,       # 2500 lbs
  hp = 150,       # 150 horsepower
  cyl = factor(6) # 6 cylinders
)

prediction <- predict(multi_model, newdata = new_car_data)

cat("\n🔮 PREDICTION for a new car:\n")
print(paste("Predicted MPG:", round(prediction, 2)))
cat("\nThis model gives a more nuanced prediction by considering multiple factors.\n")


### 6. Comparing Models
# Is the multiple regression model better than the simple one?
simple_model <- lm(mpg ~ wt, data = df)

cat("\n⚖️ COMPARING MODELS using Adjusted R-squared:\n")
cat(paste("Simple Model (mpg ~ wt):", round(summary(simple_model)$adj.r.squared, 4), "\n"))
cat(paste("Multiple Model (mpg ~ wt + hp + cyl):", round(summary(multi_model)$adj.r.squared, 4), "\n"))
cat("
The multiple model has a higher Adjusted R-squared, so it provides a better fit to the data.
")

cat("\n\n-- End of Part 6 --\n")
