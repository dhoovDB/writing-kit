# writing-kit — Roadmap

## What this builds toward

writing-kit is the portfolio's writing system and conventions hub: a personal
voice calibrated to one person, plus the PRD templates and prompt library
(`globalrules`, `dailytask`, `codereview`) that every other repo runs on. It
builds toward a complete, self-checking toolkit — not just a voice to write in,
but the tools to verify a draft matches it and to reuse the voice everywhere it
is needed.

This file is the priority-ordered backlog. The `dailytask.md` prompt reads it
top-down: P1 before P2, with learning value and 1–2 hour scope as tiebreakers.
Update before every commit.

**Constraints live elsewhere.** Voice rules are in `VOICE.md`; working
norms are in `CLAUDE.md` and `prompts/globalrules.md`. Read those before picking
a task — this file lists *what*, not *how*.

---

## Now (P1)

### rewrite-in-voice.md — saved editing prompt
- **What:** A reusable prompt for the "rewrite this in my voice, keep all the
  facts, change structure and tone" workflow.
- **Why:** The `README.md` documents this exact workflow in prose, but it gets
  retyped every time instead of saved.
- **Done when:** `prompts/rewrite-in-voice.md` exists; it preserves every fact
  while restructuring; it names `voice-check.md` as the verify step.

---

## Next (P2)

### decision-memo.md — decision memo template
- **What:** A voice-aware one-pager template for communicating a decision: the
  call, why, what changes, what's needed.
- **Why:** The repo's stated purpose is writing for "when a specific person made a
  specific decision and is telling you about it" — yet `prd_template.md` is the
  only template that exists.
- **Done when:** `prompts/decision-memo.md` exists; it leads with the decision and
  follows the `VOICE.md` structure (point → why → data → so-what).

### exec-update.md — executive status update scaffold
- **What:** A scaffold for a status / stakeholder update that enforces the
  "executive audience: point + one data point + ask" rule.
- **Why:** `VOICE.md` defines the exec-audience rules in detail but
  provides no template that applies them.
- **Done when:** `prompts/exec-update.md` exists; output is point + one data point
  + ask, with everything else pushed to backup.

---

## Backlog (not yet prioritized)

Captured from the 2026-05-23 skill/prompt review so they aren't lost. Promote to
P-tier when ready.

- **email-reply.md** (P3 prompt) — voice-aware reply that respects the "verbal vs.
  written register" rules; uses the Gmail MCP.
- **personal-voice** (skill) — wrap `VOICE.md` as a loadable skill so any
  repo can pull the voice and generic skills defer to it.
- **define-then-translate** (skill) — the signature technical-definition →
  plain-language pattern, reusable beyond writing-kit.
- **stakeholder-update** (skill) — recurring exec/stakeholder update generator;
  gap in `pm-skills` (has `release-notes`, `summarize-meeting`, not this).
- **Reconcile** `prd_template.md` (writing-kit) vs `create-prd` (pm-skills) — pick
  a canonical one; have the other reference it.

---

## Decision log

*Project and architectural decisions live here. Changes to this repo's CLAUDE.md
are logged in CLAUDE.md, not here.*

### 2026-05-29 — voice-check.md loads VOICE.md at runtime, doesn't hardcode the rules

The first instinct on a voice-check prompt is to enumerate the banned words and
constructions inline. That makes the prompt thin and self-contained, but it
silently goes stale every time `VOICE.md` evolves — the prompt and the rubric
drift apart, and `examples/` (the test suite) stops catching real violations.
`voice-check.md` therefore re-reads `VOICE.md` fresh at the start of every run
and treats its own hard-fail / soft-flag lists as *derived* scaffolding from
the named sections. The prompt is thin glue; `VOICE.md` remains the single
source of truth. Same shape as the config-is-data / engine-is-rules pattern
the other portfolio repos use.

### 2026-05-30 — Source/destination filename parity + sync script

The slash-command source-of-truth (`prompts/`) and the live install
(`~/.claude/commands/`) were related by hand-copy and quietly disagreeing on
one filename: source held `daily-task.md` (hyphenated), destination held
`dailytask.md` (no hyphen, matching the `/dailytask` invocation). Working
fine until somebody touched the source name and the destination didn't
follow. Two changes lock this down:

- **`prompts/daily-task.md` → `prompts/dailytask.md`.** Rename via `git mv`
  so history is preserved. Source and destination filenames are now
  identical for all three live commands (`globalrules`, `dailytask`,
  `codereview`). No mapping needed inside the sync script — pure file copy.
  The one ROADMAP reference to `daily-task.md` (intro paragraph naming the
  prompt that reads this file) updated in lockstep.
- **`scripts/sync-commands.ps1`** is the canonical sync path. PowerShell
  (matches the user's primary shell); minimum behavior plus skip-if-identical
  via SHA-256 hash comparison (avoids spurious mtime updates; safe to run on
  any schedule). Promoting a new prompt to a live slash command means adding
  one entry to the script's `$commands` list — a deliberate one-line act, not
  a side-effect of having the prompt file exist.

The 2026-05-30 `VOICE.md` rename incident is the canonical case this prevents.
A regex sweep that morning silently missed seven backslash-escaped references
in `README.md` and `CLAUDE.md`; the live `/globalrules` install kept pointing
at the old filename until a manual re-sync caught it. With the script in
place, the sync step becomes muscle memory after any prompt edit.

### 2026-06-14 — VOICE.md author-leakage guard, self-violation cleanup, and product-management-philosophy.md split

A working session adding voice markers and tone rules surfaced three
structural problems in `VOICE.md`, fixed in order:

- **Author leakage.** The file leaned on Stephenson, Adams, and Twain
  throughout but never forbade them from reaching the output, and
  modeled the leakage in three in-instruction flourishes (the "42"
  hedge example, the Vogon-poem consequence close, the Total Perspective
  Vortex diligence close). Added a top-level "Keep the authors out of
  the output" guard; rewrote the three flourishes author-free; kept the
  technique-naming references (define-then-translate, the zoom-out
  "Stephenson move"); changed the Usage iteration dials from author
  names to techniques ("more absurdist / zoom-out / cut-to-the-bone").

- **Self-violations.** The file broke its own "no 'not X, it is Y'
  contrast" rule in five prose spots (Cagan x2, Test-and-learn,
  executive audience, humanity-first marker), all rewritten to state
  the stronger claim. Two em-dashes in the PM sub-headers went away
  with the restructure.

- **Redundancy.** The wonder/humor idea had spread across four
  overlapping passages; cut the duplicate "Wonder without performing
  it" marker, folded its one unique line into the Do-not prohibition,
  tightened two others, merged two near-identical brevity bullets, and
  dropped a repeated not-X scan from the Usage section.

**product-management-philosophy.md split.** The entire
Product-management-philosophy block (Reuse-over-rebuild, Davis, Cagan,
Test-and-learn, product-challenge) moved to a new
`product-management-philosophy.md`. The name is spelled out in full to
keep it from reading as *project* management. `VOICE.md` governs how you
write; `product-management-philosophy.md` governs what you decide to
build. The five-bullet bottom line is mirrored in both files; `VOICE.md`
keeps a pointer. `CLAUDE.md` and `README.md` file tables document the
new file and when to load which.

### 2026-06-14 — product-management-philosophy.md: founding sources added

Built out the new file with three named sources behind the product
philosophy, each parsed from material the user supplied and distilled
into the file's voice:

- **Lean Startup (Eric Ries).** Build-Measure-Learn, the MVP, validated
  learning, pivot-or-persevere, and the "should we build this" reframe.
  Placed before Test-and-learn, which was trimmed of the
  smallest-experiment and output-is-motion lines that Lean Startup now
  covers.
- **First-principles thinking.** Reason from what is true, break the
  goal into levers, question each, go to the source. The Five Whys
  (parked from Lean Startup) folded in as the "keep asking why until you
  hit the floor" move. Placed after Reuse-over-rebuild with a one-line
  bridge: reuse is the default, first principles pressure-tests it.
- **The 4 Disciplines of Execution (4DX).** The execution phase the doc
  lacked: one or two WIGs, lead measures, a scoreboard, a weekly
  cadence, all against the whirlwind. Placed last, capping the arc that
  runs from thinking through deciding and validating to executing.

The mirrored five-bullet bottom line gained two bullets (Lean Startup
folded into the hypothesis bullet; 4DX lead measures added) and stayed
in sync across `product-management-philosophy.md` and `VOICE.md`.
First-principles got no bottom-line bullet, to hold the BLUF lean.

---

## Completed

- [x] **voice-check.md — run examples/ as a test suite** (2026-05-29) —
      `prompts/voice-check.md` lives in the prompt library. Loads `VOICE.md`
      at runtime, scans for hard-fail constructions (`not X but Y`, em-dashes,
      "very", filler words, throat-clearing openers, hedging, buried point)
      and soft flags, quotes offending sentences in full, names the rule and
      its `VOICE.md` section, and recommends a next step. Pairs with the
      forthcoming `rewrite-in-voice.md`. See the 2026-05-29 decision log entry
      for the runtime-loading choice.

---

*Last updated: 2026-06-14 (VOICE.md overhaul + extraction to `product-management-philosophy.md`; then the new file built out with founding sources: Lean Startup, first-principles thinking, and 4DX, with the bottom line kept in sync across both files)*
