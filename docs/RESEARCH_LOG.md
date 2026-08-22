---
title: Research Log — AI Sector Watch
slug: research-log
type: log
status: active
version: 3.0
created: 2026-05-30
updated: 2026-07-31
---

# RESEARCH_LOG — AI Sector Watch

**Type:** Standing, append-only research log.
**Status:** Persistent. Not a variant. Architect's-trap exempt — this is ongoing observation of a shifting sector, not a build queue. Nothing in this file is a commitment to build.

**Disposition tags:**

- `USE NOW` — citation/positioning asset, usable in existing materials, no build.
- `WATCH` — track the pattern; build nothing yet.
- `DISCARD` — explicitly decided against, recorded so it stays closed.
- `RETIRE` — a claim previously made in DriftGuard materials that is no longer true. Must be corrected wherever it appears.
- `VALIDATES` — external evidence that independently supports a claim DriftGuard already makes. Usable as a citation; never a reason to build anything.
- `UNVERIFIED` — a claim currently in DriftGuard materials that could not be confirmed. Kept visible rather than quietly dropped.

**Evidence discipline.** Every entry below distinguishes what was directly observed (a repo page, a vendor doc, a store listing) from what came through a secondary summary. Secondary figures are labelled as such and are never used as load-bearing claims in public copy. Where a claim could not be verified at all, it is marked `UNVERIFIED` rather than dropped, so the gap stays visible.

---

## 2026-07-31 — Pre-launch verification scan

**Why this entry exists.** The launch playbook and master README were written in May 2026 and assert facts about the competitive landscape and about vendor billing that had not been re-checked in ten weeks. This entry re-verifies every load-bearing claim before anything ships publicly. Three claims were retired. One piece of territory that DriftGuard treated as open ground is no longer open.

### RETIRE — the June 15 Anthropic billing split did not happen

The master README v2 asserted, as settled fact, that "after June 15, 2026, Anthropic splits Claude subscriptions: interactive use stays on subscription limits, while programmatic use moves to a separate metered credit pool at API list rates," and built the "harness economics fragment, the methodology layer doesn't" argument on top of it.

What actually happened: the change was announced 14 May 2026, and cancelled on 15 June 2026 before taking effect. Anthropic's stated position was that the planned move of Agent SDK, `claude -p`, and third-party app usage to a separate monthly credit is no longer happening. Programmatic usage continues to draw on standard subscription limits. Anthropic said it was reworking the approach and committed to advance notice before any future change.

**Correction, not deletion.** The underlying argument survives and is arguably stronger told accurately: a major provider proposed re-pricing programmatic agent use, reversed within a month under user pressure, and signalled that metered programmatic billing remains under consideration. That is a live demonstration that harness economics sit at the mercy of a pricing decision nobody downstream controls — which is precisely the reason to keep the governance layer free of API calls. Publish the reversal, not the original claim. A README that asserts a cancelled billing change as current fact is a credibility liability on day one, and it is exactly the kind of stale-decision drift DriftGuard claims to prevent.

### RETIRE — "anchor-as-immutable-constitution" is no longer defensible as distinctive territory

This is the most consequential finding in this scan, and it should change the launch copy rather than delay the launch.

GitHub Spec Kit now ships a `/speckit.constitution` command. Per the Spec Kit documentation, the command exists to "establish project principles." Per the fuller write-up of the constitution phase in the spec-kit-plus documentation (a derivative project — provenance flagged, do not cite as GitHub's own wording), the phase produces `/memory/constitution.md` containing project metadata with a semantic version and ratification date, named principle articles written in MUST/SHOULD normative language with rationale, and a governance block specifying amendment procedures, versioning policy, and compliance review. It is described as the project's immutable architectural DNA, amendable only through versioned amendments that generate a Sync Impact Report. Constitutional principles propagate into the plan, spec, and task templates, and `/speckit.analyze` performs constitutional alignment checks that flag violations as CRITICAL.

Read that description next to DriftGuard's ANCHOR and the overlap is close to total: an immutable constitution file, normative principles, amendment-by-addition, and downstream artifacts that must conform. The May positioning — "Spec Kit specs one codebase; DriftGuard is the constitutional layer" — no longer works, because Spec Kit now uses the constitutional framing itself, at a scale DriftGuard cannot argue with. The Spec Kit repository shows roughly 124.3k stars against 1,608 commits on main, with support claimed for 30+ AI coding agents. The full published command set is now `constitution`, `specify`, `plan`, `tasks`, `taskstoissues`, `implement`, and `converge`, with `clarify`, `analyze`, and `checklist` as optional additions.

`/speckit.converge` deserves separate attention. It is documented as assessing the codebase against its specifications — in other words, in-repo drift detection, shipped by GitHub, under a name adjacent to the problem DriftGuard is named after.

### USE NOW — what survives, and it is narrower and better than what it replaces

The wedge did not close. It moved, and it is now sharper because a credible external analysis names the gap rather than DriftGuard asserting it.

Spec Kit's constitution is scoped to one project. It lives at `/memory/constitution.md` inside a single repository and governs the phases of that repository's build. An independent analysis of Spec Kit published by Tessl notes that the toolkit does not address specifications going stale or diverging from implementation over time, cross-project specification sharing or consistency, multi-session maintenance and versioning, or long-term specification governance — and observes that these concerns remain largely theoretical because it is early days. That same analysis records Gojko Adzic's warning that spec-driven development risks reintroducing the worst parts of Waterfall under a shinier name, and early-tester complaints that the process is overkill for small changes and carries a real learning curve.

That is the positioning, handed over by a third party: the constitutional pattern has been validated and popularised by GitHub *inside the repo boundary*, and the seams between repos, between sessions, between operators, and between non-engineering domains are named as unaddressed by the people reviewing it. DriftGuard should stop claiming to have invented the constitution and start claiming the seams — and should say plainly that if you are building one codebase with one agent, Spec Kit is the better tool and you should use it.

**Concrete copy changes required before publish:**

Lead the positioning section with the concession, not the distinction. "GitHub validated the constitution. We agree with them. Here is the part their constitution deliberately does not cover." Conceding the popularised idea buys the right to be heard on the remainder; contesting it invites a comparison DriftGuard loses on adoption alone.

Drop every implication that immutable-constitution-as-a-file is novel. It is now a mainstream pattern with a six-figure star count behind it.

Name `/speckit.converge` explicitly in the vocabulary paragraph alongside Anthropic's "goal drift" and shadcn's "what drifted." Three different tools now use drift language for three different scopes; the paragraph that distinguishes them is more useful than ever and should be expanded, not trimmed.

Add an honest "use Spec Kit instead if…" block. A methodology that cannot say when not to use it reads as a pitch rather than a tool.

### USE NOW — memory and context management became first-party vendor features

Anthropic now ships a memory tool and context-editing capability on its developer platform, aimed at cross-session memory and at pruning tool and thinking blocks from long-running agent sessions. This is the same directional bet as DriftGuard's thesis, made by the model provider, and it cuts both ways. It validates the diagnosis — the provider agrees that long-running agents need externalised, durable memory. It also means the shallow end of the problem is being absorbed into the platform, and any DriftGuard claim that amounts to "your AI forgets, we remember for you" now competes with a first-party feature.

The response is the same as with Spec Kit: concede the absorbed part, hold the part that cannot be absorbed. A provider's memory tool is scoped to that provider's API. It does not survive a move from Claude to Cursor to a contractor's head, and it is not a governance record a second human can audit. Portability across vendors and legibility to humans are not features a vendor is incentivised to build.

### VALIDATES — Meta names within-session drift (carried forward from the 2026-07-31 paper entry)

Wu et al., "Remember When It Matters: Proactive Memory Agent for Long-Horizon Agents" (arXiv:2607.08716, Meta AI) names "behavioral state decay": requirements, prior attempts, and open subgoals remain in the context window but stop shaping the next action. The instruction is present but inert.

**Correct statistics, always:** +8.3 pp on Terminal-Bench 2.0 (37.6% → 45.9% pass@1, Sonnet 4.5 action agent, Opus 4.6 memory agent) and +6.8 pp on τ²-Bench. A stronger action agent (Opus 4.6) still gains +2.4 pp. Never quote "10%" — that figure comes from a social-media summary, not the paper.

This is the within-session form of the DriftGuard thesis and confirms the premise twice: bigger context windows do not fix it, because the problem is knowing *when* something matters rather than capacity; and better models do not fix it, because the stronger action agent still decays and still gains from external intervention. Their memory bank separates status, knowledge, and procedural memory — a separation DriftGuard already holds durably and git-natively, with BUILD carrying status, ANCHOR carrying stable knowledge, and the use-ledger carrying procedural memory.

**Naming discipline:** this is the third distinct "Meta" in the corpus, separate from the Meta engineering post on tribal knowledge and from Ye et al.'s "Meta Context Engineering." Never conflate them in public copy.

### UNVERIFIED — two rows of the vocabulary table

The five-scope drift-vocabulary table now appears on three public surfaces: the master README, the public dashboard, and `docs/POSITIONING.md`. Three of its five rows were verified in this scan — Meta's "behavioral state decay" from the paper itself, GitHub's `/speckit.converge` from the Spec Kit documentation, and DriftGuard's own row.

**Two were not.** The Anthropic "goal drift" row and the shadcn `improve` "what drifted" row were carried forward from README v2 (2026-06-12) and were not re-checked on 2026-07-31. Both are plausible and both may well be accurate; neither currently satisfies constraint 9, which requires a verifiable source and a verification date to travel with any public claim about another project.

**Action before publish:** verify both against primary sources and add the citations, or cut the two rows. The table is strong enough at three rows, and a five-row table where two rows cannot be sourced is a worse asset than a three-row table where all of them can. This is the same class of defect as the retired billing claim above — a true-sounding sentence inherited from an earlier draft and never re-checked — and it is recorded here rather than quietly fixed because the pattern is the point.

### WATCH — AGENTS.md as the interoperability surface

`AGENTS.md` has settled into a genuine cross-agent convention during 2026, with guidance and comparisons against `CLAUDE.md` and `.cursorrules` now widely published. This matters to DriftGuard as an adoption ramp rather than a competitor: a DriftGuard repo that also ships an `AGENTS.md` pointing at `ANCHOR.md` and `BUILD_INSTRUCTIONS.md` is legible to every agent that reads the convention, with no per-tool integration work. That is a cheap, high-leverage addition and it is included in this launch bundle.

### WATCH — category consolidation at the harness layer

Superpowers (obra) is reported in secondary coverage at around 150,000 GitHub stars. The figure is secondary — treat it as directional, verify before citing publicly — but the direction is not in doubt: the agentic-skills and spec-driven categories have consolidated hard around a small number of very large repositories since May. The strategic implication is that DriftGuard should not attempt to compete on breadth of skills or on harness features, and its README should route people toward these tools rather than around them.

### DISCARD — delaying the launch to rebuild positioning first

The temptation on reading the Spec Kit finding is to close the launch, run a repositioning factory chat, and publish afterwards. That is the architect's trap wearing this week's costume. The positioning changes required are copy changes to one README section, and they are specified above in enough detail to execute in a single sitting. Nothing here requires a new variant, a new memo, or a new design pass.

### Sources (this entry)

- github.com/github/spec-kit — repository page, observed 2026-07-31 (star count, commit count, command set, agent support).
- github.github.com/spec-kit — documentation site, observed 2026-07-31.
- deepwiki.com/panaversity/spec-kit-plus/4.2-constitution-phase — constitution-phase description. **Derivative project, not GitHub's own documentation. Provenance flagged; do not attribute this wording to GitHub.**
- tessl.io/blog/a-look-at-spec-kit-githubs-spec-driven-software-development-toolkit — third-party analysis, source of the unaddressed-concerns list and the Adzic quotation.
- aicodex.to/articles/claude-subscription-credit-changes — billing reversal, 15 June 2026. Corroborated by multiple independent outlets covering the same reversal.
- platform.claude.com/docs/en/build-with-claude/context-editing and anthropic.com/news/context-management — memory tool and context editing.
- Wu et al., arXiv:2607.08716 — behavioral state decay.
- Secondary, directional only: Medium coverage citing ~150k stars for obra/superpowers.

---

## 2026-07-31 — Naming: the collision is worse than May recorded

The May playbook noted brand congestion and recommended publishing provisionally. Re-checked today, the congestion is materially worse than the note implies, and one item is a hard blocker rather than a caveat.

**The GitHub organisation `DriftGuard` is taken and in use.** github.com/DriftGuard is an active organisation holding a GitOps configuration drift-detection platform written in Go and Python, updated 22 June 2026, with a second repository of Kubernetes demo manifests. It is small — single-digit stars, around 59 commits, no published releases — but it exists, it is recent, and the name is not available. The launch playbook's Phase 0 step 1, "create the GitHub org `DriftGuard`," cannot be executed as written.

**driftguard.app is a shipped consumer product.** VestraCode's "DriftGuard: Maintenance Tool" is a gamepad stick-drift utility, listed on Google Play and on Steam, with its own marketing site. Two storefronts, not one.

**A third collision exists in the adjacent technical space.** `kiplangatkorir/driftguard` is a library for monitoring machine-learning model performance and drift — same word, same broad "detecting drift" semantic field, different discipline.

Three distinct products in three adjacent categories all called DriftGuard, one of them holding the exact GitHub organisation name required, is not brand congestion. It is a name that a search engine and an AI assistant will both fail to disambiguate, in a launch whose entire distribution thesis rests on being findable and on being recommended by assistants that read specs.

**Disposition:** this does not block the launch, and the operator's decision to publish under DriftGuard with a caveat stands. It does change two operational details, both handled in this bundle. The GitHub organisation must be created under a different name, since the obvious one is gone; `docs/NAMING.md` records the evidence, the shortlist, and the rename procedure. And every public surface carries a short provisional-name note, so that a later rename reads as a planned operation rather than an admission of failure.

`docs/NAMING.md` in this repository holds the full evidence table and the find-and-replace rename procedure.

---

## 2026-07-31 — UNVERIFIED: Scope Lock (Ktulue)

The master README v2 and the weekend publishing plan both recommend Scope Lock by Ktulue prominently, describe it as the canonical task-level scope-enforcement tool and DriftGuard's recommended companion, name it in the composition story, and schedule a `scope-lock-bridge` variant plus direct outreach to its author.

Repeated searches on 2026-07-31 did not surface it. The searches returned unrelated projects of similar name and general Claude Code skill collections, but not the MIT-licensed May 2026 skill described in the May memos.

**This is a gap in verification, not a finding that the tool is gone.** A search that fails to surface a small repository is weak evidence. But a public README that prominently recommends a tool by name and author is a claim the operator will be held to, and it is exactly the sort of claim that embarrasses a launch if the link 404s.

**Action before publish:** open the repository directly and confirm it exists, its licence, and its current state. If confirmed, restore the full recommendation and the outreach plan. If not, remove the named recommendation from the README, keep the *pattern* (task-level scope enforcement composes with project-level governance) described generically, and move `scope-lock-bridge` from the queued list to parked. The launch checklist carries this as a blocking pre-flight item.

---

## 2026-05-30 — Karpathy Software 3.0 + code-graph category

### USE NOW — Karpathy as external validation for the forgetting thesis

Andrej Karpathy, YC AI Startup School talk (June 2025). Genuinely his: Software 1.0 / 2.0 / 3.0 — hand-written code, then learned weights, then prompts-as-source-code, with the three layers stacking and coexisting, and the LLM framed as a new operating system that manages tools, memory, and context. Anterograde amnesia — LLMs are like a coworker who cannot form new long-running memory; all they have is the context window. This is the exact problem DriftGuard attacks, stated by Karpathy. And the Memento-style scratchpad — he proposed that a running notebook of general problem-solving knowledge, as distinct from per-user facts, is a missing learning paradigm nobody has built. Independent arrival at the capture-plugin's decision-dense-corpus thesis: same diagnosis, reached separately.

**Where it goes:** README origin story, pitch, capture-plugin positioning. "Karpathy called durable problem-solving memory a missing paradigm" is stronger backing than self-assertion.

**Attribution discipline:** 1.0/2.0/3.0, LLM-as-OS, amnesia, and the scratchpad idea are Karpathy. The "four moats" framing is a secondary commentator's synthesis — usable on its own merits, never attributed to Karpathy.

### WATCH — code-knowledge-graph-over-MCP category

Tools including codegraph, claudemap, GitNexus, code-review-graph, and graphify share a pattern: build a structured, queryable index over a code substrate, and have the agent query the index via MCP instead of rummaging through files. Reference architecture for DriftGuard's eventual agent form and for the cross-repo dependency graph.

**Take the pattern, leave the tool:** structured index plus MCP query tools is worth keeping; tree-sitter-over-code is not applicable, because DriftGuard repos are markdown and YAML governance artifacts. If DriftGuard ever adopts an index, it should be a git-native committed artifact, not an ephemeral local database.

### DISCARD — premature index builds

No `driftguard-graph` variant. No port of any of the above. The documented benchmark caveat is that gains vanish on small substrates and the tool becomes pure overhead. A DriftGuard index is worth revisiting only when a repo portfolio is large enough that an agent demonstrably rummages — not before, and not speculatively.

---

## 2026-07-31 — Meta "Remember When It Matters": unattended-build provision

_Full entry retained from the original log; the validation summary is carried into the pre-launch scan above._

### USE NOW — unattended-build provision for BUILD_INSTRUCTIONS v2

The pattern matters most where DriftGuard is currently weakest: fully automated build sessions with no human in the loop. Today the "Read from ANCHOR: Section X" lines are spec-time re-anchors, scheduled by a human when the BUILD file is written. They cover session boundaries. They do not cover within-session decay during a long unattended run, because nobody is present to notice the agent retrying a failed command or ignoring a constraint it acknowledged forty steps ago. Meta's result says a runtime judge closes exactly that gap, without touching the action agent.

Capture into the pending template v2 spec as an optional unattended mode, harness-layer, spec-level hook only. The operator may nominate a watcher — a second, cheaper model — for unattended runs; it sits beside the build agent, and the build agent is not modified. The watcher's memory bank is seeded from the repo rather than built from scratch: ANCHOR as knowledge, BUILD step state as status, use-ledger as procedural memory. One anchor, now four consumers. The watcher's authority is constrained to memory-grounded reminders — pointers back to anchor sections and ledger entries — and it may not issue strategy, amend rules, or edit the repo, which keeps it inside Layer 5 discipline: the watcher enforces the constitution, it cannot rewrite it. Reminders are transient, injected into the next model call only and never written into the durable record, so repo-as-state stays clean. Watcher interventions and escalations append to the use-ledger, so the durable record shows that re-anchoring happened without the reminders polluting it. The escalation ladder gains a rung: an attempt-cap breach in unattended mode triggers a watcher reminder first and halt-and-page-human second.

Two supporting mechanics are worth mirroring. The paper edits its memory bank through a small set of constrained tool calls — the same discipline as the tracker patch schema, deterministic operations rather than hand-edits. And its per-step decision is binary, intervene or explicitly decline, which maps cleanly onto a checkable escalation rule.

### WATCH — cheap watchers are coming

Meta fine-tuned an open-weight model as the memory agent and the gains transferred. The intervention policy is learnable, which means the cost of running a watcher will fall toward commodity. When harness options are next reviewed, check whether any have absorbed a proactive-reminder mode — that would make the unattended-mode provision a config flag rather than custom work.

### DISCARD — no watcher build, no new variant

DriftGuard does not build the watcher. It is harness-layer, the same class as dollar-budget enforcement. DriftGuard's job is to make its repos the best possible memory bank for whatever watcher the harness supplies. Any "driftguard-watcher" variant impulse is the architect's trap in a lab coat.

---

## Standing sources

- Karpathy, "Software Is Changing (Again)," YC AI Startup School, June 2025.
- Wu et al., "Remember When It Matters: Proactive Memory Agent for Long-Horizon Agents," arXiv:2607.08716.
- github.com/github/spec-kit and github.github.com/spec-kit.
- platform.claude.com/docs — context editing and memory tool.
- Anthropic, 2026 Agentic Coding Trends Report (landing page observed; full report is gated and has **not** been read — do not cite figures from it until it has been).

---

**End of file.**
