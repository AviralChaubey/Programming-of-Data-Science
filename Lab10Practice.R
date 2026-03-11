# Program 1
# Load the necessary library
library(dplyr)

# Create the Donors dataset
donors <- data.frame(
  DonorName = c("Alice Walton", "Jacqueline Mars", "Maria Franca Fissolo", 
                "Susanne Klatten", "Laurene Powell Jobs", "Francoise Bettencourt Meyers"),
  Email = c("alice.walton@gmail.com", "jacqueline.mars@gmail.com", "maria.franca.fissolo@gmail.com",
            "susanne.klatten@gmail.com", "laurene.powell.jobs@gmail.com", 
            "francoise.bettencourt.meyers@gmail.com")
)

# Create the Donations dataset
donations <- data.frame(
  DonorName = c("Maria Franca Fissolo", "Yang Huiyan", "Maria Franca Fissolo", 
                "Alice Walton", "Susanne Klatten", "Yang Huiyan"),
  Amount = c(100, 50, 75, 25, 100, 150),
  Date = as.Date(c("2018-02-15", "2018-02-15", "2018-02-15", 
                   "2018-02-16", "2018-02-17", "2018-02-18"))
)

# Perform Left Join
left_join_result <- left_join(donors, donations, by = "DonorName")
print("Left Join Result:")
print(left_join_result)

# Perform Right Join
right_join_result <- right_join(donors, donations, by = "DonorName")
print("Right Join Result:")
print(right_join_result)

# Perform Inner Join
inner_join_result <- inner_join(donors, donations, by = "DonorName")
print("Inner Join Result:")
print(inner_join_result)

# Perform Outer Join (Full Join)
outer_join_result <- full_join(donors, donations, by = "DonorName")
print("Outer Join Result:")
print(outer_join_result)


# Program 2
# Step 1: Load the necessary library
# install.packages("dplyr") # Uncomment if not already installed
library(dplyr)

# Step 2: Create the Customers Dataset
Customers <- data.frame(
  CustomerName = c("John Doe", "Jane Smith", "Robert Brown", "Emily Davis", "Michael Green"),
  Email = c("john.doe@example.com", "jane.smith@example.com", "robert.brown@example.com", 
            "emily.davis@example.com", "michael.green@example.com"),
  stringsAsFactors = FALSE
)

# Step 3: Create the Purchases Dataset
Purchases <- data.frame(
  CustomerName = c("John Doe", "Jane Smith", "Robert Brown", "Sarah Johnson", "Emily Davis"),
  PurchaseAmount = c(150, 200, 120, 180, 220),
  Date = as.Date(c("01-01-2023", "02-01-2023", "03-01-2023", "04-01-2023", "05-01-2023"), format="%d-%m-%Y"),
  stringsAsFactors = FALSE
)

# Step 4: Perform Left Join
left_join_result <- left_join(Customers, Purchases, by = "CustomerName")
print("--- Left Join Result (All Customers) ---")
print(left_join_result)

# Step 5: Perform Right Join
right_join_result <- right_join(Customers, Purchases, by = "CustomerName")
print("--- Right Join Result (All Purchases) ---")
print(right_join_result)

# Step 6: Perform Inner Join
inner_join_result <- inner_join(Customers, Purchases, by = "CustomerName")
print("--- Inner Join Result (Matching Records) ---")
print(inner_join_result)

# Step 7: Perform Outer Join (Full Join)
outer_join_result <- full_join(Customers, Purchases, by = "CustomerName")
print("--- Outer Join Result (All Records) ---")
print(outer_join_result)
