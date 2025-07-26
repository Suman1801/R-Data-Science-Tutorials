##################################################
# PART 3: Data Visualization using Base R
# Author: Suman Bhowmick
# Description:
# Learn core plotting functions using base R (no packages).
# Visual feedback follows every command.
##################################################

### 1. Load and Prepare Dataset
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)
df$gear <- as.factor(df$gear)

cat("\n✅ Dataset loaded. Columns available:\n")
print(colnames(df))

### 2. Bar Plot: Frequency of Cylinders

cat("\n📊 BARPLOT: Number of cars by cylinder count\n")
cyl_table <- table(df$cyl)
barplot(cyl_table,
        main = "Number of Cars by Cylinder Count",
        col = c("orange", "lightblue", "lightgreen"),
        xlab = "Cylinders", ylab = "Frequency",
        border = "black")

### 3. Pie Chart: Gear Distribution

cat("\n🥧 PIE CHART: Proportion of Gear Types\n")
gear_table <- table(df$gear)
pct <- round(gear_table / sum(gear_table) * 100)
labels <- paste(names(gear_table), " (", pct, "%)", sep = "")
pie(gear_table, labels = labels,
    col = c("red", "green", "blue"),
    main = "Gear Type Distribution")

### 4. Histogram: Miles Per Gallon (MPG)

cat("\n📊 HISTOGRAM: Distribution of MPG\n")
hist(df$mpg,
     breaks = 10, col = "skyblue", border = "white",
     main = "Histogram of Miles Per Gallon",
     xlab = "MPG")

### 5. Boxplot: MPG by Cylinder

cat("\n📦 BOXPLOT: MPG grouped by Cylinder\n")
boxplot(mpg ~ cyl, data = df,
        main = "MPG by Cylinder",
        xlab = "Cylinder", ylab = "MPG",
        col = c("orange", "lightblue", "lightgreen"))

### 6. Scatter Plot: MPG vs Weight

cat("\n📍 SCATTERPLOT: MPG vs Weight\n")
plot(df$wt, df$mpg,
     main = "MPG vs Car Weight",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     col = "purple", pch = 16)

### 7. Line Plot: MPG Across Car Index

cat("\n📈 LINE PLOT: MPG across cars (index)\n")
plot(df$mpg, type = "l",
     main = "Miles Per Gallon Across Cars",
     ylab = "MPG", xlab = "Index",
     col = "darkgreen", lwd = 2)

### 8. Multiple Plots on One Page

cat("\n🧩 MULTI-PLOT: Displaying 4 plots in 2x2 grid\n")
par(mfrow = c(2, 2))  # 2 rows, 2 columns

# Plot 1: Histogram
hist(df$mpg, col = "lightgray", main = "MPG Distribution")

# Plot 2: Boxplot
boxplot(df$hp, main = "Horsepower Spread", col = "plum")

# Plot 3: Barplot
barplot(table(df$gear), main = "Gear Counts", col = "pink")

# Plot 4: Scatter
plot(df$disp, df$mpg, main = "Displacement vs MPG",
     col = "blue", pch = 17)

# Reset layout
par(mfrow = c(1, 1))

cat("\n✅ Multi-panel plotting complete.\n")

### 9. Custom Axis and Titles

cat("\n🎯 CUSTOMIZATION: Scatterplot with axis tweaks\n")
plot(df$hp, df$qsec,
     main = "HP vs 1/4 Mile Time",
     xlab = "Horsepower", ylab = "Quarter Mile Time",
     pch = 19, col = "steelblue",
     xlim = c(min(df$hp) - 10, max(df$hp) + 10),
     ylim = c(min(df$qsec) - 1, max(df$qsec) + 1))
grid()

### 10. Saving a Plot to File (Optional)

cat("\n💾 SAVING: Exporting a plot to PNG\n")
png("scatter_hp_vs_mpg.png", width = 600, height = 400)
plot(df$hp, df$mpg,
     main = "Horsepower vs MPG",
     xlab = "HP", ylab = "MPG",
     col = "darkred", pch = 19)
dev.off()
cat("✅ Plot saved to: scatter_hp_vs_mpg.png\n")
