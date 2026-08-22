# Contributing

This is an alpha methodology published in July 2026, and the most valuable thing you can contribute is not code.

## the three most useful contributions, in order

**1. Let me watch you try it.** Thirty minutes on a call, screen shared, while you fill in an anchor for something you're actually building. I say nothing unless you get stuck. The point where you stall is worth more than everything either of us could say about it afterwards. Open a Discussion and say so. (A booking link is planned; it lands with the feedback intake in Step 3.)

**2. Tell me where it broke.** Open an issue with the **Feedback** template — four questions, ninety seconds, partial answers welcome. What you tried, what happened, what you expected, what would have made it easier. If you got as far as filling in an anchor and then abandoned it, that's the one I most want. Abandonment is a signal and it's invisible from the outside.

**3. Tell me if the wording is wrong for you.** The first market for this is people who don't come from software, and the templates are currently written in developer register. That gap is named openly in the anchor as the known weak point. If a template assumes something you don't know, that's the artefact failing to communicate, not you failing to understand, and it's the highest-priority thing to fix.

## what happens after you file

Stated because the closed-loop gate caught this as a dead end in this project's own process: you could file the most useful thing here and have no way to learn whether it landed.

Every issue gets a reply or a close with a reason. Not fast — one person, no response-time commitment — but not silence either.

Feedback that changes the product gets a line in [`state/use-ledger.md`](state/use-ledger.md) with your issue number. That file is public and append-only, so you can see your own report land and see what it changed. If your issue is closed without a ledger line, it did not change anything, and the closing comment says why.

Pull requests get the same: a review or a close with a reason.

## what "a specific complaint" means

The project's own anchor sets its MVP proof gate as *somebody other than me filled in an anchor, used it across two sessions, and came back with a specific complaint.* A compliment doesn't clear that gate. A complaint does, because only a complaint proves the thing was actually used.

So complain specifically. "Section 1.2 asks for immutable constraints before I know what I'm building, so I made some up and then they were wrong" is worth a great deal. "Nice project" is worth nothing to either of us.

## pull requests

Roughly the kinds of change I'd take, and the kinds I wouldn't.

**Instant merge:**

- A typo, a dead link, a broken table, a command that doesn't run as written.
- A correction to any factual claim in the README or research log — with a source and the date you checked it. Two rows of the drift-vocabulary table are currently marked unverified; sourcing either one is a genuinely useful PR.
- A filled worked example from a domain that isn't software. Research, teaching, ops, legal, anything. The claim that this works outside code is currently aspiration supported by one example, and every real one moves it toward fact.
- A template rewrite driven by watching a real person stall on it, with the stall described in the PR.

**Probably no:**

- A build step, package manager, framework, or dependency for the dashboards. They're single files with no network calls, they work when you double-click them, and that's load-bearing rather than aesthetic. A change that makes them 5% nicer at the cost of `npm install` isn't worth it.
- Anything requiring an API key, server, quota, or account to use the methodology. That converts this into a harness and destroys the only durable advantage it has.
- Telemetry or analytics inside the repo itself.
- A separate marketing site. The README is the marketing surface.
- Softening the "use something else if" section. It's load-bearing: a tool that can't say when not to use it reads as a pitch.

**Grey area, open a Discussion first:** a new variant, a structural change to either template, anything that adds a required file.

If your PR has elements of the "probably no" list it doesn't mean it won't get merged — it means it's in grey territory and I'll want to talk about it first.

## contributing a variant

A variant is the same methodology with an anchor shaped for a specific domain. If you build one for a field not covered here, that's genuinely valuable — particularly a non-engineering field.

Open a Discussion before you start. Not for permission, but because the anchor's constraint 8 bars *me* from designing new variants while unshipped ones exist, and I'd rather point you at what already exists than watch you duplicate it.

A variant needs a `README.md` following the same shape, an `ANCHOR.md` for the domain, a `BUILD_INSTRUCTIONS.md` with a real sequence, and one filled example. The example isn't optional — a variant with no worked example is a template, and there are enough of those.

## working in this repo

**Never edit `ANCHOR.md`.** It grows by adding sections. This is the core rule of the whole method, and a PR that edits an existing anchor section gets closed with a pointer back to this line even when the edit is an improvement. If a decision recorded there is wrong, append a section saying what changed and why. The superseded section stays as the record of what was believed at the time.

**Justify additions with problems you actually hit.** Constraint 2 says features are justified by signals you observed, not ones you imagined. In practice: describe what went wrong in your own project before describing the fix.

**Source every factual claim.** Anything asserted about a competitor, a paper, or a vendor needs a link and the date you checked it. [`docs/RESEARCH_LOG.md`](docs/RESEARCH_LOG.md) shows the format, including how retired and unverified claims are marked. This isn't pedantry — a launch that asserts a cancelled billing change as current fact is exactly the stale-decision drift this project claims to prevent, and it very nearly happened here.

**Don't hardcode the product name.** It's provisional and it will change. Use the `PRODUCT` constant in the dashboards, and the plain string `DriftGuard` or `driftguard` in markdown, so one find-and-replace catches everything.

**Data, not markup.** The dashboards read `docs/data/*.json`. In `tracker.json`, `blocks` and `status` are derived — edit `blockedBy` and let the others follow. If you find yourself editing HTML to add a variant, something has gone wrong.

## code of conduct

Be decent. Disagree with the idea rather than the person. This project argues publicly that a competitor is better for the most common use case and publishes its own front gate as closed, so robust criticism of its claims isn't merely tolerated — it's the point.

Bad-faith participation, harassment, or personal attacks get one warning and then a block.

## licence

Contributions are accepted under the MIT licence, same as everything else here.
