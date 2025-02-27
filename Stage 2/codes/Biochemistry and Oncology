# Install and load necessary libraries
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
library(tidyverse)

# Step 1: Load a subset of the data to avoid timeout
url <- "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/main/Python/Dataset/mcgc.tsv"
metadata_url <- "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/main/Python/Dataset/mcgc_METADATA.txt"

data <- read_tsv(url, n_max = 100)  # Load first 100 rows
metadata <- read_tsv(metadata_url, n_max = 100)

# Check data structure
print("Data Preview:")
print(head(data))
print("Metadata Preview:")
print(head(metadata))

# Step 2: Preprocess the data with a limit to avoid timeout
merged_data <- data %>%
  left_join(metadata, by = "Strain") %>%
  mutate(Time = as.numeric(Time)) %>%
  arrange(Time) %>%
  head(500)  # Limit to 500 rows for testing

print("Merged Data Structure:")
print(str(merged_data))

# Step 3: Sample data for plotting to avoid overload
sampled_data <- merged_data %>% sample_n(100)

ggplot(sampled_data, aes(x = Time, y = OD600, color = Mutation, group = interaction(Strain, Mutation))) +
  geom_line() +
  facet_wrap(~Strain, scales = "free") +
  labs(x = "Time", y = "OD600", title = "Growth Curves (Sampled Data)") +
  theme_minimal()

# Step 4: Define and apply the function with limited data
time_to_carrying_capacity <- function(time, od600) {
  max_od <- max(od600, na.rm = TRUE)
  threshold <- 0.95 * max_od
  return(min(time[od600 >= threshold], na.rm = TRUE))
}

results <- merged_data %>%
  group_by(Strain, Mutation) %>%
  summarise(Time_to_Capacity = time_to_carrying_capacity(Time, OD600), .groups = "drop")

print("Results Summary:")
print(summary(results))

# Step 5: Pivot data for scatter plot with sampling
results_wide <- results %>%
  pivot_wider(names_from = Mutation, values_from = Time_to_Capacity, names_prefix = "Time_")

print("Pivoted Data for Scatter Plot:")
print(head(results_wide))

# Scatter plot with sampled data
tryCatch({
  ggplot(results_wide, aes(x = `Time_-`, y = `Time_+`)) +
    geom_point() +
    labs(x = "Time to Carrying Capacity (Knock-Out)", y = "Time to Carrying Capacity (Knock-In)", title = "Scatter Plot of Time to Carrying Capacity") +
    theme_minimal()
}, error = function(e) {
  print(paste("Error in scatter plot:", e$message))
})

# Step 6: Box plot with sampled data
tryCatch({
  ggplot(results, aes(x = Mutation, y = Time_to_Capacity)) +
    geom_boxplot() +
    labs(x = "Mutation", y = "Time to Carrying Capacity", title = "Box Plot of Time to Carrying Capacity") +
    theme_minimal()
}, error = function(e) {
  print(paste("Error in box plot:", e$message))
})

# Step 7: Statistical analysis with sampled data
sampled_results <- results %>% sample_n(100)

t_test_result <- tryCatch({
  t.test(Time_to_Capacity ~ Mutation, data = sampled_results)
}, error = function(e) {
  stop("Error in t-test analysis: ", e$message)
})

print("T-test Results:")
print(t_test_result)

if (!is.null(t_test_result$p.value) && t_test_result$p.value < 0.05) {
  print("There is a statistically significant difference between knock-out and knock-in strains.")
} else {
  print("There is no statistically significant difference between knock-out and knock-in strains.")
}
