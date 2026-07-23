# Summarize registrant locations into per-state and per-country counts ----
# Reads the committed Derived/registrants_public.csv (not the raw xlsx), so this is reproducible from the repo alone

# Libraries ----
library(here)
library(dplyr)
library(tibble)

# Load data ----
registrants_public <- read.csv(here("Data", "registrants_public.csv")) |>
  as_tibble()

# Count registrants ----
# Within US
us_counts <- registrants_public |>
  filter(country == "USA") |>
  count(state, name = "registrants") |>
  mutate(region = tolower(state.name[match(state, state.abb)]))

# International
international_counts <- registrants_public |>
  filter(country != "USA") |>
  count(country, name = "registrants")
international_counts

# Export ----
write.csv(us_counts, here("Derived", "us_counts.csv"), row.names = FALSE)
