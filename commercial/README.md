# Commercial Trust Layer

A thin commercial governance layer for digital products. Adopted into this repo on 2026-07-31.

This is deliberately **not** a second operating system. DriftGuard remains the governing substrate. This folder adds the commercial rules and reusable surfaces that were missing: a constitution, an evidence ledger, an honest-disclosure pattern, product and funnel profiles, post-purchase outcome capture, and a lightweight measurement spec.

**One constitution. Many products. Many funnels. One accumulating reputation.**

Each product keeps its own funnel and commercial logic, but inherits the same non-negotiable standards.

## what's here

```
commercial/
├── HOW_TO_USE.md               start here — when each file is touched, and
│                               the prompt to paste when it is
├── COMMERCIAL_CONSTITUTION.md  20 rules. Held verbatim as received.
├── EVIDENCE_LEDGER.yaml        FILLED — 14 claims from the README, tiered.
├── PRODUCT_PROFILE.yaml        FILLED for DriftGuard.
├── FUNNEL_PROFILE.yaml         FILLED — free product, no purchase step.
├── HONEST_BOX_TEMPLATE.md      the blank pattern
├── GOVERNANCE_CHECKLIST.md     the blank pre-ship checklist
├── CHECKLIST_RUN_2026-07-31.md the first real run, including its failures
├── OUTCOME_CAPTURE.md          post-purchase standard (not yet in use)
├── MEASUREMENT_SPEC.md         four views, no single trust score
└── manifest.json
```

The filled Honest Box lives at [`../HONEST_BOX.md`](../HONEST_BOX.md) rather than in here, because it's a public surface and it should sit next to the README a reader actually lands on.

**New here? Read [`HOW_TO_USE.md`](HOW_TO_USE.md) first.** These are checkpoints, not documents to complete — eight of the ten do nothing until you are about to publish something, and the moments are what you learn rather than the files.

## status: ships as-is, adopt what you want

The constitution is held **verbatim as received**. It is published here as a resource, not as a rule imposed on anyone who forks this repo. Take all twenty rules, take three of them, or take none — that is your call, and the layer is designed to survive being partially adopted.

What it has already been used for, so you can judge whether it earns its place: it was run once against this repo's own README on 2026-07-31 and caught three things. The run, including what failed, is in `CHECKLIST_RUN_2026-07-31.md`. The filled `EVIDENCE_LEDGER.yaml`, `PRODUCT_PROFILE.yaml` and `FUNNEL_PROFILE.yaml` are worked examples of the templates rather than obligations — read them to see what a filled one looks like, then fill your own or don't.

## what this layer caught on day one

Three things in a README that had already been through an adversarial review pass earlier the same day. Recorded here because a governance layer that never catches anything is decoration, and the specifics are more useful than the claim.

**A synthetic example presented as evidence.** The before/after exchange showing an AI inventing a rate-limiting rationale is a constructed illustration. It shipped unlabelled, in the most persuasive position on the page, and it reads exactly like a logged transcript. Constitution §8 requires synthetic examples to be labelled. Now labelled, on both the README and the dashboard, and registered as SYN-001.

**A performance number with no measurement behind it.** "Twenty minutes, and about eleven of those are you thinking" — the eleven was invented precision and the twenty was an unmeasured estimate. Nobody outside the operator has ever filled in an anchor. Constitution §2 and §8 both bite. Both figures withdrawn; the claim sits QUARANTINED as CLAIM-002 with a note to restore a real number once somebody times a first run.

**Internal review reading as independent verification.** The repo carries "verified 2026-07-31" in a dozen places. All of it is one person and an AI assistant in one session. Constitution §16 requires that conflict to be visible rather than left to inference. Disclosed now in the README, the Honest Box, and at the top of the evidence ledger.

None of the three would have been caught by the earlier adversarial pass, which was checking for internal contradictions and broken logic. They're a different class of defect — each one internally consistent, individually defensible, and collectively the difference between a document that informs and one that persuades slightly beyond its evidence.

## how it runs

Before publishing anything commercial or public-facing, work `GOVERNANCE_CHECKLIST.md` and save the run alongside it with a date. Route through the specialist skills where relevant; the checklist lists the sequence. Don't build a Governor agent to reproduce it.

Two gates worth knowing about before you trip them:

**The dashboard gate** (`MEASUREMENT_SPEC.md`) says don't build a trust dashboard until a product is live, real events exist, fields have been captured consistently, and a manual review has already proved useful. This repo ships two dashboards, and neither is a trust dashboard — one is a product page, the other tracks launch work that genuinely exists. The gate is noted rather than breached, and it does bar the measurement dashboard that would otherwise be tempting to build next.

**The funnel gate** says create a funnel profile only when a product is genuinely being sold or distributed. Nothing here is sold. It's about to be distributed, so the profile exists at draft status with the empty stages left visibly empty rather than filled with plausible intentions.

## adoption sequence, for the next product

1. Ratify `COMMERCIAL_CONSTITUTION.md`.
2. Add an Honest Box to the live product page or README.
3. Enter every material public claim into `EVIDENCE_LEDGER.yaml`.
4. Create one `PRODUCT_PROFILE.yaml` per live product.
5. Create `FUNNEL_PROFILE.yaml` only when genuinely being sold or distributed.
6. Run `GOVERNANCE_CHECKLIST.md` before publishing.
7. Add outcome capture only once purchase or use begins.
8. Add dashboards only when the ledger holds enough real data to justify them.

## what this layer does not do

It doesn't replace DriftGuard. It doesn't create a monolithic AI "CEO". It doesn't require every product to use the same funnel. It doesn't treat honesty as an A/B-tested tactic, and it won't optimise a metric by weakening the constitution.

The specialist skills keep doing their specialist work — evidence validation, positioning, buyer qualification, perverse-incentive review, brand review, human voice. These files are the standard those tools enforce *against*.
