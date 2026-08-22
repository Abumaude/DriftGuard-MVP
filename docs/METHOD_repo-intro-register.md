---
title: Method — repo intro register
slug: repo-intro-register
type: method
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
---

# Method: repo intro register

The house style for every DriftGuard README — master and variants. Derived from the Karpathy repos (llm.c, llama2.c, nanoGPT, nanochat), which between them carry well over 200k stars with no marketing spend and no design system. Applied to the master README on 2026-07-31; apply to each variant README as it publishes.

The point of writing it down is that variant READMEs get produced in separate chats, and without this file each one drifts into whatever register that session happened to reach for. Which would be, fairly precisely, the thing this project exists to prevent.

## The eleven moves

**1. Open with what it is and what it does *not* need.** llm.c: "LLMs in simple, pure C/CUDA with no need for 245MB of PyTorch or 107MB of cPython." The negation carries the positioning. Ours: "three markdown files, with no need for a CLI, an account, a server, a database, or a single API call." This is reverse benchmarking compressed into one sentence — name the incumbent's weight, in their units.

**2. Quick start before philosophy.** Non-negotiable, and the most commonly violated. A reader who wants the origin story will scroll for it; a reader who wants to try the thing will leave. Karpathy puts runnable commands in the first screen of every repo. Origin stories go below the fold.

**3. Show, never describe.** The single biggest upgrade to the master README was replacing "the AI confidently invents reasons" with an actual two-turn exchange showing it happening, and the same exchange with an anchor present. Karpathy pastes real terminal output, real generated samples, warts included. A description of behaviour is an assertion; a transcript is evidence.

**4. Concrete numbers, always.** ~1,000 lines. 700-line C file. $48. ~2 hours. 110 tokens/s. Ours: twenty minutes, eleven of them thinking. Three files. Zero API calls. 37.6% → 45.9%. Specificity *is* the credibility — a round or vague number reads as marketing, and an oddly precise one reads as measured.

**5. Lowercase section headers.** `quick start`, `datasets`, `repo`, `license`. Deliberately unceremonious. It signals a working document rather than a brochure, and it costs nothing.

**6. A second quick start for the worse-off reader.** llm.c has "the 'I am so GPU poor that I don't even have one GPU' section"; nanoGPT has "I only have a macbook". Ours is "I don't use git and I'm not a developer." Name the constrained reader in their own words, tell them honestly what they lose, and tell them to start anyway.

**7. Annotated file tree.** nanochat's is the model — every path with a short inline comment. It orients a reader in about ten seconds and does the job that three paragraphs of architecture prose does badly.

**8. First person, opinionated, present.** "I'd like this repo to only maintain C and CUDA code." "I may reject the PR because the complexity is not worth it." A visible author is a trust signal; a voiceless README reads as generated, which in 2026 it usually was.

**9. Self-deprecation where it's true.** "I didn't tune them much though." "probably a little too low." Ours: the gate published closed, two comparison rows flagged unverified, the register gap named as the known weak point. Flaw-first reads as honesty and buys the reader's trust for everything after it. It only works when the flaw is real.

**10. A `repo` section, late.** What this is for, what gets merged instantly, what gets turned down — with concrete examples of each. Karpathy's is the best contributing guidance in open source because it's specific enough to act on. Placed after the how-to, never before.

**11. Generosity toward the competition.** llm.c links its own forks and ports. Ours says use Spec Kit if you're building one codebase with one agent. Sending readers elsewhere costs a fraction of what it buys, because a document that can say when *not* to use itself is the only kind anyone believes.

## Register settings

Reading level **PLAIN** throughout, per `for-dummies-glossary`. Every unavoidable term gets an inline gloss at first use and a one-line entry in `GLOSSARY.md`. The reader is an intelligent adult without the background — never a stupid one.

Prose per `writes-human`: connective tissue where the argument genuinely turns, one concession per few hundred words, a small phrase toolkit repeated rather than elegant variation, and sentence length varied hard. Target median around 15 words with real spread. No stacked noun-phrase fragments — every three-item list gets rebuilt into a sentence that walks the reader through it.

Positioning per `why-people-buy`: concede the leader's strength before claiming any difference, lead with the negation, and treat the deliberate friction (the closed gate) as a costly signal to advertise rather than a flaw to apologise for.

## What this register is not

Not a licence to be cute. The jokes in Karpathy's repos are rare and land because the surrounding text is dense with real information. One light touch per document, at most.

Not an excuse for length. Every section earns its place or it goes into `docs/`. First contact should still fit roughly one screen before the reader has to decide whether to continue.

Not applicable to the anchor or build templates. Those are governance instruments read by agents mid-task, and they want precision over warmth. This register governs READMEs, dashboards, and anything else a human meets before they've decided to care.

## Checklist before any README ships

```
[ ] Opens with what it is + what it does not need
[ ] Quick start appears before any origin story or philosophy
[ ] At least one real, paste-able block — not a description of one
[ ] At least one shown output, transcript, or before/after
[ ] Concrete numbers, not ranges or adjectives
[ ] Lowercase section headers
[ ] A second quick start for the constrained reader
[ ] Annotated file tree
[ ] First person, with at least one real admission of weakness
[ ] `repo` section with merge / turn-down examples, placed late
[ ] Points readers at a competitor where the competitor is better
[ ] Every term glossed inline and in GLOSSARY.md
[ ] Median sentence ~15 words, wide spread, no fragment stacks
```
