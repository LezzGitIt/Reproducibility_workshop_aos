# Extract Beyond Code registrant emails ----
# Reads the raw registrant workbook (local-only, gitignored -- it's PII) and
# pulls name + email for the Reproducibility Beyond Code sheet, flagging
# anything that doesn't look like a valid email. Output stays local too
# (Derived/ is gitignored by default): this script is the public teaching
# artifact, not the real emails it produces.

library(here)
library(readxl)
library(dplyr)
library(stringr)
library(janitor)

## 1) Read and clean ----
# The workbook covers every AOS 2026 workshop -- one sheet per workshop.
registrants_raw <- read_excel(
  here("Data", "AOS 2026 Workshop Registrants 7-17-26.xlsx"),
  sheet = "Reproducibility Beyond Code"
) |>
  clean_names()

## 2) Extract and validate emails ----
# Structural check (user@domain.tld) -- catches blanks/typos, not full RFC validation.
email_pattern <- "^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$"

registrant_emails <- registrants_raw |>
  select(full_name, email) |>
  mutate(email_valid = str_detect(email, email_pattern))

if (any(!registrant_emails$email_valid)) {
  warning(sum(!registrant_emails$email_valid), " row(s) have an unexpected email format -- check before using.")
}

## 3) Write local-only output ----
# Real names + emails: never commit this file, even though Derived/ has a
# couple of specific exceptions carved out elsewhere -- this isn't one of them.
write.csv(registrant_emails, here("Derived", "registrant_emails.csv"), row.names = FALSE)
