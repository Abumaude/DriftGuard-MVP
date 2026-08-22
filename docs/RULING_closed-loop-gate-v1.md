# RULING — Closed-Loop Gate

**Status:** CURRENT — v1 — RATIFIED 2026-08-22

Every DriftGuard ANCHOR must include an Actor Loop Closure table in its Core Loop section (Section 3.1). Every BUILD_INSTRUCTIONS must open with a Process Walkthrough gate — render the full process as a Mermaid/ASCII wireframe, walk each actor's journey end to end, and check every state change has an outcome-visibility path for its initiating actor.

The walkthrough carries an `operator_review` flag:
- `required` (default) — the agent halts and presents the wireframe for operator approval before the first build step.
- `auto` — the agent self-checks and proceeds only on pass.

Any dead end halts with a Failure Report regardless of mode.

Appendix A gains a NO DEAD ENDS item, run after every step.

A dead-end journey is a spec defect, caught at the gate, never at build time.

**Scope:** Applies to master templates and all future variants. Existing variants adopt on next touch.

**Origin:** Factory chat, 2026-08-22. Prompted by a member's app where submissions and admin approval worked but the submitter had no way to learn the approval outcome — discovered after hours of build. Lesson: draw the whole process before building; the missing step shows up in the drawing.

**Amendment history:** v1 amended pre-ratification to add the human-in-the-loop `operator_review` flag (operator request).

---

## Numbering note for this repo

The ruling says the walkthrough is "Step 0". In this repo's template lineage Step 0 is already taken by the ship-or-drift front gate, so the walkthrough runs as **Step 0.5**, immediately after it and before any build work.

The order is deliberate rather than a workaround. Step 0 asks *should this exist at all* — is there a named person and a real signal. Step 0.5 asks *is the design actually complete* — does every actor's journey close. There is no point drawing the process for a product with no named person, and both questions have to pass before a line gets written.

Commit messages: `step-00` for the session card, `step-00b` for the walkthrough.
