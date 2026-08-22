# DriftGuard

Project governance for AI-assisted work in three markdown files, with no need for a CLI, an account, a server, a database, or a single API call.

Your AI forgets what you decided last Tuesday. Worse, it doesn't know that it forgot - so it invents a reason for the choice, you build on the invention, and three weeks later you're deleting the repo. DriftGuard is the boring fix: write the decisions down in a file the AI reads at the start of every session and is never allowed to rewrite.

That's it. It's markdown in your repo. Any AI can read it — Claude Code, Cursor, a chat window, a local model you run yourself, or a contractor with a text editor.

> **On the name.** DriftGuard is provisional. Three unrelated products already use it, one of which holds the `DriftGuard` GitHub org. A rename is planned and costs one find-and-replace. See [`docs/NAMING.md`](docs/NAMING.md).

> **Status: alpha.** Unproven, free, MIT. Its own front gate is currently **closed** - see [the gate is closed](#the-gate-is-closed), which is either the most convincing thing here or the least, depending on your temperament.

Free, MIT, no email capture, no account, no gated download, no upsell, and no analytics in the repo. Before you spend time on it, read [**what it does not do and who should not use it**](HONEST_BOX.md) — including the case where you should use a competitor instead.

**[dashboard](https://abumaude.github.io/DriftGuard-MVP/) · [tracker](https://abumaude.github.io/DriftGuard-MVP/tracker.html) · [templates](templates/) · [worked example](examples/worked-example/) · [honest box](HONEST_BOX.md) · [glossary](GLOSSARY.md) · [research log](docs/RESEARCH_LOG.md)**

---

## what you'll actually notice

Not much, on day one. The change shows up in week three, and it looks like this.

**Both exchanges below are constructed illustrations, not transcripts.** I haven't logged a real session in this form, and a made-up example that reads like evidence is precisely the thing this project claims to be against. The failure pattern is annoyingly frustrating and I've hit it repeatedly; these two specific exchanges never happened.

**Before**, three weeks in:

> **You:** why does the auth flow block requests from the same IP twice in a row?
> **AI:** That's a standard rate-limiting pattern to prevent brute-force attacks. It's good practice to keep it.

That's a confident, plausible, completely invented answer. The real reason was a payment-provider sandbox limit you hit in week one and worked around. Four days later you remove the "rate limiting", payments break, you roll back, the rollback undoes something else, and you're managing the codebase instead of building it.

**After**, same question, same three weeks:

> **You:** why does the auth flow block requests from the same IP twice in a row?
> **AI:** ANCHOR.md Section 4 records this: the payment sandbox rejects duplicate
> calls within 2s from one IP (logged 2026-06-14, see state/use-ledger.md).
> The block is a workaround for that, not rate limiting. Removing it will break
> checkout in the sandbox.

Same model. Same question. The difference is that the answer had somewhere to come from.

Take the *shape* of the failure from that, not a performance claim. Nobody has measured how often it happens or how reliably an anchor prevents it, and until somebody has, I'm not going to imply the measurement exists.

### the same failure, wearing other clothes

The invented-reason answer is one costume. The underlying failure — decisions happening faster than they get recorded, and the AI not knowing why anything was decided — turns up in several others:

**You become your own continuity layer.** Ten half-finished chats, and the only thing connecting them is you — bookmarks, mental notes, re-reading last week's thread to work out what you were doing. That's an unpaid job, and you do it every day.

**The handoff that takes three days.** You bring in a contractor to finish what the AI started. They open the project and have no idea what's going on, and half the onboarding is you reconstructing decisions you never wrote down.

**The sixteen-document skim.** You paste a pile of documents, the AI synthesises confidently, and you find out later that several were skimmed and key content missed — with no way to have known at the time.

**Agreement that compounds.** The AI agrees too readily. A bad decision gets built on, and by the time consequences appear it's buried under five layers of dependent choices. The use ledger exists for exactly this: it records what failed, not only what was decided.

**Three tools, three silos.** One conversation in Claude, another in ChatGPT, a third in Gemini — and none of them knows about the others. A file in a repo is the one thing all three can read.

Every one of these is a re-explaining problem. The anchor is the file you stop re-explaining from.

---

## quick start

Start with two sections of one file. Most of the effort is thinking rather than typing, and I've deliberately dropped the "about twenty minutes" estimate this used to carry - nobody outside me has ever done it, so I don't actually know how long it takes you. The number goes back in when somebody times a real first run.

**1. Copy two files into your project.** Take [`templates/ANCHOR_TEMPLATE.md`](templates/ANCHOR_TEMPLATE.md) and [`templates/BUILD_INSTRUCTIONS_TEMPLATE.md`](templates/BUILD_INSTRUCTIONS_TEMPLATE.md), drop them in the folder where your project lives, and rename them `ANCHOR.md` and `BUILD_INSTRUCTIONS.md`.

**2. Fill in two sections and stop.** Only 1.0 and 1.1. Not the whole document — filling in the whole document before you've built anything is the exact failure this prevents, and I'll come back to that. Yours will look something like this *(invented example — Dayo isn't real)*:

```markdown
### 1.0 Ship-or-drift front gate

> This exists so that **Dayo, who runs the two-van delivery firm in Ikeja**,
> can **stop losing an hour every evening reconciling driver texts against
> invoices**, and I'll know it worked when **he uses it for a full week
> without messaging me to ask how something works**.

### 1.1 Product definition

A phone-first job sheet for small delivery firms in Lagos, where the driver
taps three buttons and the owner sees one screen. Success is Dayo stopping
the evening reconciliation entirely.

### 1.2 Immutable constraints

| # | Constraint | Overridable | Implication |
|---|---|---|---|
| 7 | Works on a 3G connection on a cheap Android phone | No | No heavy frameworks. Offline-first or it doesn't ship. |
| 8 | No feature ships that a driver can't learn in 30 seconds standing up | No | Kills the dashboard idea. Kills most of the settings screen. |
```

**3. Point any AI at it.** Paste this:

```
Read BUILD_INSTRUCTIONS.md and ANCHOR.md Section 1 from the repo.
Then run Step 0.
```

That's the whole install. You don't need to add any packages, learn CLI or setup via various paths nor need an account.

### quick start (I don't use git and I'm not a developer)

You can still use this, and honestly a lot of the value survives.

Put `ANCHOR.md` in a Google Doc, a Notion page, or a plain note. At the start of each session, paste it into the chat before you ask for anything. The AI now has the rules.

What you give up is the audit trail — being able to ask "when did I decide this and why" in November and actually get an answer. Git is what makes the record durable and inspectable. But the anchor doing its main job — stopping the AI contradicting decisions you already made — works fine from a Google Doc, and starting there beats not starting.

---

## how it works

Three things, all plain text, no magic.

**`ANCHOR.md` is the constitution.** What you're building, who for, and the rules that must never be broken. The AI reads it and never rewrites it. When the AI's output contradicts the anchor, the output is wrong — not the anchor.

It grows by *adding sections*. You never edit or delete an existing one. If a decision reverses, you append a new section saying what changed and why, and the old section stays put as the record of what you believed at the time. This is the rule people find strangest, and it's the one doing most of the work: a file you can quietly edit is a wiki page, and wiki pages are exactly how decisions get silently revised and then forgotten.

**`BUILD_INSTRUCTIONS.md` is the sequence.** Which part of the anchor to load at each step, so you never dump the whole thing into context and get it skimmed. Each step names its model, its inputs, how to check the work, and what to commit. It ends with a copy-paste prompt for the next session, which sounds trivial and is the reason people actually keep using it.

**Git is the memory.** State lives in the repo, not in a chat window and not on one laptop. It survives a wiped machine, a switched tool, a provider outage, and someone else picking the work up cold.

There's a fourth file that isn't required but earns its place fast: `state/use-ledger.md`, an append-only log of what you tried, what failed, and what you skipped. The anchor holds what's true; the ledger holds what happened. Six months later that distinction is the difference between "why is it like this?" and knowing.

---

## why this exists

I built twenty things with AI and shipped none of them.

Not for lack of output — the output was the problem. Twenty variants, six design memos, two design systems, an ID schema. Every session produced more architecture and less product. Somewhere around variant fifteen I worked out that the building *was* the avoidance: as long as I was designing the next thing, I never had to ship the last one.

Underneath the avoidance was a real failure though. Every project drifted. Decisions made in week one got contradicted in week three. New chats forgot old constraints. The AI confidently invented reasons for choices it no longer remembered making. I wasn't managing projects; I was re-explaining them, over and over, to a collaborator with no memory and enormous confidence.

DriftGuard is the system I built to stop re-explaining. It isn't an app. It's a way of working — and the repo you're reading runs on it.

It has already caught this project drifting. Early on I let an AI write chat links into a file from memory instead of retrieving them, and they were wrong — plausible, well-formed, and pointing nowhere. "Retrieve, never reconstruct" is now a standing rule here, and the incident stays in the record rather than getting quietly tidied away. A governance method that hides its own drift is selling something else.

---

## the gate is closed

This repo governs itself with its own methodology, which means publishing the parts that aren't finished.

[`ANCHOR.md`](ANCHOR.md) Section 1.0 requires a named person — a real human you can message this afternoon — before any build action is permitted. That slot is empty. So the gate is closed, almost everything on the [tracker](https://abumaude.github.io/DriftGuard-MVP/tracker.html) is blocked behind it, and the launch sequence formally cannot proceed. The tracker renders those counts from committed data; this page deliberately does not restate them, because a hand-typed number goes stale the first time an item is added and nobody notices.

I published it that way on purpose. A governance methodology that quietly waives its own front gate has lost the argument before anyone reads the README, and a closed gate demonstrates the mechanism better than any paragraph describing it could.

It's also the rule I most want to bend, which is roughly how you know it's the right rule. "Alpha testers" would let me through. "Solo founders building with AI" would let me through. Neither can reject me, and that's the whole point of the constraint — a demographic can't say no to your face and a person can.

---

## where this sits

**GitHub was right.** A project needs a constitution. [Spec Kit](https://github.com/github/spec-kit) ships `/speckit.constitution` to "establish project principles", it's good, and it has roughly 124k stars behind it. *If you are building one codebase with one agent, use Spec Kit and stop reading here.* (Verified 2026-07-31 against the Spec Kit repo and docs site. Longer descriptions of its constitution phase that circulate online come from a derivative project, not from GitHub — see the [research log](docs/RESEARCH_LOG.md).)

DriftGuard is for what a per-repo constitution deliberately doesn't cover: the same decisions surviving across *repositories*, across sessions weeks apart, across a handoff to a contractor or a different model, and across projects that aren't code at all — a research programme, a course, a content pipeline.

One constitution per repo is a solved problem now. Continuity between them isn't. [Tessl's published review of Spec Kit](https://tessl.io/blog/a-look-at-spec-kit-githubs-spec-driven-software-development-toolkit/) lists stale specs, cross-project consistency, and multi-session maintenance among the things it doesn't address (verified 2026-07-31). That list is this project's problem statement, written by someone with no stake in it.

### one word, five scopes

Everyone is now using drift language and they all mean something different by it. Each of the first four is bounded by a boundary this project is defined by crossing:

| who | their word | their scope |
|---|---|---|
| Anthropic | goal drift | an agent losing the plot **within one long task** |
| Meta (Wu et al.) | behavioral state decay | requirements still in context but no longer shaping action, **within one session** |
| shadcn `improve` | what drifted | plan items going stale **within one repo, between sessions** |
| GitHub `/speckit.converge` | convergence | codebase diverging from spec, **within one repo** |
| **DriftGuard** | **drift** | **decisions not surviving across repos, sessions, tools, operators, and non-code domains** |

Three of those five rows were verified on 2026-07-31. The Anthropic and shadcn rows were carried over from an earlier draft and are marked **unverified** in the [research log](docs/RESEARCH_LOG.md) until I've cited their primary sources. Recording the gap rather than quietly closing it is the same discipline this page is arguing for, so it stays visible.

### use something else if

**You're building one codebase with one agent.** [Spec Kit](https://github.com/github/spec-kit). Better at that, vastly larger community, composes with this.

**You want your agent to perform better inside a session.** [Superpowers](https://github.com/obra/superpowers) or your harness's own features. They tune the engine; this governs what it's allowed to do.

**You need memory inside one provider's API.** That provider probably ships it now — Anthropic's [memory tool and context editing](https://platform.claude.com/docs/en/build-with-claude/context-editing) do this well (verified 2026-07-31).

Come back when the project outlives the session, the tool, or the person. The fuller version of this — including the limitations a competitor would attack — is in the [honest box](HONEST_BOX.md).

### methodology, not harness

A *harness* is software that wraps a model's API so it can run programmatically — Claude Code, Cursor, Aider, the various agent SDKs. Harnesses make API calls, authenticate, consume tokens, and have economics tied to somebody else's pricing decisions.

DriftGuard makes zero API calls. It's markdown with a protocol any tool reads. Use it with Claude Code, Cursor, OpenClaw, a chat window, a local model, or a person.

That distinction earned its keep in June 2026. Anthropic announced on 14 May that programmatic usage would move to a separate metered credit pool at API rates from 15 June — then cancelled it on the day, said the move was no longer happening, and that the approach was being reworked. Every tool built on the announced assumption spent a month planning for something that never arrived. A markdown file doesn't have that failure mode.

*(Sourcing note, checked 2026-07-31: the reversal is reported consistently across independent outlets, but I haven't read a primary Anthropic notice for it. Treat the dates as secondary-sourced, and check before repeating them.)*

**About every "verified" date in this repo.** They mean I checked the source on that date, working with an AI assistant, in one session. That's internal review — not an audit, not independent verification, and nobody outside this project has confirmed any of it. Each claim is logged with its evidence tier and its limits in [`commercial/EVIDENCE_LEDGER.yaml`](commercial/EVIDENCE_LEDGER.yaml), including the three currently marked **quarantined**, which means unsourced and not fit to state as fact.

---

## the evidence

"Context windows are huge now, this is solved" is a testable claim, and two frontier labs have tested it.

Meta's [*Remember When It Matters: Proactive Memory Agent for Long-Horizon Agents*](https://arxiv.org/abs/2607.08716) names the failure **behavioral state decay**: the task requirements are still sitting in the context window and have simply stopped shaping the next action. Present, but inert.

| | |
|---|---|
| Terminal-Bench 2.0 pass@1 | 37.6% → **45.9%** |
| τ²-Bench | **+6.8 pp** |
| Same intervention, stronger action agent | **+2.4 pp** |
| API calls DriftGuard requires | **0** |

That third row is the one that matters. A *better* model still decayed and still gained from an external memory intervention. So capacity isn't the constraint and neither is model quality — the constraint is knowing when something matters. Figures are quoted from the paper, not from summaries of it.

Their memory bank separates status, stable knowledge, and procedural memory. That's the same three-way split DriftGuard holds in the repo — `BUILD_INSTRUCTIONS.md` carries status, `ANCHOR.md` carries knowledge, the use ledger carries what was tried and what failed. I'd like to claim I designed it from their paper; I didn't, they arrived at it independently and later, which is better evidence than if I had.

And none of that touches the case this project is actually about, which starts at the tab you closed last Tuesday.

---

## draw it before you build it

One gate runs before any code gets written, and it is the cheapest thing in the method.

List every actor who can change the state of your system. For each one, answer four things: what they do, what changes, **how they learn the outcome**, and where they go to check. Then draw the whole process and walk each journey end to end. Any journey that ends without the actor finding out what happened is a missing feature — and you fix it in the spec, not in the code.

Here is the failure it catches, from the case that produced the rule. A member's app: users submit something, an admin approves it. Submission worked. Approval worked. Both passed every test written for them. The submitter had no way to learn what had been decided. Nobody noticed for hours of building, because **an omission contradicts nothing** — there is no failing test for a step that was never specified. Only walking the whole journey surfaces it, and a drawing surfaces it in minutes.

The check re-runs after every build step rather than only at the start, since a new feature can open a new dead end. By default a human approves the drawing before building begins; you can set it to self-check instead, but a dead end halts the build either way.

Applying it to *this* repo found two of them, written up in [`ANCHOR.md`](ANCHOR.md) Section 8.4. The worked example found a worse one — an MVP proof gate that depended on a signal the operator had no way to detect. Both are left in place rather than quietly fixed, because a gate that catches something on its first run is better evidence than one that catches nothing.

Full rule: [`docs/RULING_closed-loop-gate-v1.md`](docs/RULING_closed-loop-gate-v1.md).

---

## the files

```
your-project/
├── ANCHOR.md               the constitution. read always, edit never.
├── BUILD_INSTRUCTIONS.md   the sequence. read this first, every session.
├── AGENTS.md               optional: points agents at the two files above
└── state/
    └── use-ledger.md       what was tried, what failed, what was skipped
```

And this repo, which is the methodology plus its own governance:

```
.
├── README.md               this file — the whole marketing surface
├── ANCHOR.md               DriftGuard's own anchor. gate currently CLOSED.
├── BUILD_INSTRUCTIONS.md   the launch sequence, nine steps
├── AGENTS.md               instructions for AI agents working in here
├── CLAUDE.md               same, for Claude Code — it reads this automatically
├── GLOSSARY.md             every term on this page, in plain English
├── HONEST_BOX.md           what it does not do, and who should not use it
├── CONTRIBUTING.md         what I'll merge and what I won't
├── commercial/             the trust layer — start at HOW_TO_USE.md, then the
│                           constitution, evidence ledger, product + funnel
│                           profiles, and the dated pre-ship checklist runs
├── scripts/verify.sh       pre-push checks: graph, seed drift, links, stale counts
├── templates/              the two blank files you actually came for
├── examples/
│   └── worked-example/     a filled pair for a newsletter. deliberately not code.
├── state/
│   └── use-ledger.md       this project's own ledger
└── docs/
    ├── index.html          public dashboard (single file, no build step)
    ├── tracker.html        build tracker (reads data/tracker.json)
    ├── data/               tracker.json, variants.json — edit data, not markup
    ├── RESEARCH_LOG.md     sector observations, with verification dates
    ├── POSITIONING.md      the competitive delta + eight rehearsed objections
    ├── NAMING.md           three name collisions and the rename procedure
    ├── OPERATING_MANUAL.md  how to run this repo day to day — start here
    ├── RULING_closed-loop-gate-v1.md  draw the process before you build
    ├── LAUNCH_CHECKLIST.md the operational sequence
    ├── METHOD_repo-intro-register.md  the house style for every README here
    └── FAQ.md              the questions this actually gets
```

Every term above that isn't obvious is in [`GLOSSARY.md`](GLOSSARY.md), one line each, plain English. If you don't know what a repo is, start there — that's not a joke and you're not the only one.

---

## the variant library

A variant is the same methodology with an anchor shaped for a specific domain. **None of these repositories are live yet.** Each exists as a complete anchor-and-build pair; they get published in Step 4, after the gate clears. A link to an empty repo costs more credibility than a missing row.

| variant | governs | pair | repo |
|---|---|---|---|
| `variant-research` | research projects — sources, claims, synthesis | complete | not yet published |
| `variant-contractor-handoff` | handing an AI-started build to a human who wasn't there | complete | not yet published |
| `variant-shortform-video` | a video channel as a governed pipeline | complete | not yet published |
| `variant-courseware` | course and curriculum builds | ~80% | not yet published |
| `atlas` | operator infrastructure: portfolio catalogue across repos | complete | not yet published |
| `suzerain` | operator infrastructure: cross-repo and lineage governance | complete | not yet published |

Live status for all of them is on the [tracker](https://abumaude.github.io/DriftGuard-MVP/tracker.html).

---

## repo

A few words on what I want this repo to be.

First, I want it to be **usable by someone who doesn't know what a repository is**. That's the first market and it's also the current weak point — the templates are written in developer register and they shouldn't be. If you're that person and the templates assume things you don't know, that's the artefact failing, not you, and it's the single most useful thing you can tell me.

Second, I want it to stay **small enough to read in one sitting**. The anchor template is one file. The build template is one file. The dashboards are one file each, with no build step, no bundler, no dependency, and no network call — they work if you double-click them. If a change adds a package manager to make something 5% nicer, I'll turn it down, because the moment this needs installing it becomes a harness and loses the only durable advantage it has.

Third, I want it to be **honest about what it isn't**. This README tells you to use a competitor for the most common use case. It publishes its own gate as closed. It flags two rows of its own comparison table as unverified. None of that is modesty — it's that a governance tool which oversells itself is refuting its own thesis in public.

What I'll turn down: anything requiring an API key, server, quota, or account to use the methodology. Telemetry of any kind. A build step for the dashboards. A separate marketing site — this README is the marketing surface. New variants while unshipped ones exist, which is the architect's-trap protection and the rule I break most often.

What I'd merge instantly: a template rewrite driven by watching a real person stall on it. A filled example from a domain that isn't software. A correction to any factual claim on this page, with a source and a date. Fixed typos, dead links, anything broken.

---

## feedback

This is alpha and the most useful thing you can do is tell me where it breaks.

The highest-value thing, by a distance: **let me watch you try it.** Thirty minutes, screen shared, while you attempt to fill in an anchor for something you're actually building. I say nothing unless you get stuck. The point where you stall is worth more than everything either of us could say about it afterwards. Open a Discussion and say so.

Otherwise, open an issue with the **Feedback** template — four questions, ninety seconds, partial answers welcome. And if you got as far as filling in an anchor and then abandoned it, I want to know that most of all. Abandonment is a signal and it's invisible from the outside.

## license

MIT.

---

> The repo is the truth. The anchor is the law. You're the architect; the AI is the builder. Nothing gets lost.
