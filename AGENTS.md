# AGENTS.md

Instructions for AI agents working in this repository. This file follows the
`AGENTS.md` convention so that any agent honouring it picks up this project's
governance without per-tool integration.

## Read this first

This repository is governed by two files.

- **`ANCHOR.md`** — the constitution. Load Section 1 in every session. Load
  other sections only when `BUILD_INSTRUCTIONS.md` names them for the current
  step. **Never modify it.** If your output contradicts the anchor, your output
  is wrong.
- **`BUILD_INSTRUCTIONS.md`** — the sequence. Read it before acting. It tells
  you which step is next, which anchor sections that step loads, which model to
  use, how to verify, and what to commit.

If you are asked to "continue the build" with no further detail, read
`BUILD_INSTRUCTIONS.md`, find the last `step-XX` commit in the git log,
read `state/use-ledger.md` for what was already tried and what failed, confirm
the current release band's proof gate, and execute the next step.

## Hard rules

**Never edit `ANCHOR.md`.** It grows by adding sections. If a decision in it is
wrong, append a new section recording the change and the reason. Do not edit,
do not delete, do not "clean up" superseded sections — they are the record of
what was believed at the time, which is the point.

**Do not skip Step 0.** The front gate in `ANCHOR.md` Section 1.0 is currently
closed: the anchor sentence has no named person in it. No build action past
Step 0 is permitted until a human fills it. Do not fill it yourself, and do not
invent a plausible name — the whole mechanism depends on it being someone the
operator can actually message.

**Run `./scripts/verify.sh` before every push**, and `--published` once the ORG
placeholders are substituted. It is the mechanical half of the checklist below.

**Never type a derived count into prose.** Item counts and file counts belong in
the data, and a sentence restating one goes stale silently. The verifier fails
on it.

**Run the validation checklist** in `ANCHOR.md` Appendix A after every step.
Every item must pass before you commit. That includes item 11, NO DEAD ENDS —
re-check the actor journeys in Section 8.4 after every step, not only at the
start, because a new feature can open a new dead end.

**Step 0.5 is a gate, not a formality.** Before any build work, render the
process as a diagram and walk each actor end to end. Write no application code
in that step. A journey that ends without its actor learning the outcome is a
spec defect — halt with a Failure Report naming the actor and the missing step,
and do not paper over it in code. `operator_review: required` means you stop and
wait for a human to approve the drawing.

**Commit format:** `step-XX: description`. Append a line to
`state/use-ledger.md` in the same commit.

**Stop on failure.** Do not proceed to the next step. Emit the failure report
format from `BUILD_INSTRUCTIONS.md` and wait for the operator.

## Constraints that bind your output

From `ANCHOR.md` Section 1.2. These are not style preferences.

- **Zero API calls.** Nothing you add may require a key, server, quota, or
  account to use the methodology itself.
- **Sourced claims.** Any factual claim about a competitor, a paper, or a
  vendor carries a verifiable source and a verification date. Quote figures
  from the primary source, never from a summary of it.
- **Rename-cheap.** Nothing may depend on the string `DriftGuard` in a way a
  find-and-replace cannot fix. The name is provisional — see `docs/NAMING.md`.
  The dashboards read the product name from a single `PRODUCT` constant; use it
  rather than hardcoding.
- **No new variants** while an unshipped one exists. This is the
  architect's-trap protection and it is the constraint most likely to be
  violated by a helpful agent generating adjacent ideas.
- **Observed signals only.** Do not add features because they seem useful. Add
  them because someone was observed to need them, and cite the ledger line.
- **Every material public claim needs a ledger entry** in
  `commercial/EVIDENCE_LEDGER.yaml` with a tier, sources, and limits
  (ANCHOR constraint 12). Adding a factual sentence to the README means adding
  a ledger entry in the same commit. An unlogged claim does not ship.
- **Label synthetic examples** wherever they appear (constraint 13). Two are
  registered — SYN-001 the before/after exchange, SYN-002 the Dayo anchor.
  If you write a new illustration, register and label it.
- **Never imply independent verification** (constraint 14). "Verified" in this
  repo means one person plus an AI assistant checked a source on that date.
  The conflict disclosure travels with it.
- **Plain English in audience-facing files.** README, GLOSSARY, templates, and
  both dashboards are written for someone who does not know what a repository
  is. Every unavoidable term gets an inline gloss at first use and a one-line
  GLOSSARY entry. Do not raise the reading level of these files.

## Repository map

```
README.md               the landing page and the only marketing surface
ANCHOR.md               the constitution — read Section 1 always, never edit
BUILD_INSTRUCTIONS.md   the sequence — read first, every session
AGENTS.md               this file
CLAUDE.md               a short pointer here, read automatically by Claude Code
CONTRIBUTING.md         what gets merged and what does not
GLOSSARY.md             every term in the README, one line each, plain English
HONEST_BOX.md           what it does not do, and who should not adopt it
commercial/             the commercial trust layer — HOW_TO_USE.md first,
                        then the constitution (20 rules), EVIDENCE_LEDGER.yaml,
                        product + funnel profiles, pre-ship checklist and runs
LICENSE                 MIT
.gitignore
.github/
  ISSUE_TEMPLATE/       bug.md, feedback.md, feature-request.md, config.yml
  PULL_REQUEST_TEMPLATE.md
  workflows/pages.yml   deploys docs/ to GitHub Pages (Pages source must be
                        "GitHub Actions", not "deploy from a branch")
templates/              blank anchor + build templates for other projects
examples/worked-example/ one filled pair — deliberately a non-code project
state/use-ledger.md     what was tried, what failed, what was skipped
docs/
  index.html            public dashboard (single file, no build step)
  tracker.html          build tracker (single file, reads data/tracker.json)
  data/                 tracker.json, variants.json — edit data, not markup
  RESEARCH_LOG.md       append-only sector observations, with verification dates
  POSITIONING.md        competitive delta + rebuttal kit
  NAMING.md             name collisions, criteria, rename procedure
  OPERATING_MANUAL.md   which files the operator touches, when, and why
  RULING_closed-loop-gate-v1.md  the draw-it-first rule, ratified 2026-08-22
scripts/verify.sh         pre-push checks — graph, seeds, links, stale counts
  LAUNCH_CHECKLIST.md   the operational launch sequence
  FAQ.md                answers to the questions this will actually get
```

Note that `docs/` is the GitHub Pages site root. A link from inside `docs/` to a
file above it (`../templates/`) resolves above the site root and 404s on the
deployed site — use an absolute GitHub URL for those.

## Working on the dashboards

Both are single self-contained HTML files with no build step, no bundler, and
no external runtime dependencies. Keep them that way — the point is that they
work from a file:// URL and survive any hosting decision.

They read from `docs/data/*.json` and fall back to embedded seed data when the
network is unavailable. **To change what they display, edit the JSON, not the
markup.** If you find yourself editing HTML to add a variant, you are doing it
wrong.

They call no external API. Design principle 6 bars anything requiring a key,
server, quota, or account, and the unauthenticated GitHub API is quota-bound —
so do not add one, with or without a token.

In `docs/data/tracker.json`, `blocks` and `status` are **derived** fields. `blocks`
is computed from every other item's `blockedBy`, and `status` follows the rule
stated in the file's `statusRule` key. Edit `blockedBy` and let the other two
follow; hand-editing them is how the graph silently desynchronises.

## What not to do

Do not add a build step, a package manager, a framework, or a dependency to
the dashboards. Do not add telemetry or analytics to the repository itself. Do
not create a marketing site — the README is the marketing surface. Do not
generate new variants, memos, or design systems unless a build step explicitly
asks for one. Do not soften the "use something else if" section of the README;
it is load-bearing.
