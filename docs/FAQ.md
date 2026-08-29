---
title: FAQ
slug: faq
type: reference
status: active
version: 1.0
created: 2026-07-31
updated: 2026-07-31
---

# FAQ

Answers to the questions this project actually gets, rather than the ones it
would prefer. The longer competitive versions live in
[`docs/POSITIONING.md`](POSITIONING.md).

---

**Is this just Spec Kit with extra steps?**

Fair question, and if you build one codebase with one agent, Spec Kit is better
and you should use it. Its constitution lives in one repo and governs that
repo's build phases. This governs the seams between them: the same decisions
surviving a new session next month, a handoff to a contractor, a switch from
Claude to Cursor, and projects that are not code at all. Tessl's review of Spec
Kit lists stale specs, cross-project consistency, and multi-session maintenance
as things it does not address — that list is this project's problem statement.
They compose, and the README says to use both.

**There is no software here. It is just markdown files.**

Correct, and that is the design. Zero API calls, no server, no account, no
telemetry. That is why it survives a tool switch, a wiped machine, a provider
outage, and a pricing change. In May a provider announced re-pricing programmatic
agent usage, then cancelled it in June; every tool built on that assumption spent
a month planning for something that never arrived. Markdown in a git repo does
not have that failure mode. Judge it by whether the files help, not by how much
machinery ships with them.

**Context windows are enormous now. Isn't this solved?**

Two frontier labs say no. Meta's long-horizon-agent paper names *behavioral
state decay*: the requirements are still sitting in the context window and have
simply stopped influencing the next action. Their intervention lifted
Terminal-Bench 2.0 pass@1 from 37.6% to 45.9%, and a stronger action agent still
gained 2.4 points. Capacity is not the constraint; knowing when something matters
is. And none of that touches the case this is actually about, which starts at the
tab you closed last Tuesday.

**Anthropic ships memory now. Won't vendors absorb this?**

Part of it, and they should. If you work inside one provider's API, their memory
tool may be all you need. What a vendor is not incentivised to build is memory
that *leaves* — memory that follows you to a different model, opens in a
contractor's editor, and can be audited by a second human. Portability and
legibility to people are the parts that stay outside the platform.

**Do I have to use git?**

For the full benefit, yes — git is what makes the state durable and the history
auditable. But the anchor works on its own. You can put `ANCHOR.md` in a Google
Doc, a folder, or a note, and most of the value survives; what you lose is the
audit trail and the ability to reconstruct why a decision was made.

**Does this only work for software?**

The claim is that it works for any domain. The honest status is that this is
aspiration supported by one worked example, not a demonstrated fact. The
[worked example](../examples/worked-example/) is deliberately a newsletter, with
no code, no tests, and no deploy, precisely to show the machinery working
somewhere else. If nobody outside software adopts it within a quarter, the claim
comes out of the copy — that condition is written into
[`docs/POSITIONING.md`](POSITIONING.md#part-3--what-would-change-the-strategy).

**Which AI tools does it work with?**

Any that read markdown. Claude Code, Cursor, Windsurf, Cline, Aider, Gemini Code
Assist, Copilot, any CLI or API agent, local and open-weight models, and a human
contractor with a text editor. There is also an `AGENTS.md` at the root, so
agents honouring that convention pick up the governance with no integration work.

**Why can't I edit the anchor?**

Because a constitution you can quietly edit is a wiki page, and the failure this
prevents is precisely a decision being silently revised and then forgotten. Add a
section instead. Section 6 of the worked example does exactly that — it reverses
an earlier decision and leaves the original intact, so a later reader can see the
reasoning change rather than only the conclusion. Six months later, that is the
difference between "why is it like this?" and knowing.

**How long does it take to fill an anchor?**

About twenty minutes for the parts that matter, which are Section 1.0 and 1.1.
Fill those, then go and build something. Sections 2 onward get filled as the
build reaches them. Filling the whole document before building anything is the
exact failure this exists to prevent, and the template says so.

**Is it free? Will it stay free?**

MIT-licensed and free. The methodology and templates are the public artefact.
There is no promise here about what may be built commercially on top later,
because a promise like that is worth exactly nothing when made by a project this
young. What the licence guarantees is that what is published stays published and
stays forkable.

**Why is the name taken three times?**

Because the availability check was skipped. Three unrelated products use it,
including one holding the `DriftGuard` GitHub organisation.
[`docs/NAMING.md`](NAMING.md) documents all three with dates, explains why
publishing under a provisional name still beat waiting, and holds the rename
procedure. It is a real cost, honestly, and it is smaller than another quarter
unpublished.

**You have twenty projects and zero shipped. Why should I trust this?**

You shouldn't, on that basis, and the README opens with it. The methodology is
what was built to stop doing that, and this repository is the first artefact
where it is applied to itself — the anchor at the root is DriftGuard's own, and
its front gate names its **author** rather than a user, because this was built
for my own use. The signal is therefore self-generated, which fails the anchor's
own third test and is recorded as such in its Section 9.3. That is either the
most convincing thing here or the least, depending on your temperament. Check
back in a quarter and read the ledger.

**What is the fastest way to help?**

Let someone watch you try it. Thirty minutes, screen shared, filling in an anchor
for something you are actually building, while the author says nothing unless you
stall. The point where you stall is worth more than any amount of discussion
about it afterwards.
