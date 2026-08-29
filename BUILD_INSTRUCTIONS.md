---
title: DriftGuard — Build Instructions (the launch itself)
slug: driftguard-launch
type: build-instructions
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
anchor: ANCHOR.md
---

# DriftGuard — Build Instructions

## Routing document for the public launch

This file controls how the launch executes. It references `ANCHOR.md` by section number. Read this file first, then load only the anchor sections named for the current step.

---

## How this file works

**Two gate steps run before everything, in order.** Step 0 asks whether this should exist at all: no build action begins until the session card is filled and `ANCHOR.md` Section 1.0 holds a real name. That gate is now open — it names the operator, and the limitation that follows is recorded in `ANCHOR.md` Section 9.3 — and it is not a formality — it is the one rule whose violation caused the failure this project exists to correct.

Step 0.5 asks whether the design is complete: the whole process gets drawn and every actor's journey walked before any build work. Added by `RULING_closed-loop-gate-v1` (2026-08-22), recorded as `ANCHOR.md` Section 8.

Before executing any step, **read the named `ANCHOR.md` sections from disk.** Do not rely on memory or on assumptions about what they contain. After completing each step, **run the validation checklist** in `ANCHOR.md` Appendix A. **Never modify `ANCHOR.md`** — if your implementation contradicts it, your implementation is wrong; if the anchor itself is wrong, add a section, do not edit one.

**The one-ship rule is a commit gate.** The chosen cadence is *every step* (`ANCHOR.md` 1.0), so a step cannot be committed until one exposure carrying its band's feedback request has reached the named person and the result is logged. A refactor does not count. A DM sent, a page published, a link someone clicked, counts. Overrides are never blocked — they are logged, one line, in `state/use-ledger.md`.

After each successful step, **commit** with the message format `step-XX: description`, **append to the use ledger**, and **output a status report and copy-paste prompt**. On failure, do not proceed — output a failure report and wait.

**Do not enter a new release band until the previous band's proof gate has cleared** — the band's signal was *observed*, not hoped for. This gate is non-overridable regardless of cadence.

### Status report format

```
═══════════════════════════════════════════════
STATUS REPORT
═══════════════════════════════════════════════
✅ COMPLETED: Step [N] — [Title]
📋 VERIFIED:  [Pass/Fail] — [verification summary]
💾 COMMITTED: step-[NN]: [message]
📒 LEDGER:    [ledger line appended]

— SHIP-OR-DRIFT GATE —
🚢 EXPOSURE SHIPPED TO NAMED PERSON?  Y / N
📨 FEEDBACK REQUEST ATTACHED?         Y / N   (from ANCHOR 1.0, current band)
🔎 SIGNAL OBSERVED (or its absence):  [what came back]
🌀 IF NOT SHIPPED — DRIFT OVERRIDE:   [one-line reason, logged]

➡️  NEXT STEP: Step [N+1] — [Title]
🤖 MODEL:     [model]
📖 ANCHOR SECTIONS TO READ: [sections]

⚠️  NOTE: [warnings, or "None"]
═══════════════════════════════════════════════
```

Under *every step* cadence, if EXPOSURE SHIPPED is N the step is not done — resolve the shipment before committing, or record the override explicitly and accept that it is now in the ledger where a pattern will show.

### Copy-paste prompt

Same model as the current step:

```
Continue with Step [N+1]. Read BUILD_INSTRUCTIONS.md and ANCHOR.md
Sections [X + Y] from the repo. Execute Step [N+1]: [Title].
```

Different model:

```
Read BUILD_INSTRUCTIONS.md and ANCHOR.md Section 1 + Sections [X + Y]
from the repo root. Execute Step [N+1]: [Title].
```

### Failure report format

```
═══════════════════════════════════════════════
⛔ STEP FAILURE REPORT
═══════════════════════════════════════════════
❌ FAILED:    Step [N] — [Title]
🔍 FAILURE:   [what went wrong]
🧪 VERIFIED:  Fail — [which criteria failed]
💡 DIAGNOSIS: [root cause]
🔧 SUGGESTED FIX: [what to try]

🔄 RETRY PROMPT:
Re-read BUILD_INSTRUCTIONS.md and ANCHOR.md Sections [X + Y].
Retry Step [N]: [Title]. Previous attempt failed because: [reason].
Fix: [fix].
═══════════════════════════════════════════════
```

---

## Model routing

| Steps | Model | Reason |
|---|---|---|
| 1, 3, 4, 6, 8 | **Sonnet-class** | Well-defined mechanical work: repo setup, file placement, deployment, link checking |
| 0, 0.5, 2, 5, 7, 9 | **Opus-class** | Naming judgement, positioning copy, the process walkthrough, adversarial verification, reading signal from feedback |

The operator switches models manually. This file cannot do it.

---

## Build sequence

Step 0 runs once, before everything. The rest are grouped into three release bands, and the boundary between bands is a proof gate, not a date. One step per session; each is self-contained.

---

### Step 0: Fill the session card (front gate) — COMPLETE

**Status:** Complete, 2026-08-22. The gate names the operator; the self-generated signal and its cost are recorded in `ANCHOR.md` Section 9.
**Model:** Opus-class
**Read from ANCHOR:** Section 1, especially 1.0
**Dependencies:** none — this is the precondition for the whole build

**Task.** Fill the `ANCHOR.md` Section 1.0 anchor sentence with a real named person, a result in their world, and an externally generated signal. This is the only edit ever made to the anchor's existing text, and it is permitted because the slot is a fill-in, not a decision being revised.

Then set the current band to Prototype, copy its feedback request and signal into the session card below, confirm the ship cadence, name the single exposure Step 1 must produce, and state the anti-scope.

**On the named person.** Not "alpha testers." Not "vibe coders." One human, with a name, whom you can message this afternoon. Someone who has actually complained to you about losing context in an AI project, or who is building something now and would recognise the problem. If nobody comes to mind, that is the finding — it means this has been built without a customer, and the correct next action is to go and find one, not to proceed to Step 1.

**Verify.** All three slots hold something real and named. Band, feedback request, and signal are written into the session card. Cadence is confirmed.

**Commit:** `step-00: seed anchor sentence and session card`

```
=== SHIP OR DRIFT — SESSION CARD ===

ANCHOR (fill before producing anything)
- Outcome sentence: This exists so that ______ (a named person I can reach)
  can ______ (a change in THEIR world) and I'll know it worked when ______
  (a signal someone other than me generates).
- Ship cadence: every step
- Current release band: Prototype
- Feedback request for this band: ______
- Signal that counts for this band: ______
- The ONE exposure this session must produce: ______
- Anti-scope (what I will NOT build yet): ______
- Time-box, not token-box: ______ hrs

--- BUILD at full tilt ---

PROOF (fill before closing the session)
- Did something reach the named person?  Y / N
- Feedback request attached?  Y / N
- Signal observed (or its absence): ______
- Drift override (only if nothing shipped): [date] — shipped nothing because ______
- Next step, set by that signal (not by my next idea): ______
```

---

### Step 0.5: Process walkthrough (closed-loop gate)

**Model:** Opus-class
**Read from ANCHOR:** Section 1 + Section 8 (especially the 8.4 table)
**Dependencies:** Step 0
**operator_review:** required

**Task.** Render the launch process as a wireframe — Mermaid or ASCII — covering every actor in the Section 8.4 table. Write no other output in this step.

Walk each actor's journey end to end. Confirm every state change has an outcome-visibility path for whoever triggered it.

**Two rows are already known to fail.** Section 8.4 records them: somebody who files an issue, and somebody who opens a pull request, both enter an untracked queue with no stated way to learn what happened. Fix those in the spec before Step 1 — the fix is `CONTRIBUTING.md` and the issue templates stating what happens after filing, plus the use ledger recording feedback that changes the product, with the issue number. No new tooling.

**Critical:** any *further* dead end is also a spec defect. Halt with a Failure Report naming the actor and the missing step. Do not fix it in code.

**Review mode.** `operator_review: required` — output the diagram and the per-actor walkthrough, then stop and wait for approval before Step 1.

**Verify.** Diagram covers every actor and state change in 8.4. No blank cells in the table. The two known dead ends are closed in the spec. Approval received.

**Commit:** `step-00b: process walkthrough approved`

---

### Prototype band — signal: a reaction from one named person

---

### Step 1: Resolve naming and create the organisation

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1 + Section 5
**Dependencies:** Step 0, Step 0.5 (walkthrough approved)

**Task.** The `DriftGuard` GitHub organisation is taken (verified 2026-07-31, see `docs/NAMING.md`). Check three candidate organisation names against the criteria in that file, pick one, and create it. Do not run a full rebrand — this is an organisation name, and the product name stays provisional per Section 5.

Create the master repository, push this bundle, enable Issues and Discussions, and set **Settings → Pages → Source: GitHub Actions**. The workflow in `.github/workflows/pages.yml` uploads `docs/` as the Pages artifact; selecting "deploy from a branch" instead makes every workflow run fail at the deploy step.

Replace every `ORG` placeholder with the real organisation name, across markdown, JSON, and both dashboards:

```bash
grep -rl '\bORG\b' . --exclude-dir=.git | xargs -r -d '\n' sed -i 's/\bORG\b/your-org/g'
```

Do not count them by hand — an out-of-date tally is how two of them were missed in draft. The dashboards build their cross-repository links from these, so a missed placeholder produces links that resolve to a non-existent organisation rather than an obvious error.

**Verify.** Organisation exists. Repository is public. Issues and Discussions are on. Pages builds and both dashboard URLs return 200. No placeholder survives — `grep -rn '\bORG\b' . --exclude-dir=.git` returns nothing. (Match on the bare word, not on `ORG.github.io`; the `variants.json` occurrence has no URL around it.)

**Exposure.** Send the repository link to the named person with the Prototype feedback request: *"Could you fill in an anchor for something you are building?"*

**Commit:** `step-01: publish master repo and dashboards`

---

### Step 2: Resolve the Scope Lock verification

**Model:** Opus-class
**Read from ANCHOR:** Section 1 + constraint 9
**Dependencies:** Step 1

**Task.** `docs/RESEARCH_LOG.md` records Scope Lock (Ktulue) as `UNVERIFIED` as of 2026-07-31. Earlier materials recommended it prominently by name and author, named it in the composition story, and scheduled a bridge variant plus direct outreach.

Open the repository directly and establish: does it exist, under what licence, and in what state. If confirmed, restore the named recommendation to the README and the composition story, and keep `scope-lock-bridge` queued. If it cannot be confirmed, remove the named recommendation, keep the *pattern* described generically — task-level scope enforcement composes with project-level governance — and move `scope-lock-bridge` to parked in `docs/data/tracker.json`.

Either way, update the research log entry with the finding and today's date.

**Why this is its own step.** Constraint 9 requires every public claim about another project to carry a verifiable source and a verification date. A README that recommends a tool by name and author is a claim the operator will be held to, and a 404 on launch day costs more credibility than the recommendation was ever worth.

**Verify.** The research log entry is resolved either way. No unverified third-party recommendation survives in any public file.

**Exposure.** Post the finding publicly — a short note either recommending the tool with confidence, or explaining what could not be verified. Both are content; the second is better content.

**Commit:** `step-02: resolve scope-lock verification`

---

### Step 3: Stand up feedback intake

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1 + Section 6
**Dependencies:** Step 1

**Task.** Pin a welcome-and-how-to-give-feedback Discussion. Create a 90-second form with five questions — who are you, what did you try to do, what worked, what did not, would you recommend this and to whom — and link it from the README and the pinned Discussion. Set up a booking link for 30-minute screen-shares titled *"DriftGuard walkthrough — I'll watch you try it"*, with four to six slots a week. Create `feedback/` with subfolders for interviews, recordings, calls, triaged issues, and surveys. Add privacy-respecting analytics to the Pages site so real visit volume is visible.

The issue templates are already in `.github/ISSUE_TEMPLATE/` in this bundle. Confirm they render.

**On the screen-share.** It is the highest-value item here and the one most likely to be skipped, because watching someone struggle with your own artefact is uncomfortable. Say nothing while they try. The point where they stall is worth more than everything they say afterwards.

**Verify.** Every intake path is reachable from the README in one click. A test submission to the form arrives.

**Exposure.** Offer the named person a slot.

**Commit:** `step-03: feedback intake live`

---

> **PROOF GATE — Prototype → MVP.** Do not start the MVP band until the named person has reacted, or explicitly declined. Stars, traffic, and forks are quarantined metrics (`ANCHOR.md` Appendix B) and do not clear this gate. If there has been no reaction, iterate within the Prototype band: reach a different named person, or ask a smaller question.

---

### MVP band — signal: repeated, unaided use by a handful

---

### Step 4: Publish the complete variants

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1 + Section 4
**Dependencies:** Prototype gate cleared

**Task.** For each variant marked complete, create its repository using the standard six-item skeleton and the variant README grammar. Publish only what is genuinely complete — trim the README's variant table to match. A link to an empty repo costs more credibility than a missing row.

Add each published variant to `docs/data/tracker.json` with its live URL so both dashboards pick it up automatically.

**Verify.** Every row in the README's variant table resolves to a live repository. Every published repository has an anchor, build instructions, and one filled example. Both dashboards show the new variants without code changes.

**Exposure.** Send each variant to one person for whom that specific domain is relevant.

**Commit:** `step-04: publish variant repositories`

---

### Step 5: Reach five to fifteen named people, individually

**Model:** Opus-class
**Read from ANCHOR:** Section 1 + Section 6
**Dependencies:** Step 4

**Task.** Individually, not by broadcast. A post to a feed is not this step. Each person gets a message referencing something specific about what they are building, and one question.

Get at least three onto a screen-share and watch them attempt to fill in an anchor. Take notes on where they stall, not on what they say. Log every stall in `state/use-ledger.md`.

**Verify.** Five or more named people reached individually. Three or more observed attempting an anchor. Stalls logged.

**Exposure.** The outreach is the exposure.

**Commit:** `step-05: alpha outreach round one`

---

### Step 6: Non-technical register pass

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1.4 + Section 6
**Dependencies:** Step 5

**Task.** `ANCHOR.md` Section 1.4 names the register gap: the first market is the non-technical builder, and the artefacts are written for developers. Step 5 produced observed stall points. Rewrite the templates and the getting-started path against *those stalls specifically*, not against a general intuition that it should be simpler.

Constraint 2 governs this step. Only change what someone was observed to stumble over.

**Verify.** Every change traces to a logged stall. No speculative simplification shipped.

**Exposure.** Send the revised templates back to the people who stalled and ask whether it is now passable.

**Commit:** `step-06: register pass from observed stalls`

---

> **PROOF GATE — MVP → v1.** Do not start the v1 band until someone other than the operator has filled in an anchor, used it across two sessions, and returned with a specific complaint. A compliment is not the signal. A specific complaint is, because only a complaint proves the artefact was used.

---

### v1 band — signal: payment or public adoption

---

### Step 7: Execute the rename

**Model:** Opus-class
**Read from ANCHOR:** Section 5
**Dependencies:** MVP gate cleared

**Task.** Run the selection criteria in `docs/NAMING.md`, choose the name, and execute the two-command find-and-replace plus the organisation transfer. Update every external listing recorded in `docs/LAUNCH_CHECKLIST.md`. Remove the provisional-name note from the README and both dashboards.

**Why now and not earlier.** Renaming before the MVP signal means renaming something unproven; renaming after public adoption means breaking links that matter. Between the two gates is the cheapest moment, and it only stays cheap because principle 5 was enforced from Step 1.

**Verify.** `grep -ri 'driftguard' . --exclude-dir=.git --exclude-dir=docs` returns nothing outside the two excluded evidence files. Every recorded external listing is updated. Old URLs redirect.

**Constraint note.** A blanket rename touches `ANCHOR.md`, which constraint 10 protects. Rename-time string substitution is *not* a decision revision and is authorised — but it is authorised by appending a section to the anchor recording the rename, its date, and its reason, in the same commit. Two files are excluded from the substitution entirely: `docs/NAMING.md` and `docs/RESEARCH_LOG.md` record other people's products and verbatim historical quotations, and rewriting them would destroy the evidence that justified the rename.

**Commit:** `step-07: rename`

---

### Step 8: Ship the wedge

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1 + Section 6
**Dependencies:** Step 7

**Task.** Execute the capture-plugin wedge MVP against its own anchor and build instructions, in its own repository. That build has its own routing file; this step only gates entry to it and confirms the proof gate cleared first.

**Verify.** The wedge's own validation checklist passes. It is installable by someone who is not the operator.

**Commit:** `step-08: wedge mvp shipped`

---

### Step 9: Pricing decision

**Model:** Opus-class
**Read from ANCHOR:** Section 1 + Section 6
**Dependencies:** Step 8

**Task.** Lock the pricing decision and record it as a **new section appended to `ANCHOR.md`**, per constraint 10. Do not edit Section 6. The new section states the decision, the date, the evidence it rests on, and what would reverse it.

**Verify.** The anchor has grown by one section. No existing section was edited. The decision cites observed signal, not projection.

**Commit:** `step-09: pricing decision recorded`

---

## Out of scope — do not build

A hosted service, an account system, telemetry, and anything requiring an API key to use the methodology (`ANCHOR.md` Section 6, constraint 7) — these convert DriftGuard into a harness and destroy its only durable advantage. Per-variant dashboards (Section 4) — the portfolio dashboard reads all repos from one page. A separate marketing website (Section 4) — the README is the marketing surface. A custom design system pass — placeholder tokens ship and are swapped when the selection chat's prerequisites exist. A watcher or unattended-mode implementation — harness-layer, captured in the research log as a template v2 provision, explicitly not built here.

**And, under constraint 8: no new variant is designed until the launch has shipped.** The July research scan surfaced several tempting candidates. Every one of them is the architect's trap wearing this quarter's costume.

---

## Operator quick reference

**First session.** `Read BUILD_INSTRUCTIONS.md and execute Step 0 (fill the session card), then Step 0.5 (process walkthrough). No build work before both pass.`

**Continuing.** Use the copy-paste prompt from the previous status report. Start a new session with the correct model if the model changed.

**Resuming after a break.**

```
Read BUILD_INSTRUCTIONS.md from the repo root. Identify the last completed
step from the git log (look for step-XX commits) and the current release
band. Read state/use-ledger.md for what was tried and what failed. Confirm
the previous band's proof gate cleared before advancing. Then execute the
next step.
```

**After a failed step.** Use the retry prompt from the failure report.

---

**End of file.**
