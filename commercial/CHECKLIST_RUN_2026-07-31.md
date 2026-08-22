# Governance checklist run — 2026-07-31

**Asset:** master `README.md` (v4) and `docs/index.html`, the two public surfaces for the DriftGuard launch.
**Run by:** operator + AI assistant, one session. Internal review, not independent assurance (§16).
**Outcome:** 3 fails found and corrected, 2 items carried as open, 1 gate noted.

The fails are recorded before the passes. A checklist run that leads with what passed is a document written to be read approvingly rather than acted on.

---

## Fails found and corrected

### F1 — Synthetic example presented as evidence (§8, checklist B5)

The before/after exchange in the README's quick start — an AI inventing a rate-limiting rationale for what was actually a payment-sandbox workaround — is a constructed illustration. It shipped unlabelled, sat in the most persuasive position on the page, and was introduced with the words *"a real shape of exchange, not a marketing quote"*, which actively pushed a reader toward believing it was logged.

Nothing in it is dishonest about the *pattern*; the pattern is real and well documented. The defect is that a reader could not tell the difference between an illustration and a record, and the phrasing discouraged them from asking.

**Corrected.** Both exchanges now carry an explicit statement that they are constructed illustrations, that no real session was logged in this form, and that a made-up example reading like evidence is exactly what this project claims to be against. Same treatment on the dashboard. Registered as SYN-001. The filled anchor example (Dayo, Ikeja) got the same treatment as SYN-002.

### F2 — Unmeasured performance claim stated as measurement (§2, §8, checklist B2)

*"Twenty minutes, and about eleven of those are you thinking rather than typing."*

The twenty was an estimate from the operator's own use. The eleven was invented outright, and invented precision is worse than a round number because precision is itself a claim to have measured. No person outside the operator has ever filled in an anchor, so there is no sample, no timing, and no observation of a first run.

**Corrected.** Both figures removed. The section now says plainly that the estimate was dropped because nobody outside the author has done it, and that a number returns when somebody times a real first run. Logged QUARANTINED as CLAIM-002 with the restoration trigger attached.

### F3 — Internal review reading as independent verification (§16, checklist F1)

The repo carries "verified 2026-07-31" against roughly a dozen claims. All of that verification is one person and an AI assistant, in one session, checking public sources. That is internal review. It genuinely improves quality — it caught three retired claims during the July scan — and it is not an audit, not independent, and not attested by anyone.

No sentence in the repo *said* it was independent. The defect is that "verified" carries an implication the reader has no way to test, and §16 requires the conflict be made visible rather than left to inference.

**Corrected.** Disclosure added to the README under the sourcing note, to the Honest Box as a standing section, and at the top of the evidence ledger as a standing conflict declaration covering every entry.

---

## Open, not corrected

### O1 — Two quarantined claims still on public surfaces (§2, checklist B1)

The Anthropic "goal drift" and shadcn "what drifted" rows of the five-scope comparison table remain unsourced. They are marked unverified in place on all three surfaces, which is the minimum §2 allows, and marked is not sourced.

**Disposition:** blocking before any launch *post*, not before the repo goes public — the marking is honest and visible, and a launch post amplifies claims in a way a repo page does not. Source both or cut both. A three-row table where every row holds beats a five-row table where two do not. CLAIM-010, CLAIM-011.

### O2 — Constitution not operator-ratified

Applied in practice, not yet ratified as an act. Twenty non-negotiable commercial rules is precisely the kind of decision this project says should be recorded rather than drifted into. Both profiles read `DRAFT — not operator-ratified` until it happens; ratification belongs as an appended anchor section.

---

## Gate noted

**Dashboard gate (`MEASUREMENT_SPEC.md`).** The spec says build no dashboard until a product is live, real events exist, fields are captured consistently, and manual review has proved useful. This repo ships two dashboards.

Neither is a trust-measurement dashboard: `index.html` is a product page and `tracker.html` renders launch items that genuinely exist and are genuinely blocked. The gate governs the metrics dashboard, which is not built and is now barred from being built until the conditions are met. Noted rather than breached — and worth writing down, because "we have dashboards already" is exactly the reasoning that would let the barred one through later.

---

## The checklist

### A. Buyer reality

- [x] Addresses a real problem — two frontier labs document the mechanism (CLAIM-008).
- [x] Intended buyer identifiable — named in `PRODUCT_PROFILE.yaml`, and its weakness is named too.
- [x] Not presented as appropriate for everyone — "use something else if" sends the most common case to a competitor.
- [x] Required effort visible — Honest Box, "what you'll still need to do".

### B. Claims and evidence

- [x] Every material claim has a ledger entry — 14 entries.
- [x] Wording does not exceed evidence — **after F2**.
- [x] Comparisons use a fair basis — the Spec Kit concession leads.
- [x] Numbers authentic and scoped — Meta figures attributed to Meta's intervention, never ours.
- [x] Synthetic examples labelled — **after F1**.

### C. Disclosure

- [x] Material limitations before adoption — Honest Box, linked from the masthead.
- [x] "Not for you" cases are real — the first one is the most common use case.
- [x] Honest Box includes weaknesses a competitor could exploit — zero external users, no enforcement, wrong register for the stated market.
- [x] Exclusions not buried — masthead placement, not an appendix.
- [x] Free/cheaper alternatives acknowledged — Spec Kit, a plain text file, provider memory tools. All three sincere.

### D. Psychological mechanisms

- [x] Framing rather than deception — the opening negation is checkable by opening the repo.
- [x] Scarcity/urgency maps to a real constraint — none present, none manufactured.
- [x] No fabricated popularity, countdown, stock or social proof — no testimonials at all, correctly.
- [x] Fear/shame/confusion not exploited — the failure story is the author's own.
- [x] SIMULATION-flagged mechanisms rejected — none present.

### E. Fulfilment

- [x] Delivery matches promise — the files are the product and they are all there.
- [x] Onboarding reduces foreseeable failure — quick start, worked example, glossary, no-git path.
- [x] Refund/cancellation plain — not applicable, stated rather than omitted.
- [x] Support expectations clear — one person, no response-time commitment, said so.
- [x] Marketing limitations match documentation — Honest Box and `PRODUCT_PROFILE.yaml` agree.

### F. Conflicts and provenance

- [x] Internal review not described as independent — **after F3**.
- [x] External attestation not claimed — none claimed anywhere.
- [x] Sources and derivations preserved — ledger, research log, DERIVED tier on CLAIM-009.
- [x] AI-generated assertions checked where material — that check is what produced F1–F3.

### G. Long-horizon test

- [x] Comfortable showing this to a dissatisfied user — the Honest Box was written for that reader.
- [x] Comfortable if a competitor quoted the claims verbatim — the strongest quote available to a competitor is "unproven, zero external users", which is already in our own copy.
- [x] Would keep the disclosure if it modestly reduced adoption — the "use Spec Kit instead" line is the test case and it stays.
- [x] Creates trust even for a qualified person who declines — sending them to Spec Kit is the intended outcome, not a leak.

---

## Next run

Before the long-form origin post and the short-form thread — both amplify claims beyond the repo page, and O1 is blocking for both.
