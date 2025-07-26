# 📘 R Data Science Tutorials (Beginner to Intermediate)

This repository contains a complete, step-by-step tutorial series to help you learn **R programming for data science from scratch**, using **freely available datasets** like `mtcars`. Each script is carefully explained so you understand not just *what* to do, but *why* you are doing it and *what you'll learn* by running each block of code.

---

## 📂 Files in This Repository

| File                             | What It Teaches                                                               |
| -------------------------------- | ----------------------------------------------------------------------------- |
| `part1_data_cleaning_advanced.R` | Complete guide to data cleaning in R using base R and `dplyr`                 |
| `part2_na_handling.R`            | Strategies for detecting, visualizing, replacing, and removing missing values |
| `part3_base_r_visualization.R`   | Core data visualization techniques using base R functions                     |
| `part4_ggplot2_visualization.R`  | Elegant and layered visualizations using `ggplot2`                            |                    |

---

## 📌 What You Will Learn (With Code-Level Explanations)

Got it! Here's a more **elaborate yet simple explanation** for each of the four parts in your README — expanding the explanations with more details on *why* each step matters and *what exactly happens* in the code, so readers can fully grasp the concepts.

---

### ✅ Part 1: Data Cleaning — Detailed & Simple Explanation

**Goal:** Make sure your dataset is neat, consistent, and ready for any analysis.

* `data("mtcars")` and `df <- mtcars`
  *Loads the built-in mtcars dataset and copies it.* This way, you keep the original data safe and work on a fresh copy.

* `janitor::clean_names()`
  *Automatically changes messy column names to clean, consistent ones.* For example, spaces or special characters are replaced by underscores, so your code won’t break and typing names becomes easier.

* `glimpse(df)` and `skim(df)`
  *Quickly explore the data structure and summary statistics.* `glimpse()` shows you variable types and a preview of data, while `skim()` gives detailed info like mean, median, missing values, and distribution, helping you understand what’s inside.

* `rename()` and `relocate()`
  *Change column names for clarity and reorder columns to keep important ones upfront.* This makes your dataset easier to read and work with.

* `mutate(cyl = as.factor(cyl))`
  *Converts a numeric column (number of cylinders) to a categorical factor.* This is important because treating `cyl` as a category (like “4 cylinders” or “6 cylinders”) lets you create better group-wise summaries and plots.

* `filter()`, `select()`, `arrange()`
  *Filter selects rows based on conditions, select picks columns, and arrange sorts rows.* These tools help you remove irrelevant data, focus on specific parts, or order your data logically.

* `distinct()`
  *Removes duplicate rows.* Duplicate data can bias results, so cleaning them out ensures your analysis is accurate.

**By the end of Part 1:** You’ll have a well-organized dataset with clear column names, correct data types, no duplicates, and a structure that makes it easy to explore and analyze.

---

### ✅ Part 2: Handling Missing Values (NA) — Detailed & Simple Explanation

**Goal:** Identify and manage missing or incomplete data so it doesn’t skew your analysis.

* `is.na()` + `colSums()`
  *Detects where missing values (NA) are located and counts them per column.* This tells you which variables need cleaning.

* `vis_miss()` and `md.pattern()`
  *Create visual heatmaps and patterns showing missing data.* These visual tools help you see if missing values are random or follow a pattern, which affects how you fix them.

* `replace_na()` and `ifelse(is.na(...))`
  *Replace missing values with sensible defaults or calculated values.* For example, fill missing numeric data with a mean or median, or fill missing categories with the most common category.

* `get_mode()` function
  *Custom function to find the most frequent value (mode),* since R doesn’t have this built-in. Useful to replace missing categorical data with the typical category.

* `drop_na()`
  *Remove rows with any missing data.* Sometimes best if missingness is low and random, so you only keep complete cases.

* `df[, colSums(is.na(df)) < nrow(df)]`
  *Remove columns completely filled with missing data.* These columns add no information and just clutter your dataset.

* `mutate(mpg_missing = ifelse(is.na(mpg), 1, 0))`
  *Create a new column marking which rows had missing values.* This lets you track missingness effects during later analysis.

**By the end of Part 2:** You will know how to detect missing data, visualize its pattern, and choose the best way to handle it — whether by filling, removing, or flagging — so your dataset is clean and trustworthy.

---

### ✅ Part 3: Base R Visualization — Detailed & Simple Explanation

**Goal:** Learn to use R’s basic plotting functions to explore and understand your data visually.

* `barplot(table(df$cyl))`
  *Shows how many cars fall into each cylinder category.* A quick way to see distribution of groups.

* `pie(table(df$gear))`
  *Visualizes proportions of gear counts as a pie chart,* giving an intuitive feel for relative sizes.

* `hist(df$mpg)`
  *Displays the distribution of miles per gallon (mpg) values.* Helps you see if data is skewed or normally distributed.

* `boxplot(mpg ~ cyl, data = df)`
  *Compares mpg across cylinder groups using boxplots,* showing median, spread, and outliers per group.

* `plot(x, y)`
  *Basic scatter plot to check relationships between two variables,* for example, mpg vs. weight.

* `par(mfrow = c(2,2))`
  *Arranges multiple plots on the same window,* making it easier to compare different visualizations side-by-side.

**By the end of Part 3:** You will be comfortable making all common plot types in base R, adding labels, colors, and organizing multiple charts in one window to get visual insights quickly.

---

### ✅ Part 4: `ggplot2` Visualization — Detailed & Simple Explanation

**Goal:** Master creating polished, flexible, and layered plots with the powerful `ggplot2` package.

* `ggplot(df, aes(x, y)) + geom_point()`
  *Starts a scatterplot by defining the dataset and mapping x and y variables,* then adds points — the foundation of many plots.

* `geom_bar()`, `geom_histogram()`, `geom_boxplot()`
  *Add different types of layers to create bar charts, histograms, or boxplots,* allowing you to visualize counts, distributions, and group comparisons.

* `aes(color = cyl, fill = gear)`
  *Maps colors and fills to categorical variables,* which helps distinguish groups visually and adds meaning to your plot.

* `facet_wrap(~ cyl)`
  *Splits your plot into multiple small plots based on cylinder groups,* so you can compare patterns across categories side-by-side.

* `theme_minimal()`, `theme_bw()`, `theme_light()`
  *Apply clean and simple themes* to make your plots look professional and easier to read.

* `labs(title = ..., x = ..., y = ...)`
  *Add descriptive titles and axis labels* to explain what your plot shows.

* `ggsave()`
  *Save your plot as an image file* so you can include it in reports or presentations.

**By the end of Part 4:** You will be able to build advanced, beautiful plots by adding layers, customizing colors and themes, faceting, and saving your work — skills essential for communicating data insights clearly.

---

## 📦 Packages Used

| Package        | Purpose                         |
| -------------- | ------------------------------- |
| `tidyverse`    | Wrangling + ggplot2 plotting    |
| `janitor`      | Clean column names              |
| `skimr`        | Summary stats for each variable |
| `summarytools` | Full profiling of data frame    |
| `naniar`       | NA visualization heatmaps       |
| `VIM`, `mice`  | Missing data diagnostics        |

All packages are freely available on CRAN. Each script installs missing ones automatically.

---

## 🚀 How to Use This Repo

1. Clone or download this repository
2. Open `.R` files in RStudio
3. Run each script section by section
4. Observe output in console and plot window

Each part is a **standalone tutorial** with output built-in — great for self-paced learning.

---

## 👨‍🏫 Author

Created by **Suman Bhowmick** to help beginners and students learn R practically for academic research and data science.

---

## 🗓️ Coming Soon

* Part 5: Correlation, Summary Statistics & Matrix Plots
* Part 6: Time Series & Date Handling
* Part 7: Modeling Basics (Linear Regression)
* Part 8: Writing Your Own Functions in R

---

## 📜 License

MIT License — free to use, modify, and share.
