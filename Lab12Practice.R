# Program 1
# Step 1: Install and load necessary packages
# install.packages(c("DBI", "dplyr", "RSQLite"))
library(DBI)
library(dplyr)
library(RSQLite)

# Step 2: Set working directory and define database file
setwd("C:/Users/avira")
db_file <- "songs.db"

# Verify file exists before attempting connection
if (!file.exists(db_file)) {
  stop(paste("Error: Database file", db_file, "not found in the working directory."))
}

# Step 3: Establish connection with graceful error handling
con <- tryCatch({
  dbConnect(RSQLite::SQLite(), db_file)
}, error = function(e) {
  stop(paste("Failed to connect to database:", e$message))
})

# Steps 4-8: Query execution with resource management
tryCatch({
  # Step 4: Create a reference to the 'songs' table
  songs_tbl <- tbl(con, "songs")
  
  # Step 5: Construct the query for artist_id 11 (Queen)
  queen_songs_query <- songs_tbl %>%
    filter(artist_id == 11) %>%
    select(title)
  
  # Step 6: Display the translated SQL syntax
  cat("\n--- SQL Query Syntax ---\n")
  show_query(queen_songs_query)
  
  # Step 7: Retrieve the data into local R memory
  cat("\n--- Query Results (Tibble) ---\n")
  queen_songs_data <- queen_songs_query %>% collect()
  print(queen_songs_data)
  
}, error = function(e) {
  # Handle missing tables or query errors gracefully
  cat("\nError during database operation:", e$message, "\n")
}, finally = {
  # Step 8: Ensure proper disconnection to release resources
  dbDisconnect(con)
  cat("\nDatabase connection successfully closed.\n")
})



# Program 2
# Step 1: Install and load the necessary package
# install.packages("jsonlite") # Uncomment if jsonlite is not installed
library(jsonlite)

# Step 2: Set working directory and define file paths
setwd("C:/Users/avira/Downloads/Telegram Desktop")
input_file <- "inventory.json"
output_file <- "updated_inventory.json"

# Step 3: Read the existing product inventory data
cat("--- Original Inventory (Read from inventory.json) ---\n")
inventory_data <- fromJSON(input_file)
print(inventory_data)

# Step 4: Add a new product to the inventory
# CRITICAL FIX: Column names are now exactly matching the lowercase JSON keys
new_product <- data.frame(
  product_id = "P105",
  name = "Mouse",
  category = "Accessories",
  price = 1500,
  stock = 45,
  stringsAsFactors = FALSE
)

# Append the new product to the existing inventory data frame
updated_inventory <- rbind(inventory_data, new_product)

# Step 5: Write the updated inventory data back to a new JSON file
# Using pretty = TRUE ensures the JSON is formatted with indentation (human-readable)
write_json(updated_inventory, output_file, pretty = TRUE)
cat(sprintf("\n[Success] Wrote updated inventory to '%s'\n", output_file))

# Step 6: Verify the updated inventory data
cat("\n--- Verified Updated Inventory (Read from updated_inventory.json) ---\n")
verified_data <- fromJSON(output_file)
print(verified_data)