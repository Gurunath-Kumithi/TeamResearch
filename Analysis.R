
library(readr)


vacc_data <- read_csv("us_state_vaccinations.csv")

# Have a quick look at the structure of the dataset
names(vacc_data)
summary(vacc_data)

# For convenience, work with a shorter name
df <- vacc_data

# 3. Choose the numeric variable for comparison
# Different versions of this dataset have slightly different columns.
# We will try to pick daily_vaccinations_per_million if it exists.
# If not, we will fall back to daily_vaccinations.

if ("daily_vaccinations_per_million" %in% names(df)) {
  df$daily_vax <- df$daily_vaccinations_per_million
  vax_label <- "Daily vaccinations per million"
} else if ("daily_vaccinations" %in% names(df)) {
  df$daily_vax <- df$daily_vaccinations
  vax_label <- "Daily vaccinations"
} else {
  stop("No suitable daily vaccination column found. 
       Look at names(df) and change the script to use the correct column.")
}


# 4. Create the grouping variable: early vs late 2021

# Convert date column to Date type (if not already)
# Note: if the date column has a different name, change "date" below.
if (!"date" %in% names(df)) {
  stop("No 'date' column found. Check names(df) and update the script.")
}


df$date <- as.Date(df$date)

# Keep only rows from 2021 (to avoid later years messing things up)
df_2021 <- subset(df, format(date, "%Y") == "2021")

# Create a period variable:
# Early2021 = Jan–Jun 2021
# Late2021  = Jul–Dec 2021
df_2021$period <- ifelse(df_2021$date <= as.Date("2021-06-30"),
                         "Early2021", "Late2021")

# Check how many rows in each group
table(df_2021$period)


# 5. Clean the data (remove missing and extreme values)

# Remove rows where daily_vax is NA or <= 0
df_2021_clean <- subset(df_2021, !is.na(daily_vax) & daily_vax > 0)

# Remove very extreme outliers (top 1%) to make the distribution more sensible
upper_cutoff <- quantile(df_2021_clean$daily_vax, 0.99, na.rm = TRUE)
df_2021_clean <- subset(df_2021_clean, daily_vax <= upper_cutoff)

summary(df_2021_clean$daily_vax)
table(df_2021_clean$period)


# 6. Descriptive statistics

# Means by group
aggregate(daily_vax ~ period, df_2021_clean, mean)

# Medians by group
aggregate(daily_vax ~ period, df_2021_clean, median)


# 7. Check normality with histogram

# Histogram for Early2021
hist(df_2021_clean$daily_vax[df_2021_clean$period == "Early2021"],
     main = "Histogram of Daily Vaccinations – Early 2021",
     xlab = vax_label)

# Histogram for Late2021
hist(df_2021_clean$daily_vax[df_2021_clean$period == "Late2021"],
     main = "Histogram of Daily Vaccinations – Late 2021",
     xlab = vax_label)

# Optional: combined basic check of distribution
hist(df_2021_clean$daily_vax,
     main = "Histogram of Daily Vaccinations – All 2021 Data",
     xlab = vax_label)

