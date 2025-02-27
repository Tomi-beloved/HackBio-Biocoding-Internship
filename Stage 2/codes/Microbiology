# install and load necessary libraries 
install.packages("tidyverse")

# Load the tidyverse package
library(tidyverse)

# Step 1: Load the data
url <- "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/main/Python/Dataset/mcgc.tsv"
metadata_url <- "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/main/Python/Dataset/mcgc_METADATA.txt"

data <- read_tsv(url)
metadata <- read_tsv(metadata_url)

# Let's first check the column names in both datasets
print("Data columns:")
print(colnames(data))
print("\nMetadata columns:")
print(colnames(metadata))

# Step 2: Data needs to be reshaped from wide to long format first
data_long <- data %>%
  pivot_longer(cols = -time,
               names_to = "Strain",
               values_to = "OD600") %>%
  rename(Time = time)

# Now merge with metadata and create Mutation column
merged_data <- data_long %>%
  left_join(metadata, by = "Strain") %>%
  mutate(Time = as.numeric(Time),
         # Create Mutation column based on MUT...3 (or another appropriate mutation column)
         Mutation = MUT...3) %>%
  arrange(Time)

# Continue with the rest of the analysis...
# Step 3: Plot growth curves
ggplot(merged_data, aes(x = Time, y = OD600, color = Mutation, group = interaction(Strain, Mutation))) +
  geom_line() +
  facet_wrap(~Strain, scales = "free") +
  labs(x = "Time", y = "OD600", title = "Growth Curves for Knock-Out and Knock-In Strains") +
  theme_minimal()

# Step 4: Determine time to reach carrying capacity
time_to_carrying_capacity <- function(time, od600) {
  max_od <- max(od600)
  threshold <- 0.95 * max_od
  return(min(time[od600 >= threshold]))
}

results <- merged_data %>%
  group_by(Strain, Mutation) %>%
  summarise(Time_to_Capacity = time_to_carrying_capacity(Time, OD600)) %>%
  ungroup()

# Step 5: Generate scatter plot
results_wide <- results %>%
  pivot_wider(names_from = Mutation, values_from = Time_to_Capacity, names_prefix = "Time_")

# ggplot
ggplot(results_wide, aes(x = `Time_-`, y = `Time_+`)) +
  geom_point() +
  labs(x = "Time to Carrying Capacity (Knock-Out)", y = "Time to Carrying Capacity (Knock-In)", 
       title = "Scatter Plot of Time to Carrying Capacity") +
  theme_minimal()

# Step 6: Generate box plot
ggplot(results, aes(x = Mutation, y = Time_to_Capacity)) +
  geom_boxplot() +
  labs(x = "Mutation", y = "Time to Carrying Capacity", title = "Box Plot of Time to Carrying Capacity") +
  theme_minimal()

# Step 7: Statistical analysis
t_test_result <- t.test(Time_to_Capacity ~ Mutation, data = results)

print(t_test_result)

if (t_test_result$p.value < 0.05) {
  print("There is a statistically significant difference between knock-out and knock-in strains.")
} else {
  print("There is no statistically significant difference between knock-out and knock-in strains.")
}
