# Load the Leaflet Package
library(leaflet)

# Define geographic coordinates
katpadi_lat <- 12.9815
katpadi_lng <- 79.1415
landmark_lat <- 12.9692
landmark_lng <- 79.1559

# Initialize Map, Set View, and Add Markers explicitly
final_map <- leaflet() %>%
  addTiles() %>%
  setView(lng = katpadi_lng, lat = katpadi_lat, zoom = 14) %>%
  addMarkers(lng = katpadi_lng, lat = katpadi_lat, 
             popup = "Katpadi Railway Station Junction") %>%
  addCircleMarkers(
    lng = landmark_lng, 
    lat = landmark_lat,
    radius = 10,
    color = "red",
    stroke = FALSE,
    fillOpacity = 0.8,
    label = "Major Educational Institute Cluster"
  )

# Display the final map
print(final_map)
