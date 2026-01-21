# Initialize an empty shopping list
shopping_list <- list()

# Function to add items to the shopping list
add_item <- function(item) {
  shopping_list <<- c(shopping_list, item)
}

# Function to remove items from the shopping list
remove_item <- function(item) {
  shopping_list <<- shopping_list[shopping_list != item]
}

# Function to view the shopping list
view_list <- function() {
  print(shopping_list)
}

# Example usage
add_item("Milk")
add_item("Bread")
remove_item("Milk")
view_list()



# Initialize an empty list for student grades
student_grades <- list()

# Function to add student grades
add_grade <- function(student, grade) {
  student_grades[[student]] <- grade
}

# Function to remove student grades
remove_grade <- function(student) {
  student_grades[[student]] <- NULL
}

# Function to calculate average grade
average_grade <- function() {
  return(mean(unlist(student_grades)))
}

# Example usage
add_grade("Alice", 85)
add_grade("Bob", 90)
remove_grade("Alice")
print(average_grade())



# Initialize an empty to-do list
to_do_list <- list()

# Function to add tasks to the to-do list
add_task <- function(task) {
  # Create a new task structure
  new_task <- list(task = task, completed = FALSE)
  # Append the new task as a sub-list to the global list
  to_do_list[[length(to_do_list) + 1]] <<- new_task
}

# Function to mark tasks as completed
mark_completed <- function(task_name) {
  # Iterate through the list to find the matching task
  # We modify a local copy then update the global variable to ensure integrity
  temp_list <- to_do_list
  for (i in seq_along(temp_list)) {
    if (temp_list[[i]]$task == task_name) {
      temp_list[[i]]$completed <- TRUE
      break
    }
  }
  to_do_list <<- temp_list
}

# Function to view the to-do list
view_tasks <- function() {
  print(to_do_list)
}

# Example usage
add_task("Finish report")
add_task("Call client")
mark_completed("Finish report")
view_tasks()



# Initialize an empty list for customer purchases
customer_purchases <- list()

# Function to add customer and their purchases
add_customer_data <- function(name, purchases) {
  # Add or update the customer's purchase vector
  customer_purchases[[name]] <<- purchases
}

# Function to remove a customer
remove_customer_data <- function(name) {
  customer_purchases[[name]] <<- NULL
}

# Function to calculate total purchase amount for each customer
calculate_totals <- function() {
  # sapply applies sum() to each element (vector) in the list
  return(sapply(customer_purchases, sum))
}

# Function to find highest and lowest spenders
find_extremes <- function() {
  totals <- calculate_totals()
  
  max_customer <- names(totals)[which.max(totals)]
  max_amount <- max(totals)
  
  min_customer <- names(totals)[which.min(totals)]
  min_amount <- min(totals)
  
  cat("Customer with highest total:", max_customer, "($", max_amount, ")\n", sep="")
  cat("Customer with lowest total:", min_customer, "($", min_amount, ")\n", sep="")
}

# Example usage with Sample Data
add_customer_data("Alice", c(200, 150, 300))
add_customer_data("Bob", c(100, 80, 150))
add_customer_data("Charlie", c(250, 300, 100))

# Print totals
print("Total purchases per customer:")
print(calculate_totals())

# Find extremes
find_extremes()

# Demonstrate removal
print("--- After removing Bob ---")
remove_customer_data("Bob")
print(calculate_totals())



# Initialize an empty list for the library system
library_system <- list()

# Function to add a book and its borrowers
add_book <- function(title, borrowers) {
  # Add or update the book entry with the vector of borrower names
  library_system[[title]] <<- borrowers
}

# Function to remove a book from the system
remove_book <- function(title) {
  library_system[[title]] <<- NULL
}

# Function to calculate total borrowers per book
count_borrowers <- function() {
  # sapply applies the length() function to each element (vector) in the list
  return(sapply(library_system, length))
}

# Function to find books with highest and lowest borrowing counts
find_popularity <- function() {
  counts <- count_borrowers()
  
  if (length(counts) > 0) {
    # Find max and min
    most_borrowed_book <- names(counts)[which.max(counts)]
    max_count <- max(counts)
    
    least_borrowed_book <- names(counts)[which.min(counts)]
    min_count <- min(counts)
    
    cat("Most borrowed book:", most_borrowed_book, "(", max_count, "borrowers)\n")
    cat("Least borrowed book:", least_borrowed_book, "(", min_count, "borrowers)\n")
  } else {
    cat("The library system is empty.\n")
  }
}

# Example usage with Sample Data
add_book("The Hobbit", c("Alice", "Bob"))
add_book("1984", c("Charlie", "Alice"))
add_book("Moby Dick", c("Bob"))

# Print borrower counts
print("Total borrowers per book:")
print(count_borrowers())

# Find popularity statistics
find_popularity()

# Demonstrate removal
print("--- After removing 'Moby Dick' ---")
remove_book("Moby Dick")
print(count_borrowers())



# Initialize an empty list for teams
team_performance <- list()

# Function to add a team and their scores
add_team <- function(name, scores) {
  team_performance[[name]] <<- scores
}

# Function to remove a team
remove_team <- function(name) {
  team_performance[[name]] <<- NULL
}

# Function to calculate average scores and rank teams
analyze_and_rank <- function() {
  # Calculate average for each team
  averages <- sapply(team_performance, mean)
  
  # Sort averages in descending order to determine rank
  # sort(..., decreasing = TRUE) puts the highest score first
  ranked_averages <- sort(averages, decreasing = TRUE)
  
  # Print the ranked results
  cat("Team Rankings (by Average Score):\n")
  for (i in seq_along(ranked_averages)) {
    team_name <- names(ranked_averages)[i]
    score <- ranked_averages[i]
    cat(i, ". ", team_name, ": ", round(score, 2), "\n", sep="")
  }
}

# Example usage with Sample Data
add_team("Team A", c(90, 85, 88))
add_team("Team B", c(78, 82, 79))
add_team("Team C", c(88, 92, 90))

# Perform analysis
analyze_and_rank()

# Demonstrate removal
cat("\n--- After removing Team B ---\n")
remove_team("Team B")
analyze_and_rank()
