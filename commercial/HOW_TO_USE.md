# How to use these files

Nine files landed in this folder. Here's when each one actually gets touched, and the prompt to paste when it does.

## the frame

**These are checkpoints, not documents to complete.**

The instinct with a folder of templates is to sit down on a Sunday and fill them all in. That's the wrong shape, and it's the same failure the rest of this project exists to stop — producing structure as a substitute for shipping. Eight of the nine files do nothing at all until you're about to publish something.

What you're learning here is the *moments*, not the files. There are five of them.

---

## once, ever — ratify the constitution

Read the twenty rules in `COMMERCIAL_CONSTITUTION.md` and decide whether you actually accept them. It's the only item with no product attached, and everything else assumes it's done.

Don't read them as abstract principles. Make them concrete:

```
Read commercial/COMMERCIAL_CONSTITUTION.md. For each of the 20 rules, tell me
in one line what it would stop me doing that I currently do. Flag any I should
amend before I ratify.
```

You'll find two or three you don't want to give up. Those are the ones worth arguing with *before* you sign rather than quietly breaking afterwards. A constitution you've argued with and then accepted holds. One you skimmed and nodded at does not.

When you've decided, record it as an appended section in `../ANCHOR.md` — Section 8, since Section 7 already records the adoption. Not as an edit to the constitution file, and not as a line in this one. Ratification is an act, and acts get recorded where the project's other constitutional decisions live.

Until that happens, `PRODUCT_PROFILE.yaml` and `FUNNEL_PROFILE.yaml` both read `DRAFT — not operator-ratified`, which is accurate rather than pedantic.

---

## once per product — profile, then honest box

`PRODUCT_PROFILE.yaml` is your private working record. `HONEST_BOX.md` is the public face of it. Fill the profile first, because the box then falls out of it almost mechanically — the `not_for`, `material_limitations` and `known_failure_modes` fields are most of the box already.

Leave fields genuinely empty when you don't know. An empty field is information; a plausible-sounding guess is a lie you'll later believe. The filled DriftGuard profile has `time_to_first_value` blank with a note explaining why, and that blank is more useful than a number would have been.

For the box:

```
Read commercial/PRODUCT_PROFILE.yaml and commercial/HONEST_BOX_TEMPLATE.md.
Draft an Honest Box for [product]. Then run the anti-theatre test on your own
draft and tell me which limitations could genuinely cost me a sale — if none
of them could, redo it.
```

That last clause is doing the real work. A disclosure page listing only harmless flaws is worse than no page at all, because it buys trust it hasn't earned and a competent competitor will notice. The test is in the template; the discipline is running it against your own draft rather than admiring it.

The box goes at the **root of the product's repo**, not in this folder, and it gets linked from wherever a reader actually lands. Buried in an appendix it isn't disclosure, it's filing.

**The funnel profile waits.** Create one only when something is genuinely being sold or distributed. Before that you're writing intentions and calling them a plan.

---

## every factual sentence you publish — a ledger entry

This is the expensive rhythm and the one you'll skip first, usually at 11pm while writing a launch post.

```
I'm about to publish [asset]. Extract every material factual claim from it.
For each one, tell me what evidence I actually have, assign a tier
(CONFIRMED / VERIFY / QUARANTINED / DERIVED), and write the ledger entry.
Flag anything where my wording exceeds my evidence.
```

The tiers matter more than they look. **QUARANTINED is not a failure state** — it's permission to keep a claim visible while being honest that it isn't sourced yet. That's how the two unverified rows survived in the README instead of being either silently deleted or silently asserted. Both of those would have been worse.

Two habits that make the ledger work rather than rot:

*Log the small ones.* CLAIM-013 in the filled ledger is a star count justifying a style choice — trivial, low stakes, logged anyway. A ledger that only holds important claims teaches you to decide what's important, which is exactly the judgement you can't trust yourself on at 11pm.

*Log the synthetic examples too.* The register at the bottom of `EVIDENCE_LEDGER.yaml` exists because the most persuasive thing in the README turned out to be a made-up illustration that read like a transcript. Anything you invent to explain a point gets an entry and a visible label.

---

## every material publish — run the checklist, save the run

```
Run commercial/GOVERNANCE_CHECKLIST.md against [asset]. Report failures before
passes. Save the run as commercial/CHECKLIST_RUN_[date].md.
```

Failures before passes is not a stylistic preference. A checklist run that opens with what passed gets read approvingly and acted on never.

Save every run with its date. The accumulating file list is the actual instrument — one clean run means nothing, three consecutive clean runs means something (see the failure mode below).

The checklist routes through the specialist skills rather than replacing them; the sequence is at the bottom of the file. Don't build a Governor agent to reproduce it.

---

## after people start using it — outcome capture

`OUTCOME_CAPTURE.md` switches on when purchase or real use begins, not before. Its core discipline is that a transaction isn't complete when payment clears — it closes when you know one of four things: useful outcome, informed non-use, fair refund, or unresolved failure logged for correction.

The part most people get wrong is testimonials. Satisfaction does not automatically become a quotable endorsement; that needs explicit consent recording exact approved wording and approved channels. Turning a warm support message into a landing-page quote without asking is the most common version of this failure and it's a §8 breach.

---

## every quarter, once something is live — the measurement review

Eight questions in `MEASUREMENT_SPEC.md`, four views, and deliberately **no single trust score**. The absence is the design: one number invites optimisation, and optimising a trust number is how you corrupt the thing you were trying to observe.

---

## two gates worth knowing before you trip them

**The dashboard gate.** Build no trust-measurement dashboard until a product is live, real events exist, fields have been captured consistently, and manual review has already proved useful. This repo already ships two dashboards, and neither is a trust dashboard — one is a product page, the other tracks launch work that genuinely exists. The gate still bars the metrics dashboard, which is the tempting one. Worth remembering, because "we already have dashboards" is exactly the reasoning that would let it through.

**The funnel gate.** Covered above. No funnel profile until something is genuinely sold or distributed.

---

## your first week, concretely

Ratify the constitution — twenty minutes, and it unblocks everything else.

Fill one product profile for whatever is closest to live. Leave the unknowns blank.

Draft the Honest Box from that profile, run the anti-theatre test, and put it where a reader lands rather than where it's tidy.

Run the checklist once against your most public asset, and save the run even if it's ugly. Especially if it's ugly.

Then stop. Outcome capture, the funnel profile and the quarterly review all wait for real events, and building them early is the same trap in a different costume.

---

## the failure mode

**This layer becomes decoration the moment three consecutive checklist runs come back clean.**

Section 7.6 of `../ANCHOR.md` already commits to cutting it back to the constitution and the evidence ledger alone if that happens. Governance that never catches anything is cost pretending to be discipline, and keeping it out of habit is its own species of drift.

The counter-evidence, for now: the first run caught three real defects in a README that had already survived a thirty-six-defect adversarial review earlier the same day. A synthetic example presented as evidence, an unmeasured number stated as a measurement, and internal review carrying an implication of independence. Each internally consistent, each individually defensible, and collectively the gap between informing and persuading slightly past the evidence.

That's the class of defect this layer exists to catch. When it stops finding them, cut it.
