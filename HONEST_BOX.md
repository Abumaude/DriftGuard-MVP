# Before you adopt this

DriftGuard is free, MIT-licensed, and asks for no email address. So there's no purchase to protect you from — but adopting a working method still costs you time, and switching away later costs more. This page is the same disclosure a paid product would owe you, applied to a free one.

Governed by [`commercial/COMMERCIAL_CONSTITUTION.md`](commercial/COMMERCIAL_CONSTITUTION.md) §3, §4 and §9. Every factual claim on this page traces to [`commercial/EVIDENCE_LEDGER.yaml`](commercial/EVIDENCE_LEDGER.yaml).

---

## This is for you if

- Your project runs longer than a single chat session — especially if you come back to it weeks later.
- Your work moves between tools, or between you and somebody else.
- You're building something that isn't code. Research, a course, a content pipeline. The spec-driven tools don't reach these.
- You've already been burned once by an AI confidently contradicting a decision you'd made earlier, and you don't want it happening again.

## Do not adopt this if

- **You're building one codebase, with one agent, in one continuous stretch of work.** Use [GitHub Spec Kit](https://github.com/github/spec-kit). It's more mature, has a vastly larger community, and is better at that job. This isn't a courtesy — it's the most common case, and Spec Kit wins it.
- **You want better output from a single session.** This governs what the AI is allowed to do; it does nothing to improve what it generates. Use your harness's own features, or something like Superpowers.
- **You want software to install, a dashboard to log into, or automation that does the thinking.** There's none of that here, and there won't be.
- **You won't write things down.** The method *is* writing things down. There is no version of this that removes that, and adopting it without that willingness will waste an afternoon.

## What it does

- Gives the AI one file of decisions it reads at the start of a session and is never allowed to rewrite.
- Loads only the relevant parts of that file per step, so it doesn't get skimmed.
- Keeps the record in git, so it survives a wiped machine, a switched tool, or somebody else picking the work up.
- Separates what's *true* (the anchor) from what *happened* (the ledger), which is the distinction that answers "why is it like this?" six months later.

## What it does not do

- **It doesn't enforce anything.** An AI can ignore the anchor, and will, unless you prompt it to read the file. There's no runtime, no hook, no interception. If you're imagining a guardrail that catches the model in the act, that isn't this.
- **It doesn't prove anything about the record.** It's a git history. Anyone with write access can rewrite it. It is a *working* record, not an *attested* one, and it should not be used as compliance, audit or regulatory evidence.
- **It doesn't make the AI smarter, faster or cheaper.**
- **It doesn't verify claims across tools.** If you need tool B to trust what tool A logged, that needs something this doesn't have. It's parked work, not shipped work.

## What you'll still need to do

- Write the anchor honestly. This is thinking rather than typing, and it's the actual work. Most of the difficulty of the method sits here.
- Tell your AI to read the files at the start of a session. Nothing happens automatically.
- Append to the ledger when something fails. This is the step people skip, and it's the one that pays off latest — which is exactly why it gets skipped.

## A cheaper or free alternative may be enough if

- **You're working on code, in one repo.** Spec Kit, again. Genuinely.
- **You want most of the benefit for almost no adoption cost.** Keep a plain text file of your decisions and paste it at the start of each session. That captures a real share of the value. The README documents this path properly rather than hiding it, because for a lot of people it's the right answer.
- **You need memory inside one provider's API.** That provider probably ships it now.

## Known limitations

The things a fair competitor would raise, listed because they'd be right to.

- **It is unproven.** Nobody outside the author has completed a project using it. Not one person. The evidence supports the *problem* being real — two frontier labs, cited in the README — and supports nothing at all about this being the right solution.
- **The templates are written in developer register**, which directly contradicts the stated first market of non-technical builders. This is named openly in the project's own anchor as the known weak point, and it isn't fixed.
- **The project's own front gate is closed.** It requires a named person before any build action, and that slot is empty, so DriftGuard has not itself passed the bar it sets for everyone else. Read that either as unusual honesty or as a project that hasn't started. Both readings are fair.
- **The name is provisional and will change.** Three unrelated products already use it, one holding the GitHub org.
- **Two rows of the competitive comparison table are unsourced**, marked as such in place, and not yet fixed.
- **The time-to-value figure was withdrawn.** An earlier version said twenty minutes. That number was an estimate presented as a measurement, so it's gone until somebody actually times a real user.
- **Support is one person, with no response-time commitment.** Don't build a dependency on fast answers.

## Evidence behind the main claims

| claim | ledger ID | tier |
|---|---|---|
| No CLI, account, server, database or API call | CLAIM-001 | CONFIRMED |
| Tessl's review lists what Spec Kit doesn't address | CLAIM-005 | CONFIRMED |
| Meta's benchmark figures on within-session decay | CLAIM-008 | CONFIRMED (their result, not ours) |
| Anthropic's cancelled June billing change | CLAIM-007 | VERIFY — secondary sources only |
| Anthropic "goal drift" / shadcn "what drifted" rows | CLAIM-010 / 011 | **QUARANTINED — unsourced** |
| Time to fill an anchor | CLAIM-002 | **QUARANTINED — withdrawn** |

## Cost, refunds, and what happens to your data

Free. MIT. No email capture, no account, no gated download, no upsell, and no analytics inside the repo. Nothing to refund because nothing is charged, and nothing is collected about you because there's no server to collect it.

If that ever changes, it'll be stated plainly on this page before it happens, not introduced quietly.

## Conflict of interest

Everything on this page, and every verification date in the repo, comes from the author working with an AI assistant in a single session. That is **internal review**. It improves the work and it is not independent verification, has not been audited, and should not be read as attested by anyone. Nobody outside this project has checked any of it.

---

*Anti-theatre check run 2026-07-31. The limitations above that could actually cost adoption: unproven with zero external users, no enforcement mechanism, developer-register templates, and the recommendation to use a competitor for the most common use case. If this page ever lists only harmless flaws, it has failed.*
