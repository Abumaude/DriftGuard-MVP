---
title: "[PROJECT NAME] — Build Instructions"
slug: "[project-slug]"
type: build-instructions
status: draft
version: 0.1
created: "[YYYY-MM-DD]"
updated: "[YYYY-MM-DD]"
anchor: ANCHOR.md
---

# [PROJECT NAME] — Build Instructions

## Routing document

_This file controls how AI agents execute the build. It references `ANCHOR.md` by section number. The agent reads this file first, then loads only the anchor sections named for the current step._

---

## How this file works

**Two gate steps run before any build work, in order.** Step 0 asks whether this should exist at all — no build action begins until the session card is filled and `ANCHOR.md` Section 1.0 holds a real name. Step 0.5 asks whether the design is actually complete — the whole process gets drawn and walked before a line is written.

They are deliberately separate questions. Step 0 can pass while Step 0.5 fails, and that is the useful case: a real product for a real person, with a process that quietly leaves somebody hanging.

Before executing any step, **read the named `ANCHOR.md` sections from disk** — do not rely on memory or on assumptions about what they contain. After completing each step, **run the validation checklist** (`ANCHOR.md` Appendix A) against your output. **Never modify `ANCHOR.md`** — if your implementation contradicts it, your implementation is wrong; if the anchor itself is wrong, append a section rather than editing one.

**The one-ship rule is a commit gate, governed by the cadence set in `ANCHOR.md` 1.0.** Under *every step*, a step cannot be committed until one exposure — carrying its band's feedback request — has reached the named person and the result is logged. A refactor does not count; a message sent, a page published, a link someone clicked, counts. Under *once per band* or *override-logged*, a step may commit without a ship only by recording a drift-log override with a one-line reason. Overrides are never blocked; they are logged.

After each successful step, **commit** with the message format `step-XX: description` and **append to the use ledger**. Then **output a status report and copy-paste prompt**. On failure, do not proceed — output a failure report and wait for the operator.

**Do not enter a new release band until the previous band's proof gate has cleared** — the band's signal was observed, not hoped for. This gate is non-overridable regardless of cadence.

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

_If EXPOSURE SHIPPED is N: under "every step" cadence the step is not done — resolve the shipment before committing. Under looser cadences, either resolve it or record a one-line drift override. Either way, the proof gate between bands still cannot be crossed without the band's signal._

### Copy-paste prompt (immediately after the status report)

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

Final step:

```
═══════════════════════════════════════════════
🏁 BUILD COMPLETE
═══════════════════════════════════════════════
All steps executed and verified.
Final commit: [hash or tag]
Repository: [URL]
═══════════════════════════════════════════════
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

The copy-paste prompt, including the retry prompt on failure, is mandatory. The operator relies on it to continue without re-reading this document.

---

## Model routing

_Which model runs which step. The logic: cheaper and faster for well-defined work; more capable for nuance, judgement, and adversarial reasoning._

| Steps | Model | Reason |
|---|---|---|
| [list] | **[Model A]** | [e.g. well-defined engineering tasks] |
| [list] | **[Model B]** | [e.g. nuanced authoring, adversarial verification] |

**Model switch protocol:** the operator manually starts a new session with the correct model. This file cannot switch models.

---

## Build sequence

_Step 0 runs once, before everything. The remaining steps are grouped into three release bands, and the gate between bands is a proof gate, not a date. One step per session; each self-contained._

### Step 0: Fill the session card (front gate)

**Model:** [Model]
**Read from ANCHOR:** Section 1, especially 1.0
**Dependencies:** none — the precondition for the whole build

**Task.** Copy the session card below into your working notes. Fill the `ANCHOR.md` 1.0 anchor sentence with a **real named person**, a result in their world, and an externally generated signal. If any slot is a fantasy, stop — there is no build yet. Set the current band (Prototype to start) and copy its feedback request and signal from the 1.0 ladder. Set the ship cadence. Name the single exposure the first step must produce, and the anti-scope.

**Verify.** All three anchor-sentence slots hold something real and named. Band, feedback request, and signal are in the session card. Cadence is chosen and written down.

**Commit:** `step-00: seed anchor sentence and session card`

```
=== SHIP OR DRIFT — SESSION CARD ===

ANCHOR (fill before producing anything)
- Outcome sentence: This exists so that ______ (a named person I can reach)
  can ______ (a change in THEIR world) and I'll know it worked when ______
  (a signal someone other than me generates).
- Ship cadence (set once): every step / once per band / override-logged
- Current release band: Prototype / MVP / v1
- Feedback request for this band: ______
- Signal that counts for this band: ______
- The ONE exposure this session must produce: ______
- Anti-scope (what I will NOT build yet): ______
- Time-box, not token-box: ______ hrs

AGENT MANDATE (only if an autonomous agent acts this session)
- Outcome the agent serves: ______
- May do unattended: ______
- Must propose for approval: ______
- Must never do (hard nos): ______

--- BUILD at full tilt ---

PROOF (fill before closing the session)
- Did something reach the named person?  Y / N
- Feedback request attached?  Y / N
- Signal observed (or its absence): ______
- Drift override (only if nothing shipped): [date] — shipped nothing because ______
- Next step / next band, set by that signal (not by my next idea): ______
```

---

### Step 0.5: Process walkthrough (closed-loop gate)

**Model:** [Model]
**Read from ANCHOR:** Section 1 + Section 3 (core loop and the actor loop closure table)
**Dependencies:** Step 0
**operator_review:** required   _[required | auto — default is required]_

**Task.** Render the full process from `ANCHOR.md` Section 3 as a wireframe diagram, Mermaid or ASCII. **Write no application code in this step.**

Then walk each actor's journey end to end, following every state change from trigger to outcome. Check every row of the Section 3.1 table: each state change must have an outcome-visibility path for the actor who initiated it.

**Critical:** a journey that ends without the actor learning the outcome is a **dead end**, and a dead end is a spec defect rather than a build task. Halt with a Failure Report naming the actor and the missing step. Do not fix it in code.

**Review mode.**

Under `operator_review: required` — output the diagram and the per-actor walkthrough, then **stop**. Do not start Step 1 until the operator approves. If they send corrections, apply them to the walkthrough and re-run this step.

Under `operator_review: auto` — self-check every journey and proceed only if all of them close. A dead end halts with a Failure Report either way; `auto` removes the approval wait, never the gate.

**Verify.** The diagram covers every actor and every state change named in Section 3. No blank cells anywhere in the 3.1 table. Approval received, or self-check passed.

**Commit:** `step-00b: process walkthrough approved`

_Why this is worth the delay: a drawing surfaces the missing step in minutes. Per-feature testing never does, because each feature genuinely works — it is the seam between them that is empty, and seams do not show up in unit tests._

---

### Prototype band — signal: a reaction from one named person

_Smallest steps that put something in front of one named person and provoke a reaction. Do not build MVP features here._

### Step 1: [Title]

**Model:** [Model]
**Read from ANCHOR:** Section 1 + Section [X]
**Dependencies:** Step 0, Step 0.5 (process walkthrough passed)

**Task.** [Task items.] **Critical:** the step ends with the Prototype-band exposure and its feedback request reaching the named person.

**Verify.** [Criteria], plus exposure shipped and feedback request attached.

**Commit:** `step-01: [description]`

---

### Step 2: [Title]

**Model:** [Model]
**Read from ANCHOR:** Section 1 + Section [X]
**Dependencies:** Step 1

**Task.** [Task items.]

**Verify.** [Criteria], plus exposure shipped and feedback request attached.

**Commit:** `step-02: [description]`

---

> **PROOF GATE — Prototype → MVP.** Do not start the MVP band until the Prototype signal (`ANCHOR.md` 1.0) has been observed from at least one named person. Quarantined metrics do not clear this gate. If it has not been observed, iterate within the Prototype band; do not advance.

---

### MVP band — signal: repeated or unaided use by a handful

_The smallest thing the named people can actually use, end to end. Each step still ships._

### Step 3: [Title]

**Model:** [Model]
**Read from ANCHOR:** Section 1 + Section [X]
**Dependencies:** Prototype proof gate cleared

**Task.** [Task items.]

**Verify.** [Criteria], plus exposure shipped and feedback request attached.

**Commit:** `step-03: [description]`

---

_[Continue MVP-band steps…]_

---

> **PROOF GATE — MVP → v1.** Do not start the v1 band until the MVP signal has been observed — the handful used it twice, or completed the core action unaided.

---

### v1 band — signal: payment or public adoption

_Harden, package, and put the paid or public offer in front of the audience._

### Step [N]: [Title]

**Model:** [Model]
**Read from ANCHOR:** Section 1 + Section [X]
**Dependencies:** MVP proof gate cleared

**Task.** [Task items.]

**Verify.** [Criteria], plus exposure shipped and feedback request attached.

**Commit:** `step-[NN]: [description]`

---

## Out of scope — do not build

_Features deliberately excluded, with the anchor sections they map to. Moving an item here is preferable to building it before its band's proof gate clears._

- [Feature] (`ANCHOR.md` Section [X]) — [why excluded, or which band if ever]

---

## Operator quick reference

**First session (seeding the repo)**

```
Save ANCHOR.md and BUILD_INSTRUCTIONS.md to the repo root.
Then read BUILD_INSTRUCTIONS.md and execute Step 0 (fill the session card),
then Step 0.5 (process walkthrough). No build work before both have passed.
```

**Continuing (same model).** Use the copy-paste prompt from the previous status report.

**Continuing (different model).** Start a new session with the correct model, then use the copy-paste prompt.

**Resuming after a break**

```
Read BUILD_INSTRUCTIONS.md from the repo root. Identify the last completed
step from the git log (look for step-XX commits) and the current release
band. Read the use ledger for what was tried and what failed. Confirm the
previous band's proof gate cleared before advancing. Then execute the next
step.
```

**Recovering from a failed step.** Use the retry prompt from the failure report.
