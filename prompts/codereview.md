# Code Review

Run this before committing any task. Reviews the current git diff against 
architecture constraints, security patterns, and code quality thresholds.
Works in plan mode only — does not modify any files.

---

## Step 1 — Fetch the diff

```bash
# What changed
git diff HEAD --name-only

# Full diff for analysis
git diff HEAD > /tmp/current.diff

# If reviewing staged changes only
git diff --cached > /tmp/current.diff
```

---

## Step 2 — Architecture check

For every changed file, verify it respects the layer boundaries defined 
in CLAUDE.md. Flag any of the following:

**Banking Empire:**
- Calculations or logic appearing in `renderer/canvas.js` → belongs upstream
  in `engine/`
- `useState` or `useEffect` appearing in `ui/` components → belongs in
  `BankingEmpire.jsx`
- Functions or arrow functions as values in `config/` files → belongs in
  `engine/`
- Engine functions that import React or call `setState` → remove the
  React dependency

**STR Host Assistant:**
- External API calls outside `src/api/` → isolate at the boundary
- Database writes outside `src/db/` → isolate at the boundary
- `process.env` reads at module top level → must be lazy, inside a
  function body
- Prompt assembly and Claude API call in the same function → split them
- State stored in localStorage → use Supabase

**All repos:**
- Config files containing logic → belongs in engine
- Engine functions with side effects → must be pure
- Smart components other than the designated root component → consolidate

---

## Step 3 — Security scan

```bash
DIFF=/tmp/current.diff

# Hardcoded secrets
grep -nE "(password|secret|api_key|token|private_key)\s*=\s*['\"][^'\"]{8,}" $DIFF

# AWS key pattern
grep -nE "AKIA[0-9A-Z]{16}" $DIFF

# SQL injection risk
grep -n "query\|execute" $DIFF | grep -E '\$\{|`.*\$'

# XSS vectors
grep -n "dangerouslySetInnerHTML\|innerHTML\s*=" $DIFF

# Eval / exec
grep -nE "\beval\(|\bexec\(" $DIFF

# Prototype pollution
grep -n "__proto__\|constructor\[" $DIFF

# Sensitive data in logs
grep -nE "console\.(log|error)\(.*\b(password|token|secret|key)\b" $DIFF
```

---

## Step 4 — Test coverage delta

```bash
# Source files changed vs test files changed
CHANGED_SRC=$(git diff HEAD --name-only | grep -vE "\.test\.|\.spec\.|__tests__")
CHANGED_TESTS=$(git diff HEAD --name-only | grep -E "\.test\.|\.spec\.|__tests__")

echo "Source files changed: $(echo "$CHANGED_SRC" | wc -w)"
echo "Test files changed:   $(echo "$CHANGED_TESTS" | wc -w)"
```

Flag if:
- New engine functions added without corresponding tests
- Existing tests deleted without corresponding code deletion
- Pure functions added with no test cases

---

## Step 5 — Breaking change detection

```bash
# Env vars added (might be missing in production)
grep "^+" /tmp/current.diff | grep -oE "process\.env\.[A-Z_]+" | sort -u

# Env vars removed (might break running instances)
grep "^-" /tmp/current.diff | grep -oE "process\.env\.[A-Z_]+" | sort -u

# Config schema changes
git diff HEAD --name-only | grep "config/"

# API route removals
grep "^-" /tmp/current.diff | grep -E "router\.(get|post|put|delete|patch)\("
```

---

## Step 6 — Commit discipline check

- Does this diff represent one logical change, or should it be split?
- Is ROADMAP.md updated if this completes a task?
- Is CLAUDE.md updated if this resolves an architectural decision?
- Are any changes present that are unrelated to the current task (besides markdown file updates)?
  If yes, flag them for a separate commit.

---

## Output format