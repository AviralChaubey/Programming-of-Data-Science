install.packages("plotly")
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