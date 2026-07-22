# Summarize registrant locations into per-state and per-country counts ----
# Reads the committed Derived/registrants_public.csv (not the raw xlsx), so this is reproducible from the repo alone -- same as 01_registrant_map.R, which now reads this script's us_counts.csv output instead of recomputing the counts itself.

library(here)
library(dplyr)
library(tibble)

## 1) Load data ----
registrants_public <- read.csv(here("Derived", "registrants_public.csv")) |>
  as_tibble()

## 2) Count registrants ----
us_counts <- registrants_public |>
  filter(country == "USA") |>
  count(state, name = "registrants") |>
  mutate(region = tolower(state.name[match(state, state.abb)]))

international_counts <- registrants_public |>
  filter(country != "USA") |>
  count(country, name = "registrants")
international_counts

## 3) Export ----
write.csv(us_counts, here("Derived", "us_counts.csv"), row.names = FALSE)
