# writing-kit — Roadmap

## What this builds toward

writing-kit is the portfolio's writing system and conventions hub: a personal
voice calibrated to one person, plus the PRD templates and prompt library
(`globalrules`, `dailytask`, `codereview`) that every other repo runs on. It
builds toward a complete, self-checking toolkit — not just a voice to write in,
but the tools to verify a draft matches it and to reuse the voice everywhere it
is needed.

This file is the priority-ordered backlog. The `daily-task.md` prompt reads it
top-down: P1 before P2, with learning value and 1–2 hour scope as tiebreakers.
Update before every commit.

**Constraints live elsewhere.** Voice rules are in `system_prompt.md`; working
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
  follows the `system_prompt.md` structure (point → why → data → so-what).

### exec-update.md — executive status update scaffold
- **What:** A scaffold for a status / stakeholder update that enforces the
  "executive audience: point + one data point + ask" rule.
- **Why:** `system_prompt.md` defines the exec-audience rules in detail but
  provides no template that applies them.
- **Done when:** `prompts/exec-update.md` exists; output is point + one data point
  + ask, with everything else pushed to backup.

---

## Backlog (not yet prioritized)

Captured from the 2026-05-23 skill/prompt review so they aren't lost. Promote to
P-tier when ready.

- **email-reply.md** (P3 prompt) — voice-aware reply that respects the "verbal vs.
  written register" rules; uses the Gmail MCP.
- **personal-voice** (skill) — wrap `system_prompt.md` as a loadable skill so any
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

*Stale-name note: this file, `README.md`, and `prompts/globalrules.md` still
reference `system_prompt.md` in a few places; the file on disk is `VOICE.md`.
Worth fixing in a follow-up cleanup pass — left out of this commit to keep
the scope tight.*

*Last updated: 2026-05-29*
