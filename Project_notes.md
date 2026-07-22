# Project notes — AOS 2026 Reproducibility Workshop

## What this is
Prep folder — and now GitHub repo — for a 4-hour workshop Aaron is teaching at
the AOS (American Ornithological Society) 2026 conference: **"Reproducibility
beyond the code – organizing research projects in R."** The repo itself
doubles as the live teaching example for the Git/GitHub section.

- **Local:** this OneDrive folder (`git init`'d 2026-07-21)
- **Remote:** https://github.com/LezzGitIt/Reproducibility_workshop_aos (public)
- RStudio project file: `Reproducibility_workshop.Rproj`

## Folder contents
- `Reproducibility_workshop_aos.docx` — the full workshop proposal submitted to
  AOS: instructor bio, summary, overview, target audience, logistics (1–5 PM,
  min 5 / max 25 participants, $0 cost, bring-your-own-laptop with R or Python
  + a free GitHub account).
- `AOS 2026 Workshop Registrants 7-17-26.xlsx` — **gitignored** (contains PII).
  Registration export covering **all** AOS 2026 workshops (one sheet per
  workshop). Only the **"Reproducibility Beyond Code"** sheet is this
  workshop's roster. Local-only, never pushed.
- `Reproducibility_articles/` — **gitignored** (copyrighted publisher PDFs,
  repo is public). Six background/reference articles kept locally for prep;
  citations below so they're still discoverable from the repo.
- `Data/`, `Derived/`, `Figures/`, `Scripts/` (with `Scripts/qmd/` for Quarto
  files) — standard project structure. `Derived/` and `Figures/` contents are
  gitignored (recreatable); folders are kept via `.gitkeep`.
- `Scripts/qmd/slides.qmd` — starter reveal.js slide deck (see below).

## Reference articles (kept locally, not pushed — see above)
- Kellner, Doser & Belant (2024). Functional R code is rare in species
  distribution and abundance papers. *Ecology*.
- Jenkins et al. (2023). Reproducibility in ecology and evolution: Minimum
  standards for data and code. *Ecology and Evolution*, 13:e9961.
  https://doi.org/10.1002/ece3.9961
- Kimmel, Avolio & Ferraro (2023). Empirical evidence of widespread
  exaggeration bias and selective reporting in ecology. *Nature Ecology &
  Evolution*, 7:1525–1536. https://doi.org/10.1038/s41559-023-02144-3
- Braga et al. (2023). Not just for programmers: How GitHub can accelerate
  collaborative and reproducible research in ecology and evolution. *Methods
  in Ecology and Evolution*, 14:1364–1380. https://doi.org/10.1111/2041-210X.14108
- Open Science Collaboration (2015). Estimating the reproducibility of
  psychological science. *Science*, 349(6251).
- Pick, Allen, Bachelot et al. The SORTEE guidelines for data and code
  quality control in ecology and evolutionary biology. *Peer Community
  Journal*, Ecology section.

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
Repo is live on GitHub with the proposal, reference-article citations, project
notes, folder skeleton, and a starter `slides.qmd` (renders cleanly to
reveal.js HTML — confirmed 2026-07-21). Still needed: fleshed-out slide
content, hands-on exercise files/example datasets in `Data/`, and a
walkthrough repo-within-a-repo example for the Git/GitHub section.
