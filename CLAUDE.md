# CLAUDE.md

Claude Code reads this file automatically at the start of a session.

## Read these first

Everything you need is in two files, and they are not this one.

1. **[`AGENTS.md`](AGENTS.md)** — how to work in this repo. Hard rules, constraints, what not to touch. Read it fully before your first action.
2. **[`BUILD_INSTRUCTIONS.md`](BUILD_INSTRUCTIONS.md)** — what to do next. Read it before every session.

`ANCHOR.md` is the constitution. Load Section 1 always. Load other sections only when the current build step names them. **Never edit it** — if your output contradicts the anchor, your output is wrong; if the anchor is wrong, append a section.

## The four rules most likely to be broken

**Never edit `ANCHOR.md`.** It grows by adding sections. A superseded decision stays put as the record of what was believed at the time. Sections 7 and 8 are worked examples of appending rather than editing.

**Two gates run before any build work.** Step 0 fills the front gate — a real named person in `ANCHOR.md` 1.0. Step 0.5 draws the process and walks every actor's journey. Do not skip either, and do not fill Step 0 in yourself: the named person has to be someone the operator can actually message.

**No dead ends.** After every step, re-check the actor journeys in `ANCHOR.md` 8.4. A journey that ends without its actor learning the outcome is a missing feature — halt and report, do not patch it in code.

**Every material public claim needs a ledger entry** in `commercial/EVIDENCE_LEDGER.yaml`, with a tier, its sources, and its limits. Adding a factual sentence to the README means adding a ledger entry in the same commit.

## Publishing this repo for the first time

If the working tree is this bundle and it has not been pushed yet, the job is:

1. If a `driftguard/` folder sits at the root with everything inside it, move its contents up one level so `README.md` is at the repo root. Delete the empty folder and the outer `START_HERE.md` — that one is a note to the operator, not part of the repo.
2. Replace every `ORG` placeholder with the GitHub owner: `grep -rl '\bORG\b' . --exclude-dir=.git | xargs -r -d '\n' sed -i 's/\bORG\b/OWNER/g'`. Then confirm `grep -rn '\bORG\b' . --exclude-dir=.git` returns nothing.
3. **Run `./scripts/verify.sh --published` and fix anything it fails.** It checks the tracker graph, seed drift, every relative link, and that no derived count has been hand-typed into prose. It exists because exactly that defect once survived an adversarial review and two governance passes.
4. Commit as `step-01: publish master repo and dashboards` and push.

Two things you cannot do from here, which the operator does by hand in the repo settings: set **Pages → Source: GitHub Actions** (not "deploy from a branch" — the workflow fails on that), and switch on **Discussions**.

## Things that will look like improvements and are not

Do not add a build step, bundler, framework, or dependency to the dashboards in `docs/`. They are single files that work from a `file://` URL, and that is load-bearing rather than aesthetic.

Do not add anything requiring an API key, server, quota, or account. That converts the methodology into a harness and destroys its only durable advantage.

Do not hand-edit `blocks` or `status` in `docs/data/tracker.json`. Both are derived — edit `blockedBy` and recompute, then regenerate the embedded seed in `docs/tracker.html` so the two cannot diverge. `./scripts/verify.sh` catches it if you get this wrong.

**Never type a count into prose.** Not item counts, not file counts. If a sentence states a number that lives in a data file, the sentence will be wrong within a week and nobody will notice. Point at the tracker instead. The verifier fails the build on this.

Do not generate new variants, memos, or design systems unless a build step asks for one.
