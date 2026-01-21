#Function for adding two numbers
add <- function(a,b){
  z <- a+b
  return(z)
}

#Calling The function and storing it in a variable
result1 <- add(5, 10)
result2 <- add(-3, 7)
result3 <- add(0, 0)
result4 <- add(3.5, 2.1)

#printing the result
print(result1)
print(result2)
print(result3)
print(result4)

#printing the test results
cat("Result of adding 5 and 10: ", result1, "\n")
cat("Result of adding -3 and 7: ", result2, "\n")
cat("Result of adding 0 and 0: ", result3, "\n")
cat("Result of adding 3.5 and 2.1: ", result4, "\n")



#Function for subtracting two numbers
sub <- function (x, y){
  c <- x-y
  return (c)
}

#Calling The function and storing it in a variable
result5 <- sub(5, 10)
result6 <- sub(-3, 7)
result7 <- sub(0, 0)
result8 <- sub(3.5, 2.1)

#printing the result
print(result5)
print(result6)
print(result7)
print(result8)

#printing the result using cat
cat("Result of subtracting 5 and 10: ", result5, "\n")
cat("Result of subtracting -3 and 7: ", result6, "\n")
cat("Result of subtracting 0 and 0: ", result7, "\n")
cat("Result of subtracting 3.5 and 2.1: ", result8, "\n")



#Function for multiplying two numbers
mul <- function (p, q){
  d <- p*q
  return (d)
}

#Calling The function and storing it in a variable
result9 <- mul(5, 10)
result10 <- mul(-3, 7)
result11 <- mul(0, 0)
result12 <- mul(3.5, 2.1)

#printing the result
print(result9)
print(result10)
print(result11)
print(result12)

#printing the result using cat
cat("Result of multiplying 5 and 10: ", result9, "\n")
cat("Result of multiplying -3 and 7: ", result10, "\n")
cat("Result of multiplying 0 and 0: ", result11, "\n")
cat("Result of multiplying 3.5 and 2.1: ", result12, "\n")



#Function for dividing two numbers
div <- function (r, s){
  e <- r/s
  return (e)
}

#Calling The function and storing it in a variable
result13 <- div(5, 10)
result14 <- div(-3, 7)
result15 <- div(0, 0)
result16 <- div(3.5, 2.1)

#printing the result
print(result13)
print(result14)
print(result15)
print(result16)

#printing the result using cat
cat("Result of dividing 5 and 10: ", result13, "\n")
cat("Result of dividing -3 and 7: ", result14, "\n")
cat("Result of dividing 0 and 0: ", result15, "\n")
cat("Result of dividing 3.5 and 2.1: ", result16, "\n")