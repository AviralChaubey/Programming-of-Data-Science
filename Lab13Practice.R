install.packages("ggplot2")
# Step 1: Install and Load ggplot2
# install.packages("ggplot2") # Uncomment if ggplot2 is not installed
library(ggplot2)

# Step 2: Use the Given Dataset
# Creating a small synthetic dataset
df <- data.frame(
  a = 1:5,
  b = c(5, 9, 7, 12, 15)
)
print("--- Dataset ---")
print(df)

# Step 3a: Scatter Plot
scatter_plot <- ggplot(df, aes(x = a, y = b)) +
  geom_point() +
  labs(title = "Scatter Plot of b vs a", x = "Variable a", y = "Variable b")
print(scatter_plot)

# Step 3b: Customized Line Plot
line_plot <- ggplot(df, aes(x = a, y = b)) +
  geom_line(color = "red", linewidth = 1.2) +
  labs(title = "Customized Line Plot", x = "Variable a", y = "Variable b")
print(line_plot)

# Step 3c: Customized Bar Plot
# Wrapping 'a' in factor() treats it as a discrete category for the bar plot
bar_plot <- ggplot(df, aes(x = factor(a), y = b)) +
  geom_col(fill = "blue") +
  labs(title = "Customized Blue Bar Plot", x = "Category a", y = "Height b")
print(bar_plot)

# Step 3d: Scatter Plot with Smooth Line
smooth_plot <- ggplot(df, aes(x = a, y = b)) +
  geom_point(size = 4, color = "darkorange") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Scatter Plot with Linear Smoothing", x = "Variable a", y = "Variable b")
print(smooth_plot)




#Program 2


# Load the ggplot2 library
library(ggplot2)

data("midwest", package = "ggplot2")
View(midwest)


# Example: Create a scatter plot using the midwest dataset
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty))


# Create a bar chart of the total population of each state
ggplot(data = midwest) + 
  geom_col(mapping = aes(x = state, y = poptotal))


# Create a hexagonal aggregation of college education rate and adult poverty
ggplot(data = midwest) + 
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty))

# Create a scatter plot with a smoothed line
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) + 
  geom_smooth(mapping = aes(x = percollege, y = percadultpoverty))

# Use shared aesthetic mappings to avoid redundancy
ggplot(data = midwest, mapping = aes(x = percollege, y = percadultpoverty)) + 
  geom_point() +  # Uses default x and y mappings
  geom_smooth() + # Uses default x and y mappings
  geom_point(mapping = aes(y = percchildbelowpovert)) # Unique y mapping

# Mapping data to color by state
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = state))

# Setting a constant red color and transparency for all points
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty), 
             color = "red", 
             alpha = 0.3)





# Program 3


# Load the ggplot2 library
library(ggplot2)

# Create a dataframe for the given dataset
plant_data <- data.frame(
  Plant_ID = c(1, 2, 3, 4, 5),
  Growth_Rate = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny", "Shade", "Rainy", "Drought", "Cloudy"),
  stringsAsFactors = FALSE
)

# Create the scatter plot using explicit mapping syntax
plant_plot <- ggplot(data = plant_data) +
  geom_point(mapping = aes(x = Plant_ID, y = Growth_Rate), 
             color = "dodgerblue", 
             size = 4) +
  geom_text(mapping = aes(x = Plant_ID, y = Growth_Rate, label = Condition_Label), 
            color = "darkorange", 
            vjust = 1.5) +
  labs(title = "Scatter Plot of Plant Growth Data",
       x = "Plant ID",
       y = "Growth Rate")

# Display the plot
print(plant_plot)




# Program 4


# Load the necessary libraries
library(ggplot2)
library(plotly)

# Load the built-in Iris dataset
data("iris")

# 1. Static Visualization using ggplot2 (Explicit Syntax)
static_plot <- ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Width, y = Petal.Width, color = Species), 
             size = 3, 
             alpha = 0.8) +
  labs(title = "Static Plot: Sepal Width vs Petal Width",
       x = "Sepal Width",
       y = "Petal Width")

print(static_plot)

# 2. Converting Static Plot to Interactive Plot
interactive_converted <- ggplotly(p = static_plot)
print(interactive_converted)

# 3. Interactive Visualization natively using Plotly
native_plotly <- plot_ly(
  data = iris, 
  x = ~Sepal.Width, 
  y = ~Petal.Width, 
  color = ~Species, 
  type = "scatter", 
  mode = "markers",
  marker = list(size = 10, opacity = 0.8)
) %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = "cm"),
    yaxis = list(title = "Petal Width", ticksuffix = "cm")
  )

print(native_plotly)
