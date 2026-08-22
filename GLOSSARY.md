# Glossary — plain-English terms from this project

Every term used in the README and the templates, one line each, in ordinary words. No definition here needs another definition to make sense of it.

If you're new to all of this, read the first five and skip the rest until you hit something that confuses you.

## The basics

- **Repo** (short for repository) — a folder for a project that also remembers every version of itself. Like a filing cabinet that keeps a copy of every draft, not just the latest one. GitHub is a website that hosts these folders.
- **Git** — the thing doing the remembering. It takes a snapshot every time you say "save this version", so you can look back at any point and see what changed and when.
- **Commit** — one snapshot, with a note attached saying what you changed. "Saved the login screen" is a commit.
- **Markdown** — plain text with a few simple marks for formatting: `#` for a heading, `**bold**` for bold. It's what this file is written in. You can open it in Notepad.
- **Fork** — your own copy of somebody else's project, which you can change freely without affecting theirs.

## The three DriftGuard files

- **Anchor** (`ANCHOR.md`) — the rules file. What you're building, who for, and what must never be broken. The AI reads it and is never allowed to rewrite it. Think of it as the constitution: everything else has to obey it.
- **Build instructions** (`BUILD_INSTRUCTIONS.md`) — the running order. Which part of the anchor to load at each step, what to check, what to save. Think of it as the recipe method, where the anchor is the list of things you're not allowed to substitute.
- **Use ledger** (`state/use-ledger.md`) — the diary. What you tried, what failed, what you skipped and why. The anchor holds what's *true*; the ledger holds what *happened*.

## How the method works

- **Closed-loop gate** — the rule that you draw the whole process and walk every person's journey through it *before* you build anything. Any journey that ends without that person finding out what happened is a missing feature.
- **Actor** — anyone who can change the state of your system. A customer submitting a form, an admin approving it, you publishing something. If they can change something, they are an actor.
- **Dead end** — a journey that finishes without the person learning the outcome of what they did. They submitted; nobody ever told them what was decided. It is a hole in the plan, not a bug in the code, so you fix it in the plan.
- **Actor loop closure** — the table where you write, for every actor: what they do, what changes, how they find out, and where they look. A blank cell means a missing feature.
- **Drift** — when decisions stop surviving. You decided something in week one, the AI contradicts it in week three, and nobody notices until something breaks.
- **Section addition** — the rule that you add to the anchor but never edit or delete what's already there. When a decision reverses, you write a new section explaining the change; the old one stays as the record of what you believed at the time.
- **The front gate** — the rule that you can't start building until you've written down a real person's name, what changes in *their* life, and how you'll know it worked. It's a deliberate speed bump, and it's the most useful thing in the method.
- **Named person** — an actual human with an actual name whom you could message this afternoon. "Small business owners" is not a named person. The difference matters because a real person can tell you no, and a category can't.
- **Signal** — proof that came from somebody other than you. "I finished it" isn't a signal. "They used it twice" and "they paid" are.
- **Band** — a stage of the project: Prototype, then MVP, then v1. You move up a band when you've *seen* the signal, not when you feel ready.
- **Proof gate** — the line between two bands. You cross it on evidence, never on a date.
- **Quarantined metric** — a number that's real, worth watching, and not allowed to prove anything. Stars, followers, traffic, sign-ups. They feel like progress and they aren't.
- **Ship cadence** — how often you have to put something in front of your named person. The strictest setting is every step, which is the default here.
- **Drift override** — the one-line note you write when you skipped shipping. It's never blocked. It's logged, because four of them in a row is a pattern you can see instead of a feeling you can argue with.
- **Variant** — the same method with an anchor shaped for a particular field. Research, courses, video, handing work to a contractor.
- **MVP** (minimum viable product) — the smallest version somebody can genuinely use, rather than the smallest version that technically runs.

## AI and tooling words

- **Model** — the AI itself. Claude, GPT, Gemini, Llama. The thing that generates the words.
- **Harness** — the software wrapped around a model so it can run automatically rather than through a chat box. Claude Code and Cursor are harnesses. DriftGuard deliberately isn't one.
- **Context window** — how much text the AI can hold in mind at once. Big now, and the paper cited in the README shows that being big doesn't stop it losing track of what matters.
- **Prompt** — what you type to the AI.
- **Agent** — an AI that takes several steps on its own rather than answering one question and stopping.
- **Session** — one continuous conversation. Close the tab and the session ends, taking everything it knew with it. That's the whole problem.
- **API** (application programming interface) — the paid pipe that lets software talk to a model directly instead of through a chat window. DriftGuard uses none, which is why nothing here can break when somebody changes their pricing.
- **API key** — the password that pipe needs. You don't need one for any of this.
- **Spec-driven development** — writing down what you want in detail before letting the AI build it. GitHub's Spec Kit is the popular tool for it. DriftGuard agrees with the idea and works on the part that happens between projects instead of inside one.
- **Local model / open-weight model** — an AI you run on your own machine rather than renting from a company. It can read markdown like any other, which is the point.

## Things you'll see in this repo

- **GitHub Pages** — free website hosting attached to a repo. It's what makes the two dashboards public web pages instead of files on your laptop.
- **Issue** — a note filed on a repo saying something is broken or missing. The way you report a problem.
- **Discussion** — the same thing but for conversation rather than bug reports.
- **PR** (pull request) — a proposed change to somebody's project, which they can accept or decline.
- **MIT licence** — the permissive one. Take it, change it, use it commercially, no permission needed.
- **Placeholder** — text like `ORG` sitting where a real value goes later, so you can see what's missing.
- **The architect's trap** — building more and more structure as a way of avoiding shipping anything. Named here because it's the specific failure this whole project exists to correct.
