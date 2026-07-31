# Summarize registrant locations into per-state and per-country counts ----
# Reads the committed Derived/registrants_public.csv (not the raw xlsx), so this is reproducible from the repo alone

# Libraries ----
library(here)
library(dplyr)
library(tibble)
library(tidyr)
library(janitor)

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

# Reshape pre-workshop survey into long-format ratings and goal counts ----
# Reads the committed Data/Pre_Workshop_Survey_public.csv (not the raw export), so this is reproducible from the repo alone

# Load data ----
survey_public <- read.csv(here("Data", "Pre_Workshop_Survey_public.csv"), check.names = FALSE) |>
  clean_names() %>%
  as_tibble() 
survey_topics <- survey_public %>% 
  select(where(is.numeric)) %>% 
  names()

# Reshape familiarity ratings ----
# One row per respondent per topic, so 01_plotting.R can show the spread of ratings rather than a single collapsed mean
survey_long <- survey_public |>
  select(all_of(survey_topics)) |>
  pivot_longer(everything(), names_to = "topic", values_to = "familiarity")

# Count stated end-of-workshop goals by category ----
survey_goals <- survey_public |>
  mutate(goal_category = ifelse(
    goal_category %in% c("Project organization", "Reproducibility"), "Reproducibility / organization", goal_category)
    ) %>%
  count(goal_category, name = "respondents")

# Export ----
write.csv(survey_long, here("Derived", "survey_long.csv"), row.names = FALSE)
write.csv(survey_goals, here("Derived", "survey_goals.csv"), row.names = FALSE)
