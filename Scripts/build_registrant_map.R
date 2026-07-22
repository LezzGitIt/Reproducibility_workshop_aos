# Map Beyond Code registrant locations ----
# Reads the committed, already-anonymized Derived/registrants_public.csv and plots a US state choropleth of where registrants are from -- fully reproducible from what's in this repo, no raw data required.

library(here)
library(dplyr)
library(tibble)
library(ggplot2)
library(maps)

## 1) Load data ----
registrants_public <- read.csv(here("Derived", "registrants_public.csv")) |>
  as_tibble()

## 2) Count registrants per state / country ----
us_counts <- registrants_public |>
  filter(country == "USA") |>
  count(state, name = "registrants") |>
  mutate(region = tolower(state.name[match(state, state.abb)]))

international_counts <- registrants_public |>
  filter(country != "USA") |>
  count(country, name = "registrants")

## 3) Plot a US state choropleth, captioning international registrants ----
# Kept to US states rather than a world map so this stays offline/reproducible -- no geocoding API calls needed to place cities on a map.
state_map <- map_data("state") |>
  as_tibble() |>
  left_join(us_counts, by = "region")

registrants_map <- ggplot(state_map, aes(long, lat, group = group, fill = registrants)) +
  geom_polygon(color = "white", linewidth = 0.2) +
  coord_quickmap() +
  scale_fill_viridis_c(na.value = "grey90", name = "Registrants") +
  theme_void()

ggsave(here("Figures", "registrants_map.png"), registrants_map, width = 8, height = 5, dpi = 300)
