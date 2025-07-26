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

### ✅ Part 1: Data Cleaning — Detailed Explanation

**Goal:** Ensure that the dataset is structured, clean, and ready for analysis.

#### Key Code Blocks Explained:

* `data("mtcars")` and `df <- mtcars`: Loads and copies the dataset so we work on a fresh object.
* `janitor::clean_names()`: Automatically formats column names (e.g., "Miles/Gallon" becomes "miles\_per\_gallon") to avoid syntax errors.
* `glimpse(df)` and `skim(df)`: Give structural and statistical summaries. These help understand variable types and data quality.
* `rename()` and `relocate()`: Help rename variables and reorder columns to highlight what's important.
* `mutate(cyl = as.factor(cyl))`: Converts numeric column to a factor — critical for categorical visualizations later.
* `filter()`, `select()`, `arrange()`: Used to clean and transform data by logic (e.g., dropping irrelevant columns, filtering for certain values).
* `distinct()`: Removes duplicated rows to avoid repeated analysis.

🔍 **By the end**: You'll get a dataset with standardized column names, correct data types, no duplicates, and reorganized columns — the perfect starting point for analysis.

---

### ✅ Part 2: Handling Missing Values (NA) — Detailed Explanation

**Goal:** Deal with incomplete data in different ways to make the dataset analysis-ready.

#### Key Code Blocks Explained:

* `is.na()` + `colSums()`: Detect missing values column-wise — crucial for knowing what to clean.
* `vis_miss()` + `md.pattern()`: Provide heatmap and pattern view of missing data — helpful for visual diagnostics.
* `replace_na()` and `ifelse(is.na(...))`: Replace missing values with fixed numbers or logic-based substitutes.
* `get_mode()` function: Custom mode-finder since R lacks a built-in mode function — used for categorical NA replacement.
* `drop_na()`: Deletes rows with missing data — useful when missingness is sparse.
* `df[, colSums(is.na(df)) < nrow(df)]`: Drops columns that are completely NA — declutters the dataset.
* `mutate(mpg_missing = ifelse(is.na(mpg), 1, 0))`: Creates a binary column indicating if an NA was present — useful for tracking.

🔍 **By the end**: You will understand various imputation strategies, when to use each, and how they affect your dataset.

---

### ✅ Part 3: Base R Visualization — Detailed Explanation

**Goal:** Create basic plots to visually explore patterns, distributions, and relationships.

#### Key Code Blocks Explained:

* `barplot(table(df$cyl))`: Bar chart showing frequency of cylinder counts — shows group sizes.
* `pie(table(df$gear))`: Pie chart of gear ratios — visualizes proportions.
* `hist(df$mpg)`: Histogram of mpg values — shows distribution.
* `boxplot(mpg ~ cyl, data = df)`: Boxplot to compare mpg across cylinder groups — highlights median and outliers.
* `plot(x, y)`: Base R scatter plot — visualizes correlation.
* `par(mfrow = c(2,2))`: Splits the plotting window — useful for comparing multiple graphs side-by-side.

🔍 **By the end**: You’ll have experience creating all standard plot types in base R with labeled axes, colors, and grouped views.

---

### ✅ Part 4: `ggplot2` Visualization — Detailed Explanation

**Goal:** Create elegant, layered, and presentation-ready plots.

#### Key Code Blocks Explained:

* `ggplot(df, aes(x, y)) + geom_point()`: Core ggplot scatterplot — building block for all plots.
* `geom_bar()`, `geom_histogram()`, `geom_boxplot()`: Each add a layer for a specific plot type.
* `aes(color = cyl, fill = gear)`: Aesthetic mappings — crucial to show grouping visually.
* `facet_wrap(~ cyl)`: Generates multiple subplots by cylinder group — great for comparison.
* `theme_minimal()`, `theme_bw()`, `theme_light()`: Clean themes to improve readability.
* `labs(title = ..., x = ..., y = ...)`: Adds plot metadata.
* `ggsave()`: Saves your plot to file for reports or publication.

🔍 **By the end**: You’ll master the logic of `ggplot2` and build charts that are customizable and clear.

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
