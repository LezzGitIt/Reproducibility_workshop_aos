# Project notes — AOS 2026 Reproducibility Workshop

## What this is
Prep folder for a 4-hour workshop Aaron is teaching at the AOS (American
Ornithological Society) 2026 conference: **"Reproducibility beyond the code –
organizing research projects in R."** Not a code/analysis project, so the usual
Data/Derived/Figures/Scripts structure doesn't apply here — this folder holds
the workshop proposal, background reading, and the registrant list.

## Folder contents
- `Reproducibility_workshop_aos.docx` — the full workshop proposal submitted to
  AOS: instructor bio, summary, overview, target audience, logistics (1–5 PM,
  min 5 / max 25 participants, $0 cost, bring-your-own-laptop with R or Python
  + a free GitHub account).
- `AOS 2026 Workshop Registrants 7-17-26.xlsx` — registration export covering
  **all** AOS 2026 workshops (one sheet per workshop). Only the
  **"Reproducibility Beyond Code"** sheet is this workshop's roster.
- `Reproducibility_articles/` — six background/reference PDFs supporting the
  workshop content (Kellner 2024 on functional R code rarity in SDM papers,
  Jenkins 2023 on minimum reproducibility standards in ecology/evolution,
  an empirical-evidence-of-widespread-[irreproducibility] paper, Braga 2023 on
  GitHub for collaborative reproducible research, the 2015 Open Science
  Collaboration *Science* replication study, and the SORTEE guidelines).
- No `Data/`, `Derived/`, `Scripts/` folders — there is no analysis code in
  this workshop-prep folder itself.

## Workshop content (3 parts, per the proposal)
1. **Organizing R projects/repos** — directory structure, separating raw
   data / processed data / scripts / outputs, script-internal organization.
2. **Documentation** — effective READMEs (purpose, file structure, run order)
   and lightweight data dictionaries.
3. **Git & GitHub** — version control basics, recovering old versions, safe
   refactoring/deletion, `.gitignore`, and GitHub repos as the mechanism for
   meeting journal data/code-availability requirements.

Audience: no prior Git/R experience required, but basic research/data-analysis
familiarity assumed. Hands-on — participants are encouraged to bring their own
active projects and apply concepts directly.

Two links embedded in the docx:
- "example" (of a reproducible repo/output) → a *Journal of Biogeography*
  paper: https://onlinelibrary.wiley.com/doi/full/10.1111/jbi.15176
- "Spanish" (past presentation on the role of the data paper) →
  https://www.youtube.com/watch?v=oARpP4wU9-o

## Registrants (as of the 2026-07-17 export)
24 people registered for the "Reproducibility Beyond Code" sheet. Listed
affiliations (12 of 24 gave none): University of Connecticut (2), Sacred Heart
University (2), Louisiana State University (2), Colorado State University,
Willistown Conservation Trust, West Virginia University, Simon Fraser
University, Wisconsin DNR, Stanford University. This confirms the mixed
audience the proposal anticipates — a spread from students to conservation
practitioners — worth designing material that doesn't assume a shared starting
skill level. (Full roster incl. names/emails is in the xlsx; treat that file
as containing personal contact info and avoid pasting entries into shareable
outputs like slides or artifacts.)

## Status / next steps
Only the proposal + reference articles + registrant list exist so far — no
slides, hands-on exercise files, or example repo have been built yet in this
folder. Not a git repo currently.
