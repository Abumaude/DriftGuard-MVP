---
title: Positioning — the July 2026 delta and the rebuttal kit
slug: positioning
type: memo
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
supersedes: the positioning sections of README_master-v2 (2026-06-12)
---

# Positioning

This file does two jobs. The first half records what changed between the May–June positioning and today, and what must be said differently as a result. The second half is a rebuttal kit: the objections this launch will actually receive, and the honest answer to each. Both halves exist so that the answer given in a Hacker News thread at 2am matches the answer in the README.

---

## Part 1 — The delta

### What changed

GitHub Spec Kit shipped a constitution. `/speckit.constitution` establishes project principles in a versioned governance file with normative MUST/SHOULD articles, ratification and amendment dates, and downstream conformance checking. Whatever DriftGuard once had by way of a distinctive claim on "the anchor is an immutable constitution the agent reads and never rewrites," it no longer has alone, and the party that took it has roughly 124.3k stars and support for 30+ coding agents.

`/speckit.converge` compounds it, assessing a codebase against its specifications — drift detection inside the repo, from the same toolkit, using the adjacent vocabulary.

Anthropic shipped a memory tool and context editing on its developer platform. The shallow end of "your agent forgets between sessions" is being absorbed into the platform layer.

Anthropic's June 15 billing split, which the previous README used as a load-bearing argument, was cancelled on the day it was due to take effect.

And the name collision turned out to be worse than recorded, with the `DriftGuard` GitHub organisation already occupied.

### What did not change

The seams. Spec Kit's constitution lives at `/memory/constitution.md` inside one repository and governs the phases of that repository's build. Tessl's published analysis of Spec Kit names, as unaddressed, exactly the territory DriftGuard was built for: specifications going stale or diverging from implementation over time, cross-project specification sharing and consistency, multi-session maintenance and versioning, and long-term specification governance.

That is a third party, reviewing the market leader, listing DriftGuard's problem statement as the gap. It is a considerably better asset than the previous self-asserted distinction.

### The new frame, in one paragraph

> GitHub was right. A project needs a constitution, and Spec Kit's is good — if you are building one codebase with one agent, use Spec Kit and stop reading here. DriftGuard is for what that constitution deliberately does not cover: the same decisions surviving across repositories, across sessions weeks apart, across a handoff to a contractor or a different model, and across projects that are not code at all. One constitution per repo is a solved problem now. Continuity between them is not.

### Rules for every public surface

**Concede first, always.** The concession is the price of being heard, and it is also true. Any copy that leads with what makes DriftGuard different from Spec Kit invites a comparison on adoption, which DriftGuard loses by four orders of magnitude. Copy that leads with agreement, then narrows, invites a comparison on scope, which is the comparison worth having.

**Never claim to have invented the constitutional pattern.** Claim to have extended it past the repo boundary. The origin story — twenty variants, nothing shipped, decisions contradicted in week three — is still the strongest opening because it is a lived account of the problem, not a claim of priority.

**Keep the vocabulary paragraph and expand it.** Four tools now use drift language for four different scopes, and disambiguating them is genuinely useful to a reader:

| Who | Their word | Their scope |
|---|---|---|
| Anthropic | goal drift | an agent losing the plot *within one long task* |
| Meta (Wu et al.) | behavioral state decay | requirements still in context but no longer shaping action, *within one session* |
| shadcn `improve` | what drifted | plan items going stale *within one repo, between sessions* |
| GitHub `/speckit.converge` | convergence | codebase diverging from spec, *within one repo* |
| DriftGuard | drift | decisions not surviving *across repos, sessions, tools, operators, and non-code domains* |

Every one of the first four is bounded by a boundary DriftGuard is defined by crossing. Printing them in a table makes the point better than a paragraph of argument, and it demonstrates that the project has read its competitors properly — which is itself a credibility signal.

**Ship a "use something else if…" block.** It costs a few sentences and it buys the reader's trust for everything after it. If you are building one codebase with one agent, use Spec Kit. If you want your agent to perform better inside a session, use Superpowers or your harness's own features. If you need memory inside one provider's API, that provider now ships it. Come back when the project outlives the session, the tool, or the person.

**Correct the Anthropic billing claim.** Do not delete the argument; tell it accurately. A provider proposed re-pricing programmatic agent use in May, reversed in June under pressure, and said the approach is being reworked. Harness economics depend on a pricing decision nobody downstream controls, and that has just been demonstrated in public. The methodology layer makes zero API calls and is therefore unaffected either way. Told accurately it is a stronger argument, because it happened rather than being predicted.

**Do not cite the Anthropic 2026 Agentic Coding Trends Report until someone has read it.** The landing page is not the report. Figures from a landing page are how a launch acquires its first correction in public.

---

## Part 2 — Rebuttal kit

Written as answers, ready to be used near-verbatim in a Show HN thread, a Reddit reply, or a README FAQ. Every one of them concedes something real before it argues, because the ones that do not will be read as marketing and dismissed.

### "This is just Spec Kit with extra steps."

Fair, if you build one codebase with one agent — in that case Spec Kit is better and you should use it. Spec Kit's constitution lives in one repo and governs that repo's build phases. Mine governs the seams between them: the same decisions surviving a new session next month, a handoff to a contractor, a switch from Claude to Cursor, and projects that are not code at all — a research programme, a course, a content pipeline. Tessl's own review of Spec Kit lists stale specs, cross-project consistency, and multi-session maintenance as things it does not address. That list is my problem statement. They compose; the README says to use both.

### "This is just markdown files. There is no product here."

Correct, and that is the design rather than a gap. It makes zero API calls, has no server, no account, and no telemetry. That is why it survives a tool switch, a wiped machine, a provider outage, and a pricing change. In May a provider announced re-pricing programmatic agent usage, then cancelled it in June before it took effect; every tool built on that assumption spent a month planning around a change that never happened. Markdown in a git repo does not have that failure mode. The thing being sold is the protocol and the discipline, and both are free to inspect — which is also why you should judge it by whether the files help, not by how much machinery ships with them.

### "AI models have huge context windows now. This is solved."

The best available evidence says the opposite, from two frontier labs. Meta's paper on long-horizon agents (arXiv:2607.08716) names "behavioral state decay": the requirements are still sitting in the context window and have simply stopped influencing the next action. The instruction is present but inert. Their intervention lifted Terminal-Bench 2.0 pass@1 from 37.6% to 45.9%, and a *stronger* action agent still gained 2.4 points. Capacity is not the constraint — knowing when something matters is. And none of that touches the case this project is actually about, where the context window ends at the tab you closed last Tuesday.

### "Anthropic ships memory now. Vendors will absorb this."

They will absorb part of it, and they should. A provider's memory tool is genuinely useful, and if you work inside one provider's API it may be all you need. What a vendor is not incentivised to build is memory that leaves. Provider memory does not follow you to a different model, does not open in a contractor's editor, is not a record a second human can audit, and is not something you own after you cancel. Portability across vendors, and legibility to people rather than only to models, are the parts that stay outside the platform.

### "You have twenty variants and zero shipped products. Why should I trust this?"

You should not, on that basis, and the README says so in the first line — I built twenty things with AI and shipped none of them. The methodology is the thing I built to stop doing that, and this repository is the first artefact where I applied it to myself: `ANCHOR.md` at the root is DriftGuard's own anchor, and its front gate names me rather than a user — I built it for my own use, so the signal is self-generated, which fails the anchor's own third slot test and is recorded as that failure in its Section 9.3 rather than waived. The honest status is alpha, unproven by anyone but me, and free. Judge it on whether the files are useful, and check back in a quarter to see whether the ledger shows shipping.

### "The name is taken. Three times."

It is, and one of the three holds the GitHub organisation. `docs/NAMING.md` documents all three collisions with dates, explains why publishing under a provisional name still beat waiting, and contains the rename procedure — one find-and-replace, because nothing depends on the string. Publishing under a contested name is a real cost, honestly, and it is smaller than the cost of another quarter unpublished.

### "This is Waterfall with a new hat."

Gojko Adzic made that criticism of spec-driven development generally and it lands on the heavy end of the category. The defence is scope: the anchor fixes the constitution — what this is, who it is for, what must never be violated — and explicitly not the implementation. Everything downstream is expected to change. The anchor grows by adding sections and is never rewritten, which is the opposite of a big design up front; it is closer to accumulating case law. If you find yourself specifying implementation detail in an anchor, that is the anti-pattern, and the template says so.

### "Who is this for? It reads like it is for engineers."

The first market is deliberately the non-technical AI builder — the person who has watched a project tangle and had no way to untangle it, who does not know what a repository is. That is also the honest weak point today: the current README is written in developer register and the templates assume comfort with git. Closing that gap is on the roadmap and is tracked openly. If you are that person and the files do not work for you, that is the single most useful piece of feedback this project can receive right now.

---

## Part 3 — What would change the strategy

Recorded so that a future session can tell a real signal from a bad week.

If Spec Kit extends the constitution across repositories — a cross-project constitution, an org-level constitution, or a session-continuity feature — the seam narrows sharply and DriftGuard's remaining defensible ground is non-engineering domains and multi-operator handoff. Watch the Spec Kit release notes for exactly this; it is the single highest-value thing to monitor.

If alpha users say the value is the templates rather than the protocol, the product is a template library and should be packaged and priced as one, not as a methodology.

If nobody outside software adopts it within a quarter, the "any domain" claim is aspiration rather than fact and should be dropped from the copy until a non-engineering user exists. Claims without instances are how a positioning becomes a lie by degrees.

If the capture-plugin wedge ships and users keep the repos but never open the dashboard, the dashboard is a demo surface rather than a product surface — which is fine, but it should stop consuming build time.

---

**End of file.**
