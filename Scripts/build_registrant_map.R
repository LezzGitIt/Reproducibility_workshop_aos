# Map Beyond Code registrant locations ----
# Reads the raw registrant workbook (local-only, gitignored) and builds a
# lightly anonymized location dataset -- first name + last initial, city,
# state, country; no email, no full last name, no street address -- that's
# safe to share, then plots a US state choropleth of where registrants are
# from. The anonymized CSV and the map PNG are the two committed exceptions
# to the otherwise-gitignored Derived/ and Figures/ folders.

library(here)
library(readxl)
library(dplyr)
library(stringr)
library(janitor)
library(ggplot2)
library(maps)

## 1) Read and clean ----
registrants_raw <- read_excel(
  here("Data", "AOS 2026 Workshop Registrants 7-17-26.xlsx"),
  sheet = "Reproducibility Beyond Code"
) |>
  clean_names()

## 2) Build the anonymized, shareable location dataset ----
# Country is blank in the source for US registrants and filled in for everyone else.
registrants_public <- registrants_raw |>
  transmute(
    first_name = first_name,
    last_initial = str_sub(last_name, 1, 1),
    city = city,
    state = state,
    country = if_else(is.na(country) & !is.na(state), "USA", country)
  )

write.csv(registrants_public, here("Derived", "registrants_public.csv"), row.names = FALSE)

## 3) Count registrants per state / country ----
us_counts <- registrants_public |>
  filter(country == "USA") |>
  count(state, name = "registrants") |>
  mutate(region = tolower(state.name[match(state, state.abb)]))

international_counts <- registrants_public |>
  filter(country != "USA") |>
  count(country, name = "registrants")

## 4) Plot a US state choropleth, captioning international registrants ----
# Kept to US states rather than a world map so this stays offline/reproducible
# -- no geocoding API calls needed to place cities on a map.
state_map <- map_data("state") |>
  left_join(us_counts, by = "region")

registrants_map <- ggplot(state_map, aes(long, lat, group = group, fill = registrants)) +
  geom_polygon(color = "white", linewidth = 0.2) +
  coord_quickmap() +
  scale_fill_viridis_c(na.value = "grey90", name = "Registrants") +
  labs(
    title = "Where \"Reproducibility Beyond the Code\" registrants are from",
    subtitle = paste0(
      "Plus ", sum(international_counts$registrants), " international registrant(s): ",
      paste(international_counts$country, collapse = ", ")
    ),
    x = NULL, y = NULL
  ) +
  theme_void() +
  theme(legend.position = "right")

ggsave(here("Figures", "registrants_map.png"), registrants_map, width = 8, height = 5, dpi = 300)
