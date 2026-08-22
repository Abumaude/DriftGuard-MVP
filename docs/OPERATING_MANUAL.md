---
title: Operating manual — running this repo day to day
slug: operating-manual
type: reference
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
---

# Operating manual

A repo full of files landed in your hands and most of them you will never open again. This is which ones you actually touch, when, and what to paste.

_(An earlier draft opened with a file count. It was wrong, then it was replaced with a different wrong count. Derived numbers do not belong in prose — `scripts/verify.sh` now fails the build if one reappears.)_

## the repo serves three different readers

Sorting the files by *who reads them* explains the whole layout, and it's the thing nobody infers from a file list.

**A stranger evaluating the method** reads `README.md`, `HONEST_BOX.md`, `GLOSSARY.md`, and maybe the worked example. That's it. Four files, and they're the only ones written to persuade anybody of anything.

**You, running the launch** read `BUILD_INSTRUCTIONS.md` and `state/use-ledger.md`, plus `docs/LAUNCH_CHECKLIST.md` when you're publishing. Everything else in `docs/` is reference you consult when a specific question comes up, not reading you do in order.

**An AI agent working in here** reads `AGENTS.md`, then `BUILD_INSTRUCTIONS.md`, then whichever `ANCHOR.md` sections the current step names. You never need to explain the repo to it; that's what `AGENTS.md` is for. Claude Code picks up `CLAUDE.md` on its own, which points at the same two files.

`ANCHOR.md` sits underneath all three and is read by all of them, in different amounts.

---

## your actual daily loop

Four things, in this order, every working session.

**Open a session.** Paste this and nothing else:

```
Read BUILD_INSTRUCTIONS.md and AGENTS.md from the repo root. Find the last
step-XX commit in the git log and read state/use-ledger.md. Tell me which
step is next, which ANCHOR sections it loads, and which model it wants —
then stop and wait.
```

The "stop and wait" matters. Without it you get a session that reads the files and immediately starts doing the step, which removes your chance to notice it picked the wrong one.

**Run the step.** Switch model if the step says so — `BUILD_INSTRUCTIONS.md` has the routing table, and the reason Opus-class steps are Opus-class is judgement, not difficulty. Then:

```
Execute Step [N]. Read ANCHOR.md Section 1 plus Sections [X] first.
```

**Close the step.** The step isn't done when the work is done. It's done when an exposure has reached your named person with the band's question attached, per the cadence in `ANCHOR.md` 1.0. If nothing shipped, you either fix that or write the override line. Both are fine; pretending is not.

**Verify before you push.** `./scripts/verify.sh` — tracker graph, seed drift, every relative link, and any derived count that has crept into prose. Ten seconds, and it catches the class of defect that reads as authoritative and is simply wrong.

**Log it.** One line in `state/use-ledger.md`, one commit as `step-XX: description`, both in the same commit. Silence counts as an entry — "sent, no reply" is data, and three in a row is a signal you can see rather than a feeling you can argue with.

---

## the file-by-file, when-do-I-touch-it

**`ANCHOR.md`** — read Section 1 every session. Never edit it. When something changes, append a section; Section 7 is the worked demonstration of exactly that. If you find yourself wanting to edit an existing section, that impulse is the thing the rule exists to stop.

**`BUILD_INSTRUCTIONS.md`** — read first, every session. It's the only file that tells you what to do next.

**`state/use-ledger.md`** — append at the end of every session. It's the file that answers "why is it like this?" in November, and the one that quietly stops being updated first.

**`docs/LAUNCH_CHECKLIST.md`** — the operational sequence for going public. Work it top to bottom when you're actually launching. Three items are marked BLOCKING.

**`docs/RESEARCH_LOG.md`** — append-only, with verification dates. Add an entry whenever you learn something about the sector that changes a decision. Read the July scan before you write any public post.

**`docs/POSITIONING.md`** — open it before you write anything public-facing. Part 2 is eight objections with answers already drafted, so a Hacker News reply at 2am matches what the README says.

**`docs/NAMING.md`** — open when you rename. Contains the procedure and the two files excluded from the find-and-replace.

**`docs/RULING_closed-loop-gate-v1.md`** — read once, then it lives in the templates. It is the rule behind Step 0.5 and the actor-loop-closure table.

**`docs/FAQ.md`**, **`GLOSSARY.md`**, **`docs/METHOD_repo-intro-register.md`** — reference. The method file is the house style for every future variant README, so open it whenever you write one.

**`templates/`** — you don't use these. They're what other people copy. You'd only touch them after watching somebody stall on one.

**`examples/worked-example/`** — send this to people who ask what a filled anchor looks like. Deliberately not a code project.

**`commercial/`** — see `commercial/HOW_TO_USE.md`. Different rhythm entirely: those files sit idle until you're about to publish something.

---

## the dashboards

`docs/index.html` is the public product page. `docs/tracker.html` is your instrument.

**To change what either shows, edit `docs/data/tracker.json` — never the HTML.** The dashboards read that file, and both carry an embedded copy as an offline fallback. Two fields are computed, not written: `blocks` is derived from every other item's `blockedBy`, and `status` follows the rule stated in the file's own `statusRule` key. Edit `blockedBy` and let the other two follow.

If you hand-edit `blocks`, nothing breaks visibly and the graph silently desynchronises, which is the worst kind of failure. Easiest safe move is to ask:

```
Add an item to docs/data/tracker.json: [description]. Recompute blocks and
status from blockedBy per the statusRule, then regenerate the embedded seed in
docs/tracker.html so the two cannot diverge. Confirm the graph is symmetric
and acyclic.
```

Both files work by double-clicking — no server, no build step. That's deliberate, and a change that breaks it should be rejected even if it's otherwise an improvement.

---

## coming back after a break

The whole point is that this works cold. Paste:

```
Read BUILD_INSTRUCTIONS.md, ANCHOR.md Section 1, and state/use-ledger.md.
Find the last step-XX commit. Tell me: which step is next, which band we're
in, whether the previous band's proof gate actually cleared, and what the
ledger says was already tried and failed. Do not start the step.
```

The proof-gate question is the one that matters after a gap. Coming back keen and skipping straight into the next band is how the previous twenty projects went.

---

## what to do first, tonight

Three items are unblocked. Everything else waits behind them.

Fill the gate in `ANCHOR.md` 1.0 — a real person's name, not a category. This is the single highest-leverage thing in the repo and it takes five minutes of discomfort rather than five minutes of work.

Pick a GitHub org name using the criteria in `docs/NAMING.md`. Check availability first, since that's the constraint that killed the obvious choice.

Run the Step 0.5 process walkthrough. Two dead ends are already recorded in `ANCHOR.md` 8.4 and fixed in the spec — confirm them, then look for a third.

Then work `docs/LAUNCH_CHECKLIST.md`.

---

## what not to do

Don't fill in the whole anchor before building anything. Sections 1.0 and 1.1, then go. The rest gets filled as the build reaches it, and a fully-specified anchor for an unbuilt product is fiction that will be ignored within a fortnight.

Don't skip Step 0 because the gate feels like a formality. It's the one rule whose violation caused the failure this project exists to correct.

Don't skip Step 0.5 either. Drawing the process takes minutes; finding a dead end after building around it takes hours, which is the whole reason the rule exists.

Don't advance a band on a maybe. The proof gates are the one thing no cadence setting and no override can cross.

Don't start a new variant while an unshipped one exists — constraint 8, and the rule you'll break first.

Don't let the ledger lapse. It's invisible when it stops and expensive when you need it.

---

## if you only remember one thing

`BUILD_INSTRUCTIONS.md` tells you what to do next. `ANCHOR.md` tells you what you're not allowed to do. The ledger tells you what already went wrong.

Everything else in this repo is either for a stranger or for a machine.
