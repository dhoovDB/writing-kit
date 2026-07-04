# Adversarial Review

This prompt operationalizes the Discernment layer of the 4D framework on
code instead of prose. It is the push-side review gate: self-authored
multi-commit work runs through this before `git push`. It does not replace
/codereview — that gate is per-commit; this one runs once over a session's
diff.

Work in report mode. Review, classify, and render a verdict. Do not edit
files during the review — fixes happen after the verdict, as their own step.

---

## Procedure

### 1. Load the skill at runtime

Read the adversarial-reviewer skill fresh at the start of every run:

    C:\Projects\claude-skills\engineering-team\skills\adversarial-reviewer\SKILL.md

Do not work from cached recollection — the skill evolves in claude-skills,
and this wrapper is thin on purpose so the SKILL.md stays the single source
of truth (the same runtime-loading choice voice-check.md makes with
VOICE.md). If the local clone is missing, fall back to the same path in
github.com/dhoovDB/claude-skills.

### 2. Determine the review target

- `--diff <range>` argument — review that commit range
  (e.g. `--diff HEAD~4` or `--diff main...HEAD`)
- A file path argument — review that file
- No argument — review staged and unstaged changes in the current repo

For the pre-push gate, the usual target is the session's unpushed work:
`--diff origin/main...HEAD`.

### 3. Run the skill as written

Follow the loaded SKILL.md exactly: all three personas (Saboteur, New Hire,
Security Auditor), each persona must surface at least one issue, findings
caught by two or more personas get promoted one severity level, and the
report ends in a structured BLOCK / CONCERNS / CLEAN verdict.

### 4. Honor the verdict

- **BLOCK** — do not push. Fix the findings, re-run this prompt.
- **CONCERNS** — surface the findings; the user decides whether to push.
- **CLEAN** — the push may proceed, subject to the normal commit-discipline
  gates in /globalrules.

---

## What NOT to do

- Do not soften the personas. A persona that "found nothing" is the failure
  mode this gate exists to catch — keep looking until each has a real finding.
- Do not substitute this for /codereview. Both run: /codereview per commit,
  this once per push.
- Do not fix findings inline during the review. Verdict first, then fixes as
  a separate step with their own commit.
