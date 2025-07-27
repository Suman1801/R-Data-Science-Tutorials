##################################################
# PART 4: Data Visualization with ggplot2
# Author: Suman Bhowmick
# Description:
# Learn to create beautiful, layered plots using ggplot2.
##################################################

### 0. Install and Load Required Packages
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

### 1. Load and Prepare Data
df <- mtcars
df <- df %>%
  mutate(
    cyl = factor(cyl),
    gear = factor(gear),
    car = rownames(mtcars)
  )

cat("\n✅ Data prepared. Head preview:\n")
print(head(df))

### 2. Scatter Plot: MPG vs HP with Color by Cylinder

cat("\n📍 SCATTERPLOT: MPG vs HP colored by cyl\n")
p1 <- ggplot(df, aes(x = hp, y = mpg, color = cyl)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "MPG vs Horsepower by Cylinder",
       x = "Horsepower", y = "Miles Per Gallon", color = "Cylinders") +
  theme_minimal()
print(p1)

### 3. Bar Plot: Number of Cars per Gear Type

cat("\n📊 BARPLOT: Car count by gear\n")
p2 <- ggplot(df, aes(x = gear, fill = gear)) +
  geom_bar() +
  labs(title = "Number of Cars by Gear Type",
       x = "Gear", y = "Count") +
  theme_light()
print(p2)

### 4. Histogram of MPG

cat("\n📊 HISTOGRAM: MPG Distribution\n")
p3 <- ggplot(df, aes(x = mpg)) +
  geom_histogram(fill = "skyblue", color = "white", bins = 10) +
  labs(title = "Histogram of MPG", x = "Miles Per Gallon", y = "Frequency") +
  theme_bw()
print(p3)

### 5. Density Plot of MPG by Gear

cat("\n📈 DENSITY PLOT: MPG by Gear\n")
p4 <- ggplot(df, aes(x = mpg, fill = gear)) +
  geom_density(alpha = 0.5) +
  labs(title = "MPG Distribution by Gear", x = "MPG", y = "Density") +
  theme_classic()
print(p4)

### 6. Boxplot: MPG by Cylinder Group

cat("\n📦 BOXPLOT: MPG by Cylinder\n")
p5 <- ggplot(df, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = "MPG by Cylinder", x = "Cylinder", y = "MPG") +
  theme_minimal()
print(p5)

### 7. Line Plot: MPG Over Index (Car ID)

cat("\n📈 LINE PLOT: MPG by Car Index\n")
df <- df %>% mutate(car_id = 1:n())
p6 <- ggplot(df, aes(x = car_id, y = mpg)) +
  geom_line(color = "steelblue", size = 1.2) +
  labs(title = "MPG Over Car Index", x = "Car ID", y = "MPG") +
  theme_light()
print(p6)

### 8. Faceting: Boxplot by Gear and Cyl

cat("\n🧩 FACETED PLOT: MPG by Gear and Cyl\n")
p7 <- ggplot(df, aes(x = gear, y = mpg, fill = gear)) +
  geom_boxplot() +
  facet_wrap(~ cyl) +
  labs(title = "MPG by Gear Grouped by Cylinder", x = "Gear", y = "MPG") +
  theme_bw()
print(p7)

### 9. Custom Theme and Labels

cat("\n🎨 CUSTOMIZED PLOT: MPG vs Weight\n")
p8 <- ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(color = "tomato", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title = "Scatter Plot of MPG vs Weight",
    subtitle = "With linear regression line",
    x = "Weight (1000 lbs)",
    y = "Miles Per Gallon"
  ) +
  theme_minimal(base_size = 14)
print(p8)

### 10. Save Plot to File

cat("\n💾 SAVING: Saving last plot to PNG\n")
ggsave("mpg_vs_weight.png", plot = p8, width = 7, height = 5)
cat("✅ Plot saved to: mpg_vs_weight.png\n")

