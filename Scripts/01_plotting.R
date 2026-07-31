# Map registrant locations ----
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
ggsave(here("Figures/From_scripts", "registrants_map.png"), registrants_map, width = 8, height = 5, dpi = 300)

# Plot pre-workshop survey familiarity ----
# Reads Derived/survey_long.csv (produced by 00b_wrangling.R) and plots self-rated familiarity by topic

# Load data ----
survey_long <- read.csv(here("Derived", "survey_long.csv")) |>
  as_tibble()

# Order topics by median familiarity, least to most familiar ----
topic_order <- survey_long |>
  group_by(topic) |>
  summarise(median_familiarity = median(familiarity)) |>
  arrange(median_familiarity) |>
  pull(topic)

# Plot ----
# Boxplot + jittered points show the spread across respondents, not just a single collapsed mean
# Seeded so the jittered point positions (and the saved PNG) are identical on every re-run
set.seed(42)
familiarity_plot <- survey_long |>
  mutate(topic = factor(topic, levels = topic_order)) |>
  ggplot(aes(topic, familiarity)) +
  geom_boxplot(outlier.shape = NA, fill = "grey90") +
  geom_jitter(width = 0.1, height = 0.1, alpha = 0.6) +
  coord_flip() +
  scale_y_continuous(breaks = 1:5, expand = expansion(mult = 0.08)) +
  labs(x = NULL, y = "Self-rated familiarity (1 = none, 5 = expert)") +
  theme_minimal(base_size = 14)
familiarity_plot

# Save figure
ggsave(here("Figures/From_scripts", "survey_familiarity.png"), familiarity_plot, width = 8, height = 5, dpi = 300)

# Plot pre-workshop survey goals ----
# Reads Derived/survey_goals.csv (produced by 00b_wrangling.R) and plots respondent counts per goal category

# Load data ----
survey_goals <- read.csv(here("Derived", "survey_goals.csv")) |>
  as_tibble()

# Plot ----
goals_plot <- survey_goals |>
  mutate(goal_category = reorder(goal_category, respondents)) |>
  ggplot(aes(goal_category, respondents)) +
  geom_col(fill = "grey40") +
  coord_flip() +
  scale_y_continuous(breaks = function(limits) pretty(limits, n = 4)) +
  labs(x = NULL, y = "Respondents") +
  theme_minimal(base_size = 14)
goals_plot

# Save figure
ggsave(here("Figures/From_scripts", "survey_goals.png"), goals_plot, width = 8, height = 4, dpi = 300)
