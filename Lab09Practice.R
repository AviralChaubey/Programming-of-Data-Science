# Program 1
#Step1: Install and Load the necessary packages and data
install.packages("dplyr")
library(dplyr)
#load starwars dataset which is a built-in dataset in the dplyr package
data("starwars", package = "dplyr")
View(starwars)


#Step2 (Select Columns): Extract relevant columns such as name, species, height, mass, and homeworld.

starwars_data <- starwars %>%
  select(name, species, height, mass, homeworld)
View(starwars_data)


#Step 3: (Filter Rows): Focus on data for characters who are Human
human_data <- starwars_data %>%
  filter(species == "Human")
View(human_data)

#Step 4: (Create New Columns): Calculate the Body Mass Index (BMI) for each character.
human_data <- human_data %>%
  mutate(BMI = mass / (height/100)^2)
View(human_data)

#Step5: (Summarize Data): Find the average BMI for Human characters from each homeworld
summary_data <- human_data %>%
  group_by(homeworld) %>%
  summarize(avg_BMI = mean(BMI, na.rm = TRUE))
View(summary_data)


# Program 2
# Step 1: Install and Load the necessary packages and data
library(dplyr)
data("starwars", package = "dplyr")

# Step 2: Select Columns
sw_selected <- starwars %>%
  select(name, species, height, mass, homeworld, gender)
View(sw_selected)

# Step 3: Filter Rows (Species with more than 2 characters)
sw_filtered <- sw_selected %>%
  group_by(species) %>%
  filter(n() > 2) %>%
  ungroup() # Always ungroup after group-based filtering
View(sw_filtered)

# Step 4: Create New Columns (Height in meters, Weight categories)
sw_mutated <- sw_filtered %>%
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 50 ~ "Light",
      mass >= 50 & mass <= 100 ~ "Medium",
      mass > 100 ~ "Heavy",
      TRUE ~ "Unknown/NA" # Catches missing mass values
    )
  )
View(sw_mutated)

# Step 5: Summarize Data (Average height for each species-gender combination)
sw_species_gender_avg <- sw_mutated %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height, na.rm = TRUE), .groups = "drop")
View(sw_species_gender_avg)

# Step 6: Identify the top three species with the highest average height
top_3_species <- sw_mutated %>%
  group_by(species) %>%
  summarize(avg_height = mean(height, na.rm = TRUE)) %>%
  arrange(desc(avg_height)) %>%
  slice_head(n = 3)
View(top_3_species)