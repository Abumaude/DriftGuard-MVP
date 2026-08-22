# Worked example — a weekly newsletter

This is what a filled anchor and build file actually look like.

It is deliberately **not a software project**. Spec Kit and the spec-driven
tools cover code well; the reason to look at this example is to see the same
machinery applied to something with no repository, no tests, and no deploy — a
fictional one-person newsletter about UK small-business compliance. The people
and dates are invented; the structure is exactly what a real one should look
like.

Read `ANCHOR.md` first. Notice what is *not* in it: no content calendar, no
topic list, no design decisions. Those all change. The anchor holds only what
must not change — who it is for, what it must never do, and what proves it is
working.

Then read `BUILD_INSTRUCTIONS.md`. Note how it handles cadence: the six numbered
steps are one weekly loop, and the loop — not each step inside it — is what ships.
That is stated explicitly at the top of the file, because a cadence rule that is
quietly bent is worse than one that is honestly scoped.

## What this example is meant to teach

**An anchor is short.** This one runs to about four pages, and roughly half of
that is Section 1 — the part loaded into every session. If yours is running to
fifteen, you are specifying implementation, which belongs in the build file or
nowhere.

**The named person is a real name.** "Small business owners" would fail the
gate. "Priya, who runs the bookkeeping practice in Leicester" passes, because
Priya can say no.

**Constraints are things you would otherwise violate.** Constraint 7 here —
never a subject line the sender would be embarrassed to have quoted back —
exists because the operator knows she is tempted by clickbait when open rates
dip. A constraint that is easy to keep is decoration.

**The signal is behaviour, not applause.** "Priya said it was useful" is not
the MVP signal. "Priya forwarded it to a client unprompted" is, because it
costs her something.

**Sections get added, not edited.** Section 6 records a decision that reversed
an earlier one. The earlier decision stays in place. A future session reading
this can see both what was believed and what changed, which is the entire
purpose.

## Using it

Copy `templates/ANCHOR_TEMPLATE.md` and `templates/BUILD_INSTRUCTIONS_TEMPLATE.md`
from the root of this repository, not these files. These are filled in for
somebody else's project; the templates are empty for yours.

Then point any AI at your repo and say: *"Read BUILD_INSTRUCTIONS.md and run
Step 0."*
