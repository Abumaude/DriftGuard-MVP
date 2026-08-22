---
title: Launch checklist
slug: launch-checklist
type: checklist
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
supersedes: MEMO_launch-playbook.md (2026-05-23), operationally
---

# Launch checklist

The May 2026 launch playbook remains the strategic document. This is the
operational sequence, updated for what changed by July: the GitHub organisation
name is gone, one recommended tool is unverified, and the positioning needs a
concession it did not need in May.

Work top to bottom. Nothing below a **BLOCKING** item starts until that item
clears.

---

## Pre-flight — BLOCKING

- [ ] **Fill the gate.** `ANCHOR.md` Section 1.0 needs a real named person. Not
      "alpha testers." One human, reachable this afternoon, who has complained
      to you about this problem or is building something now and would recognise
      it. If nobody comes to mind, that is the finding, and the correct next
      action is to go and find one rather than to proceed.
- [ ] **Pick and create the GitHub organisation.** `DriftGuard` is taken.
      Criteria and shortlist logic in `docs/NAMING.md`. Check organisation
      availability *first*, not last — that is the constraint that killed the
      incumbent.
- [ ] **Replace every `ORG` placeholder** across markdown, JSON, and both
      dashboards. Do not count them by hand:
      `grep -rl '\bORG\b' . --exclude-dir=.git | xargs -r -d '\n' sed -i 's/\bORG\b/your-org/g'`
      then confirm `grep -rn '\bORG\b' . --exclude-dir=.git` returns nothing.
- [ ] **Run the process walkthrough** (`BUILD_INSTRUCTIONS.md` Step 0.5). Draw
      the launch process, walk every actor, confirm the two dead ends recorded
      in `ANCHOR.md` 8.4 are closed in `CONTRIBUTING.md` and the issue
      templates. `operator_review: required` — you approve the drawing before
      Step 1.
- [ ] **Resolve Scope Lock.** Open the repository directly. Confirm it exists,
      its licence, and its state. Restore the named recommendation or remove it
      — see `BUILD_INSTRUCTIONS.md` Step 2, which runs after the organisation
      exists. A 404 on launch day costs more than the recommendation is worth.

- [ ] **Run `./scripts/verify.sh --published`** and get a clean pass. It checks
      the tracker graph, seed drift, every relative link, and any derived count
      hand-typed into prose. That last one is there because it happened.

## Repository setup

- [ ] Push this bundle to the master repository. Make it public.
- [ ] Settings → Features → enable **Issues** and **Discussions**.
- [ ] Settings → Pages → **Source: GitHub Actions**. The workflow in
      `.github/workflows/pages.yml` publishes `docs/` as the site root; choosing
      "deploy from a branch" instead makes every workflow run fail at the deploy
      step. Confirm both `index.html` and `tracker.html` return 200.
- [ ] Pin a welcome-and-how-to-give-feedback Discussion.
- [ ] Confirm the three issue templates (bug, feedback, feature request) and
      the two contact links in `config.yml` render in the "New issue" chooser.
- [ ] Add the repository description and topics. Topics matter more than they
      look — they are a real discovery surface on GitHub and cost thirty seconds.
- [ ] Add a social preview image (Settings → Social preview). This is the OG
      image shown wherever the URL is pasted, and its absence is conspicuous.

## Feedback intake

- [ ] 90-second form, five questions: who are you, what did you try to do, what
      worked, what did not, would you recommend this and to whom. Link from the
      README and the pinned Discussion.
- [ ] Booking link, four to six slots a week: *"DriftGuard walkthrough — I'll
      watch you try it."* This is the highest-value item on this page and the
      one most likely to be skipped, because watching someone struggle with your
      own artefact is uncomfortable. Say nothing while they try.
- [ ] `feedback/` folder with subfolders for interviews, recordings, calls,
      triaged issues, and surveys. This is the raw research store.
- [ ] Privacy-respecting analytics on the Pages site, so real visit volume is
      visible rather than GitHub's coarse counts. Watch it; do not let it clear
      a gate.
- [ ] Operational email — a dedicated address, forwarded, so the form and
      booking link do not land in a personal inbox.

## Consent — BLOCKING before any public post

- [ ] **The origin case.** The README describes a member's app where submit and
      approve both worked and the submitter never learned the outcome. It is
      anonymised and it is somebody's real failure. Ask them before publishing.
      A repo whose constitution requires explicit permission for testimonials
      should not make an exception for an unflattering one. CLAIM-015.

## Copy corrections — BLOCKING before any public post

Each of these is a specific stale claim. All three are already corrected in this
bundle; the checklist item is confirming nothing reintroduces them in the launch
posts.

- [ ] **The Anthropic billing claim.** Announced 14 May 2026, **cancelled 15
      June 2026** before taking effect. Do not assert the split as current fact.
      Told accurately, it is a stronger argument — the reversal happened, in
      public.
- [ ] **The constitution claim.** Do not present immutable-constitution-as-a-file
      as novel. GitHub shipped `/speckit.constitution` at very large scale.
      Concede it, then narrow to the seams. `docs/POSITIONING.md` has the frame.
- [ ] **Do not cite the Anthropic 2026 Agentic Coding Trends Report.** The
      landing page has been read; the report has not. Citing a landing page is
      how a launch earns its first public correction.
- [ ] Every figure quoted comes from the primary source. The Meta paper numbers
      are +8.3 pp on Terminal-Bench 2.0 (37.6% → 45.9%) and +6.8 pp on τ²-Bench.
      **Never "10%"** — that is a social-media summary.

## Publishing

- [ ] Master repository README live and reading well on mobile. Most first
      contacts will be on a phone, and the tables are the thing most likely to
      break.
- [ ] Both dashboards live and shareable by URL. Each doubles as a demo to drop
      into a post.
- [ ] Variant repositories published — **only the genuinely complete ones**.
      Trim the README's variant table to match. A link to an empty repo costs
      more credibility than a missing row.
- [ ] Long-form origin post: twenty things built, none shipped, and what changed.
      This is the strongest asset the project has, because it is the one thing no
      competitor can copy.
- [ ] Short-form thread pointing at the origin post and the live dashboard.

## Outreach — after the Prototype gate clears, not before

- [ ] Five to fifteen named people, **individually**. A post to a feed is not
      this step. Each message references something specific about what they are
      building.
- [ ] Three or more watched attempting to fill an anchor. Log every stall in
      `state/use-ledger.md`.
- [ ] Directory and community submissions — but only after at least one person
      other than you has used it. Submitting an unused tool to a directory is
      how you get traffic you cannot learn from.

## Name registry — maintain from day one

Every place the name is published, so the rename in `BUILD_INSTRUCTIONS.md`
Step 7 stays a one-pass operation. GitHub redirects repository URLs; it does
not redirect a directory entry that hardcoded the name in body text.

| Surface | URL | Date published | Renamed? |
|---|---|---|---|
| GitHub org | | | |
| Master repo | | | |
| Dashboard | | | |
| Long-form post | | | |
| Thread | | | |
| Directory listings | | | |

Fill this in as you go. Reconstructing it later is the expensive version.

---

## What "launched" means here

Not the repository being public. `ANCHOR.md` sets the Prototype signal as *the
named person reacted*, and that is the only thing that clears the first gate.

Stars, traffic, and forks are quarantined metrics. They are real, they are worth
watching, and none of them can move this project to the next band. The failure
being corrected is twenty builds and nothing shipped; a launch measured in stars
is that failure with a scoreboard attached.
