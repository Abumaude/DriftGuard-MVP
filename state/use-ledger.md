# Use ledger

Append-only. What was tried, what came back, what was skipped and why.

This is procedural memory — the third of the three memory types (`ANCHOR.md`
Section 2). `ANCHOR.md` holds stable knowledge, `BUILD_INSTRUCTIONS.md` holds
status, and this file holds what actually happened, including the failures.
It is the file a future session reads to avoid repeating a dead end.

**Rules.** Append, never edit. One line per event minimum. **Silence is an
entry** — "sent, no reply" is data, and three in a row is a signal. Every drift
override lands here with a date and a one-line reason; the accumulating list is
the mechanism, not a locked door.

**Format:** `YYYY-MM-DD | step or event | what happened | outcome`

---

## 2026-07

```
2026-07-31 | pre-launch scan | Re-verified every load-bearing claim in the May
             positioning before publishing. | Three claims retired: the June 15
             Anthropic billing split (cancelled), anchor-as-constitution as
             distinctive territory (Spec Kit shipped /speckit.constitution), and
             the DriftGuard GitHub org as available (taken and active). Full
             detail in docs/RESEARCH_LOG.md.

2026-07-31 | naming | Verified three live collisions on the DriftGuard name:
             the GitHub org, VestraCode's gamepad utility on two storefronts,
             and an ML drift-monitoring library. | Org name unavailable — the
             May playbook's Phase 0 step 1 cannot execute as written. Publishing
             proceeds under an alternative org with a provisional-name note.
             Procedure in docs/NAMING.md.

2026-07-31 | verification gap | Scope Lock (Ktulue) could not be surfaced by
             search, despite being prominently recommended in README v2 and the
             weekend publishing plan. | Marked UNVERIFIED rather than dropped.
             Blocking pre-flight item; Step 2 of BUILD_INSTRUCTIONS resolves it
             either way. Weak evidence — a failed search is not a finding — but a
             named public recommendation is a claim we would be held to.

2026-07-31 | repo assembled | Master repo bundle built: README v3, self-applied
             anchor, launch build sequence, templates, one non-code worked
             example, both dashboards, research log, positioning delta, naming
             record, launch checklist. | Not yet published. Gate is closed.

2026-07-31 | GATE | ANCHOR.md Section 1.0 anchor sentence has no named person.
             | CLOSED. No build action past Step 0 permitted. Published closed
             on purpose — a governance methodology that waives its own front
             gate has lost the argument before it starts. Operator action
             required.
```

---

## 2026-08

```
2026-08-22 | ruling adopted | RULING_closed-loop-gate-v1 ratified and applied:
             actor loop closure table in both templates and this anchor, Step 0.5
             process walkthrough in both build files, NO DEAD ENDS added to both
             validation checklists. | ANCHOR Section 8 appended — second section
             added since the anchor was written, no existing section edited.

2026-08-22 | gate run on ourselves | Ran the loop-closure table against the
             launch process. | TWO DEAD ENDS FOUND. Anyone filing an issue or
             opening a PR entered an untracked queue with no stated way to learn
             what happened. Fixed in the spec: CONTRIBUTING.md and the issue
             templates now state that every issue gets a reply or a close with a
             reason, and that feedback which changes the product gets a ledger
             line citing the issue number.

2026-08-22 | gate run on the worked example | Ran the same table against the
             Thursday Brief example. | WORSE DEAD END FOUND. Its MVP proof gate
             is "someone forwards an issue unprompted" and there was no way to
             detect a forward — the signal the band transition depends on was
             invisible to the operator. Six issues had gone out waiting on it.
             Fixed in the spec, and left visible in the example because it is a
             better teaching case than anything invented.
```

---

## Template for future entries

```
YYYY-MM-DD | step-NN | what was attempted | what came back, including silence

YYYY-MM-DD | drift override | shipped nothing because ______
```

---

## Standing count

**Drift overrides logged: 0.**

**Scope note, so that count is not read as a dodge.** The bundle-assembly entry
above records real work done while the gate was closed, and constraint 3 requires
an exposure per step. No override is logged against it because assembly is
**Step-0 scope** — preparation whose entire output *is* the artefact the named
person will be shown, and which cannot ship to a named person because no named
person has been chosen. That is exactly the state the closed gate describes. The
first entry that can incur an override is Step 1.

If this number starts climbing after Step 1, the architect's trap has reopened,
and the correct response is to shrink the next step until it can ship rather than
to argue with the log.
