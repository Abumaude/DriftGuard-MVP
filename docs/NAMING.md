---
title: Naming — provisional status, collision evidence, rename procedure
slug: naming
type: decision-record
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
---

# Naming

**Short version.** "DriftGuard" is provisional. It ships anyway. The GitHub organisation name is already taken, so this repository publishes under a different organisation name and every public surface carries a one-line provisional note. A rename is a planned future operation, not a crisis, and this file contains the procedure that makes it cheap.

---

## Why publish under a contested name at all

Because the alternative is worse. The May 2026 launch playbook recorded the naming problem and recommended publishing provisionally with a note, running the rebrand as a separate scoped operation afterwards. That recommendation stands, for a reason that has not changed: the cost of a rename later is a find-and-replace across a small number of markdown files and a GitHub organisation transfer. The cost of not launching is another quarter of an unpublished methodology while the category consolidates around other people's tools.

Naming is reversible. Missing the window is not.

The condition attached to that judgement is that the provisional status must be visible rather than hidden. A project that quietly uses a contested name looks careless when someone finds the collision; a project that says "this name is provisional and here is why" looks like it did the search. The note is not an apology. It is evidence of the same discipline the methodology is selling.

---

## The evidence, verified 2026-07-31

| What | Where | State on 2026-07-31 | Consequence |
|---|---|---|---|
| GitHub organisation `DriftGuard` | github.com/DriftGuard | **Taken and in use.** GitOps configuration drift-detection platform, Go + Python, updated 22 June 2026. Second repo of Kubernetes demo manifests. Single-digit stars, ~59 commits, no releases. | **Hard blocker.** The org name cannot be created. Publish under an alternative. |
| `driftguard.app` | driftguard.app, Google Play, Steam | **Shipped consumer product.** VestraCode's "DriftGuard: Maintenance Tool", a gamepad stick-drift utility. Listed on two storefronts with its own marketing site. | The `.app` domain is gone and the name carries a consumer-hardware association in search. |
| `kiplangatkorir/driftguard` | github.com | **Active library.** Monitoring machine-learning model performance and drift. | Third collision, in an adjacent technical field. Worsens disambiguation. |

Three products, three adjacent categories, one shared name, and the exact organisation name required is held by one of them.

## Why this matters more than ordinary brand congestion

The distribution thesis in this project's own strategy documents rests on two mechanisms: being findable through high-intent search language, and being *recommended by AI assistants that read specifications and comparisons*. Both mechanisms degrade badly under name collision.

A search engine can be beaten with better content over time. An assistant asked "what should I use to stop my AI project drifting?" is performing a disambiguation task before it performs a recommendation task, and three same-named products in overlapping technical territory is close to the worst possible input for that task. The name does not merely fail to help — it actively costs, in exactly the channel the strategy is betting on.

That is the argument for treating the rename as a scheduled operation with a date rather than an open thread. It is not an argument for delaying the launch by one day.

---

## Shortlist and selection criteria

No name is selected here. Selection is a separate factory chat with its own anchor. What this file fixes is the criteria, so the later chat starts from a standard rather than from taste.

A candidate must clear all five. The GitHub organisation name must be free — this is the constraint that killed the incumbent and it is checked first, not last. The `.dev` or `.io` domain must be available, with `.com` preferred but not required. No product in AI tooling, developer tooling, ML operations, or consumer hardware may already hold the name; the current situation is the direct result of skipping this check. The word must survive being spoken aloud in a podcast and typed from memory afterwards. And it must not describe a *mechanism* that could be superseded — naming the thing after "drift" bound the project to a word that three other products and now at least one GitHub command also use.

That last criterion is the real lesson. A name describing what the user gets, or a name that is simply a distinctive word, ages better than a name describing the failure mode being prevented — because failure-mode language is exactly the language every competitor in the category reaches for.

---

## Rename procedure

The bundle is built so that a rename is one pass. This is deliberate: a rename that is expensive never happens, and an open naming thread quietly taxes every future decision.

**Every occurrence of the product name in this repository is either the literal string `DriftGuard` or the lowercase slug `driftguard`.** There are no stylised variants, no hyphenated forms, and no name text baked into images. Both dashboards read the product name from a single `PRODUCT` constant declared at the top of their script block, so the rendered UI follows the constant rather than needing markup edits.

When the new name is chosen:

```bash
# Two files are excluded from substitution, deliberately:
#   NAMING.md       — this file records OTHER people's products. A blanket
#                     replace would rewrite the collision table below into
#                     "github.com/NewName", destroying the evidence that
#                     justified the rename in the first place.
#   RESEARCH_LOG.md — append-only, and it quotes historical copy verbatim.
EXCL="--exclude-dir=.git --exclude=NAMING.md --exclude=RESEARCH_LOG.md"

# 1. Case-sensitive replace, both forms. -r stops xargs from running sed with
#    no arguments when grep matches nothing; -d '\n' survives paths with spaces.
grep -rl 'DriftGuard' . $EXCL | xargs -r -d '\n' sed -i 's/DriftGuard/NewName/g'
grep -rl 'driftguard'  . $EXCL | xargs -r -d '\n' sed -i 's/driftguard/newname/g'

# 2. Confirm nothing survived outside the two excluded files.
grep -ri 'driftguard' . $EXCL

# 3. Rename the GitHub organisation (GitHub redirects the old URLs automatically),
#    or transfer the repositories to a new org if the old one must be abandoned.

# 4. Remove the provisional-name note from README.md and from both dashboards.

# 5. Append a section to ANCHOR.md recording the rename, its date, and its
#    reason. Constraint 10 protects the anchor from edits; rename-time string
#    substitution is not a decision revision, but it is only authorised
#    alongside the section that records it, in the same commit.
```

Step 2 is not optional. A half-completed rename is worse than no rename, because it produces a project that appears under two names in search at once. Step 5 is what keeps the substitution inside the methodology rather than an exception to it.

**Before the rename runs**, check whether any external link has accumulated — a Show HN post, a directory listing, a Substack piece. GitHub's redirect handles repository URLs; it does not handle a directory entry that hardcoded the old name in body text. Keep a list of every place the name was published, starting from the first launch post. `docs/LAUNCH_CHECKLIST.md` carries that list.

---

## What ships now

The public surfaces carry this line, or close to it:

> **On the name.** DriftGuard is a provisional working name. At least three unrelated products already use it, including one holding the `DriftGuard` GitHub organisation. A rename is planned; the methodology and the file formats are unaffected by it, and every URL will redirect.

Short, factual, no apology, and it pre-empts the discovery rather than waiting to be caught by it.

---

**End of file.**
