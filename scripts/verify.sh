#!/usr/bin/env bash
#
# verify.sh — run before every push.
#
#   ./scripts/verify.sh            check the repo as-is (ORG placeholders allowed)
#   ./scripts/verify.sh --published  also require that no ORG placeholder survives
#
# Needs python3. Nothing else. Exits non-zero on any failure.
#
# This exists because a hand-typed "2 actionable items and 12 blocked ones"
# survived an adversarial review, a commercial-governance pass, and two more
# edits — on a repo whose central argument is not stating numbers you have not
# checked. The lesson was not "be more careful". It was that a derived number
# living in prose will always drift, so the check has to be mechanical.

set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.." || exit 1

PUBLISHED=0
[[ "${1:-}" == "--published" ]] && PUBLISHED=1

FAILED=0
pass() { printf '  \033[32mok\033[0m   %s\n' "$*"; }
fail() { printf '  \033[31mFAIL\033[0m %s\n' "$*"; FAILED=1; }
head_() { printf '\n\033[1m%s\033[0m\n' "$*"; }

# ---------------------------------------------------------------------------
head_ "Derived numbers in prose"

# The specific failure this file was written for. A count typed into a sentence
# is a claim about data the sentence cannot see.
# Scanned in python rather than grep so that embedded <script type="application/
# json"> data blocks are skipped — a note inside the tracker seed quoting the
# original defect is a record, not a live claim. A line carrying the marker
# "verify:allow-count" is also skipped, for deliberate historical quotation.
python3 - <<'PYEOF'
import re, os, sys
PAT = re.compile(
    r'[0-9]+ (actionable|blocked|not-started|parked|complete) (item|items|ones)'
    r'|(Fifty|Sixty|Seventy|[0-9]+)[- ]?(seven |odd )?files landed', re.I)
SEED = re.compile(r'<script type="application/json".*?</script>', re.S)
hits = []
for dp, dn, fn in os.walk('.'):
    if '.git' in dp: continue
    for f in fn:
        if not f.endswith(('.md', '.html')): continue
        p = os.path.join(dp, f)
        txt = open(p, encoding='utf-8').read()
        if f.endswith('.html'):
            txt = SEED.sub(lambda m: '\n' * m.group(0).count('\n'), txt)
        for n, line in enumerate(txt.splitlines(), 1):
            if 'verify:allow-count' in line: continue
            if PAT.search(line):
                hits.append('%s:%d: %s' % (os.path.relpath(p), n, line.strip()[:150]))
if hits:
    print("  \033[31mFAIL\033[0m a count is hand-typed in prose — point at the tracker instead:")
    for h in hits: print("       " + h)
    sys.exit(1)
print("  \033[32mok\033[0m   no hand-typed item or file counts in prose")
PYEOF
[[ $? -eq 0 ]] || FAILED=1

# ---------------------------------------------------------------------------
head_ "Tracker data"

python3 - "$PUBLISHED" <<'PY'
import json, sys, io, re, collections
ok = True
def bad(m):
    global ok; ok = False; print("  \033[31mFAIL\033[0m %s" % m)
def good(m): print("  \033[32mok\033[0m   %s" % m)

try:
    t = json.load(open('docs/data/tracker.json'))
    v = json.load(open('docs/data/variants.json'))
    good("tracker.json and variants.json parse")
except Exception as e:
    bad("JSON does not parse: %s" % e); sys.exit(1)

def seed(path, sid):
    h = io.open(path, encoding='utf-8').read()
    m = re.search(r'<script type="application/json" id="%s">(.*?)</script>' % sid, h, re.S)
    return json.loads(m.group(1)) if m else None

if seed('docs/tracker.html', 'seed') == t:
    good("tracker.html embedded seed matches tracker.json exactly")
else:
    bad("tracker.html seed has DRIFTED from tracker.json — regenerate it")

if seed('docs/index.html', 'seed-variants') == {'variants': v['variants']}:
    good("index.html variants seed matches variants.json")
else:
    bad("index.html variants seed has drifted")

if seed('docs/index.html', 'seed-tracker') == {'gate': t['gate'], 'updated': t['updated']}:
    good("index.html gate seed matches tracker.json")
else:
    bad("index.html gate seed has drifted")

ids = {i['id'] for i in t['items']}
by  = {i['id']: i for i in t['items']}
der = collections.defaultdict(list)
dangling = []
for i in t['items']:
    for b in i['blockedBy']:
        if b not in ids: dangling.append((i['id'], b))
        else: der[b].append(i['id'])
if dangling: bad("blockedBy points at ids that do not exist: %s" % dangling)
else: good("no dangling blockedBy references")

asym = [i['id'] for i in t['items'] if i['blocks'] != sorted(set(der.get(i['id'], [])))]
if asym: bad("blocks is not derived from blockedBy for: %s" % asym)
else: good("blocks derived correctly from blockedBy (%d items)" % len(t['items']))

seen, stack, cyc = set(), set(), []
def walk(n):
    if n in stack: cyc.append(n); return
    if n in seen: return
    stack.add(n); seen.add(n)
    for b in by[n]['blockedBy']: walk(b)
    stack.discard(n)
for i in ids: walk(i)
if cyc: bad("dependency cycle at %s" % cyc)
else: good("dependency graph is acyclic")

TERM = {'complete','in-progress','parked','retired'}
wrong = []
for i in t['items']:
    if i['status'] in TERM: continue
    exp = 'blocked' if (i['id'] == 'gate-00' or any(by[b]['status'] != 'complete' for b in i['blockedBy'])) else 'not-started'
    if i['status'] != exp: wrong.append((i['id'], i['status'], exp))
if wrong: bad("status does not follow statusRule: %s" % wrong)
else: good("status follows statusRule for every item")

c = collections.Counter(i['status'] for i in t['items'])
print("       current state: %s" % dict(c))
sys.exit(0 if ok else 1)
PY
[[ $? -eq 0 ]] || FAILED=1

# ---------------------------------------------------------------------------
head_ "Links"

python3 - <<'PY'
import re, os, sys
bad, n = [], 0
for dp, dn, fn in os.walk('.'):
    if '.git' in dp: continue
    for f in fn:
        if not f.endswith(('.md', '.html')): continue
        n += 1; p = os.path.join(dp, f)
        for m in re.finditer(r'(?:\]\(|href=")([^)"\s#\']+)', open(p, encoding='utf-8').read()):
            t = m.group(1)
            if t.startswith(('http', 'mailto:', '#', 'data:', "'")) or '+' in t: continue
            if not os.path.exists(os.path.normpath(os.path.join(os.path.dirname(p), t))):
                bad.append((os.path.relpath(p), t))
if bad:
    print("  \033[31mFAIL\033[0m %d broken relative link(s):" % len(bad))
    for f, t in bad: print("       %s -> %s" % (f, t))
    sys.exit(1)
print("  \033[32mok\033[0m   every relative link resolves (%d files)" % n)
PY
[[ $? -eq 0 ]] || FAILED=1

# ---------------------------------------------------------------------------
head_ "Dashboards"

if grep -qE 'api\.github|fetch\(["'"'"']https?://' docs/index.html docs/tracker.html 2>/dev/null; then
  fail "a dashboard makes an external network call — design principle 6 forbids it"
else
  pass "dashboards call no external API"
fi

if grep -qE '<script[^>]+src=|<link[^>]+href="https?://' docs/index.html docs/tracker.html 2>/dev/null; then
  fail "a dashboard loads an external asset — they must work from file://"
else
  pass "dashboards load no external assets"
fi

# ---------------------------------------------------------------------------
head_ "Front gate"

# grep -c prints "0" *and* exits 1 when there are no matches, so a `|| echo 0`
# fallback appends a second zero and the count matches neither branch below.
GATECOUNT=$(grep -c 'NAMED PERSON — OPERATOR MUST FILL' ANCHOR.md 2>/dev/null) || GATECOUNT=0
if [[ "$GATECOUNT" == "1" ]]; then
  pass "front gate is closed and intact (publishing this way is deliberate)"
elif [[ "$GATECOUNT" == "0" ]]; then
  pass "front gate has been filled — check it names a real person, not a category"
else
  fail "the gate placeholder appears $GATECOUNT times; expected 0 or 1"
fi

# ---------------------------------------------------------------------------
head_ "Placeholders"

# scripts/, and the files that document the placeholder rather than use it,
# legitimately contain the literal token. Only real placeholders count.
ORGS=$(grep -ro '\bORG\b' --include="*.md" --include="*.json" --include="*.html" . 2>/dev/null \
  | grep -vE '^\./(GLOSSARY|CLAUDE|AGENTS|BUILD_INSTRUCTIONS)\.md|^\./docs/LAUNCH_CHECKLIST\.md|^\./scripts/' \
  | wc -l | tr -d ' ')
if [[ "$PUBLISHED" == "1" ]]; then
  if [[ "$ORGS" == "0" ]]; then pass "no ORG placeholders left"
  else fail "$ORGS ORG placeholder(s) still present — run the substitution before publishing"; fi
else
  pass "$ORGS ORG placeholder(s) present (expected until you substitute your owner)"
fi

# ---------------------------------------------------------------------------
head_ "Gates you still owe"

grep -q 'operator_review: required' BUILD_INSTRUCTIONS.md 2>/dev/null \
  && echo "       Step 0.5 walkthrough is operator_review: required — it is not automatic" \
  || true
echo "       Open BLOCKING items live in docs/LAUNCH_CHECKLIST.md"

# ---------------------------------------------------------------------------
if [[ "$FAILED" == "0" ]]; then
  printf '\n\033[32mAll checks passed.\033[0m\n\n'
else
  printf '\n\033[31mVerification failed. Fix the above before pushing.\033[0m\n\n'
fi
exit "$FAILED"
