---
title: The Thursday Brief — Build Instructions
slug: thursday-brief
type: build-instructions
status: active
version: 1.1
created: 2026-06-02
updated: 2026-07-14
anchor: ANCHOR.md
---

# The Thursday Brief — Build Instructions

_A worked example. Note that "build" here means producing and sending issues — there is no code, no repository beyond a folder of markdown, and no deploy. The machinery is identical anyway._

---

## How this file works

Read this file first. Then load only the `ANCHOR.md` sections a step names.

Never modify `ANCHOR.md`. If a decision in it turns out to be wrong, append a section — Section 6 is an example of exactly that.

**Cadence is *every step*** (`ANCHOR.md` 1.0). **The unit here is the weekly loop, not each numbered step inside it** — Steps 1 to 6 are one pass, and Step 5 is the exposure that makes the pass complete. This is stated rather than assumed because the alternative reading (six exposures a week to the same reader) is absurd, and a cadence rule that is quietly bent in practice is worse than one that is honestly scoped in writing. A week that ends without Step 5 is a drift override and gets its line in `state/use-ledger.md` with a reason.

Commit with `step-XX: description` and append to the ledger in the same commit. Yes, for a newsletter. The commit history is what makes "when did I decide the five-item cap and why" answerable in November.

---

## Model routing

| Steps | Model | Reason |
|---|---|---|
| 1, 2 | **Sonnet-class** | Source sweeping, extraction, verification against primary pages |
| 3, 4 | **Opus-class** | Triage and drafting — deciding which five of forty items matter is the actual product, and it is judgement |
| 5 | **none** | Sending is a human action |
| 6 | **Sonnet-class** | Logging what came back, including silence |

Triage never runs on the cheap model. The whole product is the filtering; economising there is economising on the only thing anyone is paying attention for.

---

## Weekly sequence

### Step 0: Fill the session card (once, at the start)

**Read from ANCHOR:** Section 1
**Status:** completed 2026-06-02

Gate cleared: Priya Raghunathan, named and reachable. Cadence: every step. Band at time of filling: Prototype.

---

### Step 0.5: Process walkthrough (once, at the start)

**Read from ANCHOR:** Section 1 + Section 3.1
**Status:** completed 2026-08-22, late — and it should have run in June.

Ran the loop-closure table and found two dead ends. The serious one: the MVP proof gate is "someone forwards an issue unprompted", and there was no way to detect a forward. Six issues had already gone out waiting on a signal that could not reach me.

Fixed in the spec (Section 3.1), not in code — one added sentence in the closing line of each issue, plus a same-day acknowledgement for new subscribers.

Worth noting for anyone reading this as an example: running the gate in June would have cost twenty minutes and saved six weeks of waiting on an invisible signal.

---

### Step 1: Sweep (Monday)

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1 + Section 3

**Task.** Sweep the four source groups in Section 3 for anything published in the last seven days. Extract every candidate into the item schema in Section 2, with all five fields populated. Do not filter yet — over-collect deliberately, because filtering with the full set visible is a different and better judgement than filtering as you go.

**Verify.** Every candidate has all five fields. Every source link resolves to a primary page, not a summary of one (constraint 8).

**Commit:** `step-01: sweep week-NN`

---

### Step 2: Verify sources (Monday)

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1.2

**Task.** Open every source link a second time and confirm the claim against the page. This is the second of the two checks constraint 8 requires, and it is separated from Step 1 on purpose: verifying in the same pass as extracting means verifying against your own memory of what you just read, which is not verification.

Flag anything where the primary source says something narrower than the summary that surfaced it. That gap is the most common failure mode and the one that would end the newsletter's usefulness.

**Verify.** Every item's claim is confirmed against its primary source. Confidence field set correctly — `certain` only for enacted changes.

**Commit:** `step-02: verify week-NN sources`

---

### Step 3: Triage to five (Tuesday)

**Model:** Opus-class
**Read from ANCHOR:** Section 1 + Section 2 + Section 4

**Task.** Cut to a maximum of five items (constraint 9). Rank by consequence to a practice of Priya's size and shape, not by how interesting the change is.

If nothing this week affects anyone, say so and produce a three-line issue. Constraint 10 makes this mandatory, not optional, and it is the step most likely to be quietly violated — the temptation to pad a thin week is strong and it is exactly how trust erodes.

**Verify.** Five items or fewer. Every survivor states who is affected as a filter the reader can apply to their own book. Every item cut is logged with one line on why, because the cuts are where the product's judgement actually lives and a future session should be able to see it.

**Commit:** `step-03: triage week-NN`

---

### Step 4: Draft and cut (Wednesday)

**Model:** Opus-class
**Read from ANCHOR:** Section 2 + Section 4

**Task.** Write the issue. Subject line names the single most consequential change — no curiosity gaps, no "you need to know," nothing that fails constraint 7.

Then cut. Target: an issue that took ninety minutes to research and takes eleven minutes to read.

Attach the current band's feedback request from the 1.0 ladder as the closing line.

**Verify.** Run the full Appendix A checklist. Read the subject line aloud and apply the constraint 7 test — would I be comfortable seeing this quoted back to me. Apply principle 3 — could Priya forward this to a client unedited.

**Commit:** `step-04: draft week-NN`

---

### Step 5: Send (Thursday 07:00)

**Model:** none — this is a human action
**Read from ANCHOR:** Section 1.0

**Task.** Send. Attach the band's question.

**Verify.** Sent. Question attached. This is the step. Everything before it is preparation, and preparation that does not end here is the failure mode the whole methodology exists to prevent.

**Commit:** `step-05: send week-NN`

---

### Step 6: Log (Friday)

**Model:** Sonnet-class
**Read from ANCHOR:** Section 1.0

**Task.** Append to `state/use-ledger.md`: what was sent, what came back, and what did not come back. **Silence is data and gets logged as such** — "issue 5, no replies" is a line, and three of those in a row is a signal that outranks any open rate.

Check whether the current band's proof gate has cleared. Do not advance on a maybe.

**Verify.** Ledger line appended. Gate status stated explicitly, either "not cleared" or with the evidence.

**Commit:** `step-06: log week-NN`

---

> **PROOF GATE — Prototype → MVP.** Cleared 2026-06-12. Priya replied to issue 1 within the hour, said the Companies House item changed what she did that week and the other three were noise. That reply produced constraint 9.

> **PROOF GATE — MVP → v1.** Not cleared. Requires a forward I did not ask for. Open rate, subscriber count, and replies saying "great issue" do not clear it — see the quarantined metrics list in `ANCHOR.md` 1.0.

---

## Out of scope — do not build

A website (until v1). A logo. A content calendar beyond next week — the loop is weekly for a reason, and a twelve-week calendar is a plan for a newsletter that does not exist yet. Social accounts. Anything in the permanent out-of-scope list in `ANCHOR.md` Section 5.

---

## Operator quick reference

**Weekly start.**

```
Read BUILD_INSTRUCTIONS.md and ANCHOR.md Section 1. Execute Step 1
for this week.
```

**After a missed week.**

```
Read BUILD_INSTRUCTIONS.md and state/use-ledger.md. Find the last
step-XX commit and the current band. Log the miss as a drift override
with a reason before resuming.
```

The override line is not a punishment. It is the mechanism — one missed week is a week, and four in the ledger is a pattern you can see instead of a feeling you can argue with.
