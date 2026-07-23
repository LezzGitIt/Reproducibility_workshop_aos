# Map Beyond Code registrant locations ----
# Reads Derived/us_counts.csv (produced by 00b_wrangling.R) and plots a US state choropleth of where registrants are from

# Libraries ----
library(here)
library(dplyr)
library(tibble)
library(ggplot2)
library(maps)

# Load data ----
us_counts <- read.csv(here("Derived", "us_counts.csv")) |>
  as_tibble()

# Inspect map data ----
map_data("state") %>% tibble()

# Join ----
state_map <- map_data("state") |>
  as_tibble() |>
  select(-c(subregion, order)) |>
  left_join(us_counts, by = "region")
state_map

# Plot US state chloropleth ----
# Kept to US states rather than a world map so this stays offline/reproducible -- no geocoding API calls needed to place cities on a map.
registrants_map <- state_map %>% 
  # draw one closed shape per distinct group (e.g. important for states like Michigan)
  ggplot(aes(long, lat, group = group, fill = registrants)) +
  geom_polygon(color = "white", linewidth = 0.2) +
  coord_quickmap() +
  scale_fill_viridis_c(na.value = "grey90", name = "Registrants") +
  theme_void()
registrants_map

# Save figure
ggsave(here("Figures", "registrants_map.png"), registrants_map, width = 8, height = 5, dpi = 300)
