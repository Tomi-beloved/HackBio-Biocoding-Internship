#Install and Load necessary libraries
install.packages("tidyverse")

library(tidyverse)

#Load the dataset
url <- "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/nhanes.csv"
nhanes_data <- read_csv(url)

#Display the first few rows of the dataset
head(nhanes_data)
summary(nhanes_data)
str(nhanes_data)

#Processing NA values (Converting to zero)
#Convert NA values to zero for numeric columns
nhanes_data <- nhanes_data %>%
                mutate(across(where(is.numeric), ~ replace_na(., 0)))

#Replace NA values with a placeholder (e.g., "Unknown") for character columns
nhanes_data <- nhanes_data %>%
                mutate(across(where(is.character), ~ replace_na(., "Unknown")))

# Display the first few rows of the processed dataset
head(nhanes_data)


# Convert weight to pounds
nhanes_data <- nhanes_data %>%
                mutate(Weight_pounds = Weight * 2.2)


# Plot histograms using plot() function

# Histogram for BMI
hist(nhanes_data$BMI, main = "Distribution of BMI", xlab = "BMI", col = "steelblue", border = "black")

# Histogram for Weight
hist(nhanes_data$Weight, main = "Distribution of Weight", xlab = "Weight (kg)", col = "lightgreen", border = "black")

# Histogram for Weight in pounds
hist(nhanes_data$Weight_pounds, main = "Distribution of Weight (in pounds)", xlab = "Weight (lbs)", col = "lightcoral", border = "black")

# Histogram for Age
hist(nhanes_data$Age, main = "Distribution of Age", xlab = "Age", col = "gold", border = "black")

# Calculate the mean 60-second pulse rate
mean_pulse_rate <- mean(nhanes_data$Pulse, na.rm = TRUE)
mean_pulse_rate

# Calculate the range of diastolic blood pressure
min_BPDia <- min(nhanes_data$BPDia, na.rm = TRUE)
max_BPDia <- max(nhanes_data$BPDia, na.rm = TRUE)
range_BPDia <- max_BPDia - min_BPDia
range_BPDia <- paste(min_BPDia, "-", max_BPDia)

print(range_BPDia)

# Calculate variance and standard deviation for income
variance_income <- var(nhanes_data$Income, na.rm = TRUE)
std_dev_income <- sd(nhanes_data$Income, na.rm = TRUE)
#Display the output
print(variance_income)
print(std_dev_income)

#Visualization of the relationship between weights and heights, coloured by gender
# Plot weight vs height and color by gender
plot(nhanes_data$Height, nhanes_data$Weight, col = as.factor(nhanes_data$Gender), pch = 16,
     main = "Weight vs Height Colored by Gender",
     xlab = "Height", ylab = "Weight")
legend("topright", legend = unique(nhanes_data$Gender), col = unique(as.factor(nhanes_data$Gender)), pch = 16)

# Plot weight vs height and color by diabetes status
plot(nhanes_data$Height, nhanes_data$Weight, col = as.factor(nhanes_data$Diabetes), pch = 16,
     main = "Weight vs Height Colored by Diabetes Status",
     xlab = "Height", ylab = "Weight")
legend("topright", legend = unique(nhanes_data$Diabetes), col = unique(as.factor(nhanes_data$Diabetes)), pch = 16)


# Plot weight vs height and color by smoking status
plot(nhanes_data$Height, nhanes_data$Weight, col = as.factor(nhanes_data$SmokingStatus), pch = 16,
     main = "Weight vs Height Colored by Smoking Status",
     xlab = "Height", ylab = "Weight")
legend("topright", legend = unique(nhanes_data$SmokingStatus), col = unique(as.factor(nhanes_data$SmokingStatus)), pch = 16)









