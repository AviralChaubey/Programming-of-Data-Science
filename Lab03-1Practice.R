#Function to find the area of a reactangle
Area <- function(width, height){
  area = width*height
  return(area)
}

#Calling The function and storing it in a variable
area1 <- Area(5,10)
area2 <- Area(7,3)
area3 <- Area(0,8)
area4 <- Area(4.5, 6.2)

#printing the result
print(area1)
print(area2)
print(area3)
print(area4)

#printing the result using cat
cat("Area of rectangle with width and height, 5 and 10: ", area1, "\n")
cat("Area of rectangle with width and height, 7 and 3: ", area2, "\n")
cat("Area of rectangle with width and height, 0 and 8: ", area3, "\n")
cat("Area of rectangle with width and height, 4.5 and 6.2: ", area4, "\n")



# Function to calculate BMI
calculate_bmi <- function(height, weight) {
  bmi <- weight / (height^2)
  return(bmi)
}

# Test the function with different sets of inputs
bmi1 <- calculate_bmi(1.75, 70)
bmi2 <- calculate_bmi(1.60, 60)
bmi3 <- calculate_bmi(1.80, 85)
bmi4 <- calculate_bmi(1.65, 50)

# Print the test results
cat("BMI for height 1.75m and weight 70kg:", bmi1, "\n")
cat("BMI for height 1.60m and weight 60kg:", bmi2, "\n")
cat("BMI for height 1.80m and weight 85kg:", bmi3, "\n")
cat("BMI for height 1.65m and weight 50kg:", bmi4, "\n")



# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit <- function(celsius) {
  fahrenheit <- (celsius * 9/5) + 32
  return(fahrenheit)
}

# Test the function with different sets of inputs
temp1 <- celsius_to_fahrenheit(0)
temp2 <- celsius_to_fahrenheit(25)
temp3 <- celsius_to_fahrenheit(-10)
temp4 <- celsius_to_fahrenheit(100)

# Print the test results
cat("0 degrees Celsius is", temp1, "degrees Fahrenheit\n")
cat("25 degrees Celsius is", temp2, "degrees Fahrenheit\n")
cat("-10 degrees Celsius is", temp3, "degrees Fahrenheit\n")
cat("100 degrees Celsius is", temp4, "degrees Fahrenheit\n")



# Function to calculate area of a circle
calculate_circle_area <- function(radius) {
  return(pi * radius^2)
}

# Test the function with different sets of inputs
area1 <- calculate_circle_area(3)
area2 <- calculate_circle_area(5.5)
area3 <- calculate_circle_area(0)
area4 <- calculate_circle_area(7.2)

# Print the test results
cat("Area of circle with radius 3:", area1, "\n")
cat("Area of circle with radius 5.5:", area2, "\n")
cat("Area of circle with radius 0:", area3, "\n")
cat("Area of circle with radius 7.2:", area4, "\n")



# Function to calculate square of a number
calculate_square <- function(number) {
  return(number ^ 2)
}

# Test the function with different sets of inputs
num1 <- calculate_square(4)
num2 <- calculate_square(-3)
num3 <- calculate_square(0)
num4 <- calculate_square(5.7)

# Print the test results
cat("Square of 4:", num1, "\n")
cat("Square of -3:", num2, "\n")
cat("Square of 0:", num3, "\n")
cat("Square of 5.7:", num4, "\n")



# Function to create full name from first and last name
make_full_name <- function(first_name, last_name) {
  return(paste(first_name, last_name))
}

# Test the function with different sets of inputs
name1 <- make_full_name("John", "Doe")
name2 <- make_full_name("Alice", "Smith")
name3 <- make_full_name("Rahul", "Sharma")
name4 <- make_full_name("Emily", "Blunt")

# Print the test results
cat("Full name for John and Doe:", name1, "\n")
cat("Full name for Alice and Smith:", name2, "\n")
cat("Full name for Rahul and Sharma:", name3, "\n")
cat("Full name for Emily and Blunt:", name4, "\n")



# Function to get text input from user
gettxtinpt <-function(){
  user_input <- readline(prompt = "Enter your input: ")
  return(user_input)
}

cat("Test case 1: User input is 'Hello, world!'\n")
cat("User input: ", gettxtinpt(),"\n\n")

cat("Test case 2: User input is '42'\n")
cat("User input: ", gettxtinpt(),"\n\n")

cat("Test case 3: User input is 'R Programming'\n")
cat("User input: ", gettxtinpt(),"\n\n")



# Function to get integer input from the user
getintinpt <- function() {
  user_input <- readline(prompt = "Enter an integer: ")
  integer_input <- as.integer(user_input)
  return(integer_input)
}

# Test the function with different sets of inputs
cat("Test Case 1: User input is '42'\n")
cat("User input as integer:", getintinpt(), "\n\n")

cat("Test Case 2: User input is '100'\n")
cat("User input as integer:", getintinpt(), "\n\n")

cat("Test Case 3: User input is '7'\n")
cat("User input as integer:", getintinpt(), "\n\n")



# Function to get floating point input from the user
getfloatinpt <- function() {
  user_input <- readline(prompt = "Enter a floating point number: ")
  float_input <- as.numeric(user_input)
  return(float_input)
}

# Test the function with different sets of inputs
cat("Test Case 1: User input is '42'\n")
cat("User input as integer:", getfloatinpt(), "\n\n")

cat("Test Case 2: User input is '100'\n")
cat("User input as integer:", getfloatinpt(), "\n\n")

cat("Test Case 3: User input is '7'\n")
cat("User input as integer:", getfloatinpt(), "\n\n")