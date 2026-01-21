# Function to check whether a number is odd or even
check_odd_even <- function(number) {
  if (number %% 2 == 0) {
    return("The number is even.")
  } else {
    return("The number is odd.")
  }
}

# Test the function
print(check_odd_even(4))    # Test with a positive even number
print(check_odd_even(7))    # Test with a positive odd number
print(check_odd_even(0))    # Test with zero
print(check_odd_even(-10))  # Test with a negative even number
print(check_odd_even(-3))   # Test with a negative odd number  



# Function to generate and print the Fibonacci sequence
generate_fibonacci <- function(n) {
  # Initialize the first two terms of the Fibonacci sequence
  fib_seq <- numeric(n)
  fib_seq[1] <- 0
  if (n > 1) {
    fib_seq[2] <- 1
  }
  
  # Generate the Fibonacci sequence
  for (i in 3:n) {
    fib_seq[i] <- fib_seq[i - 1] + fib_seq[i - 2]
  }
  
  # Print the Fibonacci sequence
  for (i in 1:n) {
    print(fib_seq[i])
  }
}

# Test the function
generate_fibonacci(5)   # Test with 5 terms
generate_fibonacci(10)  # Test with 10 terms
generate_fibonacci(20)  # Test with 20 terms



# Function to check whether a given year is a leap year
is_leap_year <- function(year) {
  if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
    return("The year is a leap year.")
  } else {
    return("The year is not a leap year.")
  }
}

# Test the function
print(is_leap_year(2024))  # Test with a leap year
print(is_leap_year(2023))  # Test with a common year
print(is_leap_year(2000))  # Test with a leap year divisible by 400
print(is_leap_year(1900))  # Test with a common year divisible by 100



# Function to check whether a given number is an Armstrong number
is_armstrong <- function(number) {
  # Convert the number to a character string to extract digits
  digits <- unlist(strsplit(as.character(number), ""))
  # Convert the character digits back to integers
  digits <- as.integer(digits)
  # Calculate the number of digits
  n <- length(digits)
  # Calculate the sum of digits each raised to the power of n
  sum_of_powers <- sum(digits^n)
  
  if (sum_of_powers == number) {
    return("The number is an Armstrong number.")
  } else {
    return("The number is not an Armstrong number.")
  }
}

# Test the function
print(is_armstrong(153))  # Test with a three-digit Armstrong number
print(is_armstrong(123))  # Test with a non-Armstrong number
print(is_armstrong(1634)) # Test with a four-digit Armstrong number
print(is_armstrong(7))    # Test with a single-digit number 



heights <- c(150, 160, 165, 155, 170, 175, 180)

# 1. Mean and median
mean_height <- mean(heights)
median_height <- median(heights)

# 2. Maximum and minimum heights
max_height <- max(heights)
min_height <- min(heights)

# 3. Number of students taller than 165 cm
taller_than_165 <- sum(heights > 165)

# 4. Sorted heights
sorted_heights <- sort(heights)

# Print results
cat("Mean height:", mean_height, "\n")
cat("Median height:", median_height, "\n")
cat("Maximum height:", max_height, "\n")
cat("Minimum height:", min_height, "\n")
cat("Number of students taller than 165 cm:", taller_than_165, "\n")
cat("Sorted heights:", sorted_heights, "\n")



sales <- c(12, 15, 10, 18, 20, 22, 25, 28, 30, 35, 40, 45)

# 1. Total sales for the year
total_sales <- sum(sales)

# 2. Average monthly sales
average_sales <- mean(sales)

# 3. Months with sales above 25,000
months_above_25k <- which(sales > 25)


# Print results
cat("Total sales for the year:", total_sales, "\n")
cat("Average monthly sales:", average_sales, "\n")
cat("Months with sales above 25,000:", months_above_25k, "\n")



temps_celsius <- c(0, 20, 25, 30, 35, 40)

# 1. Convert to Fahrenheit
temps_fahrenheit <- temps_celsius * 9/5 + 32

# 2. Identify temperatures above 90°F
above_90 <- temps_fahrenheit > 90

# Print results
cat("Temperatures in Fahrenheit:", temps_fahrenheit, "\n")
cat("Temperatures above 90°F:", temps_fahrenheit[above_90], "\n")



names <- c("Alice", "Bob", "Charlie", "David")

# 1. Convert to uppercase
upper_names <- toupper(names)

# 2. Count number of characters
name_lengths <- nchar(names)

# 3. Check if names contain the letter "a"
contains_a <- grepl("a", names, ignore.case = TRUE)

# Print results
cat("Uppercase names:", upper_names, "\n")
cat("Number of characters in each name:", name_lengths, "\n")
cat("Names containing the letter 'a':", names[contains_a], "\n")



vec1 <- c(1, 2, 3, 4, 5)
vec2 <- c(10, 20, 30)

# Element-wise addition with recycling
add_result <- vec1 + vec2

# Element-wise subtraction with recycling
sub_result <- vec1 - vec2

# Element-wise multiplication with recycling
mul_result <- vec1 * vec2

# Print results
cat("Element-wise addition:", add_result, "\n")
cat("Element-wise subtraction:", sub_result, "\n")
cat("Element-wise multiplication:", mul_result, "\n") 



numbers <- c(5, 3, 8, 3, 9, 5, 2, 8)

# 1. Find unique elements
unique_numbers <- unique(numbers)

# 2. Identify duplicated elements
duplicates <- numbers[duplicated(numbers)]

# 3. Remove duplicates, keeping only the first occurrence
no_duplicates <- numbers[!duplicated(numbers)]

# Print results
cat("Unique elements:", unique_numbers, "\n")
cat("Duplicated elements:", duplicates, "\n")
cat("Vector without duplicates:", no_duplicates, "\n") 



closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124, 128, 130, 129, 131, 135, 134, 136, 137, 140, 138, 139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# 1. Calculate daily returns (percentage change)
# diff() calculates the difference between consecutive elements
# We divide by the prices excluding the last one to get the base for percentage
daily_returns <- diff(closing_prices) / head(closing_prices, -1) * 100

# 2. Identify days with highest and lowest returns
# We add 1 to the index because the returns vector starts from Day 2
max_return_day <- which.max(daily_returns) + 1
min_return_day <- which.min(daily_returns) + 1

# 3. Calculate cumulative return over the month
# (Final Price - Initial Price) / Initial Price
cumulative_return <- (tail(closing_prices, 1) - head(closing_prices, 1)) / head(closing_prices, 1) * 100

# Print results
cat("Highest daily return occurred on Day:", max_return_day, "with", max(daily_returns), "%\n")
cat("Lowest daily return occurred on Day:", min_return_day, "with", min(daily_returns), "%\n")
cat("Cumulative return over the month:", cumulative_return, "%\n")

# Optional: Print first few daily returns to verify
cat("First 5 daily returns:", head(daily_returns, 5), "\n")



# Simulate sensor data for 60 minutes (1 hour) using a fixed seed for reproducibility
set.seed(123)
time <- 1:60
temperature <- round(runif(60, 20, 35), 1)  # Random temp between 20-35 C
humidity <- round(runif(60, 30, 60), 1)     # Random humidity between 30-60 %
pressure <- round(runif(60, 1000, 1015), 1) # Random pressure between 1000-1015 hPa

# 1. Calculate average readings
avg_temp <- mean(temperature)
avg_hum <- mean(humidity)
avg_pres <- mean(pressure)

# 2. Identify time intervals (minutes) with specific conditions
# Condition: Temp > 30 AND Humidity < 40
critical_intervals <- time[temperature > 30 & humidity < 40]

# Print numerical results
cat("Average Temperature:", avg_temp, "°C\n")
cat("Average Humidity:", avg_hum, "%\n")
cat("Average Pressure:", avg_pres, "hPa\n")
cat("Minutes with Temp > 30°C and Humidity < 40%:", critical_intervals, "\n")

# 3. Plot the sensor readings
# Set up a plotting area with 3 rows and 1 column
par(mfrow = c(3, 1))

plot(time, temperature, type = "l", main = "Temperature vs Time", 
     xlab = "Minute", ylab = "Temp (°C)", col = "red")

plot(time, humidity, type = "l", main = "Humidity vs Time", 
     xlab = "Minute", ylab = "Humidity (%)", col = "blue")

plot(time, pressure, type = "l", main = "Pressure vs Time", 
     xlab = "Minute", ylab = "Pressure (hPa)", col = "green")