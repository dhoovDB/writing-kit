# Voice Check

This prompt operationalizes the **Discernment** layer of the 4D framework.
`examples/` in this repo is a test suite; voice-check is what runs it. Pair
with `rewrite-in-voice.md` (which rewrites); voice-check is the verify step
and never rewrites.

Work in plan/report mode for this entire prompt. Score the draft, quote
offenders, recommend a next step. Do not edit, restructure, or rewrite the
draft — that belongs to `rewrite-in-voice.md`.

---

## Procedure

### 1. Load the rules at runtime

Read `VOICE.md` from the writing-kit repo **fresh** at the start of every run.
Do not work from cached recollection — `VOICE.md` evolves; this prompt lags if
it hardcodes the rule list. The sections you score against are:

- "Before you write anything"
- "Structure rules" (and "The define-then-translate pattern")
- "Data rules"
- "Brevity" (the cut list)
- "Tone rules" (do / do not)
- "Consequences face outward"
- "What a good output looks like" / "What a bad output looks like"

Your hard-fail and soft-flag lists below are **derived** from those sections.
If `VOICE.md` adds a new banned construction or retires an old one, your scan
should reflect that automatically because you re-read it each run.

### 2. Read the draft

If the user gave a file path, Read it. If they pasted text, treat the message
body as the draft. If both, the file is the draft and the message is context.

### 3. Scan every sentence

Walk the draft sentence-by-sentence. For each sentence, check it against:

**Hard fails** (any one = failed output, per "What a bad output looks like"):

- `not X but Y` / `not X, it is Y` constructions — scan every sentence for the
  word `not` followed by a contrast. This is the most-violated rule and the
  hardest to catch.
- Em-dashes (`—` or `--`). Use a period, a comma, or restructure.
- The word "very" (Twain's "damn" substitute rule).
- Filler / corporate words: `leverage`, `synergies`, `impactful`, `delve`,
  `seamless`, `robust`, `table stakes`.
- Throat-clearing openers: `In order to`, `Given that`, `As we think about`,
  `In today's rapidly evolving`, `It is worth noting`.
- Hedging: `potentially`, `I think we should consider`, `it may be worth`,
  `perhaps`, `arguably` (when used to soften a claim, not to acknowledge one).
- Announcing what comes next: `Here is the world it lives in`, `Think of it
  in terms you already know`, `Here is why that matters`, `Here is the problem
  it solves`.
- Buried point — the first sentence is not the conclusion / recommendation /
  ask. If the point appears at sentence 3+, hard fail.

**Soft flags** (count them; 3+ tips the verdict to NEEDS WORK):

- Sentence that restates the previous one in different words.
- Word that does not change the meaning if removed (`quite`, `rather`,
  `somewhat`, `just`, `actually` in non-contrastive use).
- Paragraph longer than 5 sentences without a clear two-job structure.
- Passive voice that avoids ownership (`a decision was made`, `it was decided
  that`). Active voice with a named subject is the bar.
- Manufactured slogan / kicker (`Build it once, share it everywhere`-style
  lines that perform cleverness rather than deliver the point).
- Domain jargon borrowed from an adjacent field without translation (e.g.
  `blast radius` outside an engineering audience).
- Define-then-translate missing on a first technical reference for a
  cross-functional audience.
- Consequences framed inward (named the internal metric, not the customer's
  situation) when the draft is about a customer-facing failure.
- Number ≥ ~$50M or a percentage without a concrete reference class
  (Ireland's GDP, the weight of all the ants on earth, etc.).
- Hedging a strong claim by inventing a sympathetic reader to validate it.

### 4. Adjudicate before flagging

Quote the offending sentence in full and name the rule. **Do not auto-fail on
a token match.** Context matters:

- A banned word inside a quoted passage, code block, or list of bad examples
  is not a violation. The Twain quote in `VOICE.md` itself uses "very" — that
  is the rule explaining the rule, not breaking it.
- An em-dash inside someone else's quoted text passes; the writer did not
  choose it.
- Deadpan use of a corporate word for ironic effect (rare) passes if the
  irony is unmistakable. If you have to argue for it, it fails.

When in doubt, surface the sentence with a note ("flagged for human
adjudication: appears inside a quoted block"), and let the reader decide.
A vague auto-fail is worse than a flagged candidate.

### 5. Render the report

Return exactly this structure:

```
## Voice Check: <draft title or path>

**Verdict.** PASS | NEEDS WORK | FAIL

**Hard fails (N).**
- "<full sentence>" — <rule violated> (<section in VOICE.md>)
- ...

**Soft flags (N).**
- "<full sentence>" — <rule> (<section>) — <one-line reason>
- ...

**Strengths.** <2–4 specific things the draft does right, citing VOICE.md
sections by name>

**Suggested next step.** Send as-is | Light edit (specific sentences above) |
Run `rewrite-in-voice.md`
```

Verdict rules:

- **PASS** — zero hard fails, ≤2 soft flags.
- **NEEDS WORK** — zero hard fails, 3+ soft flags.
- **FAIL** — any hard fail.

### 6. Reproduce the examples (the test-suite check)

Running this prompt against `examples/NIM-explain/output.md` and
`examples/meridian-prd/output.md` must return **PASS**, and "Strengths" should
name the same rules the matching `output.md`'s "What to notice in this output"
table calls out (define-then-translate, unexpected comparison, consequences
face outward, inline data with reference class, no hedging, brevity). If
voice-check FAILs an example, either the example is stale or the prompt is —
investigate before scoring real drafts.

---

## What NOT to do

- Do not rewrite the draft. Rewriting belongs to `rewrite-in-voice.md`.
- Do not load voice rules from memory. Read `VOICE.md` fresh each run.
- Do not auto-fail on a token match without examining context (quotations,
  code blocks, intentional examples of bad form).
- Do not give vague feedback. Every flag quotes the specific sentence and
  names the specific rule. "The tone feels off" is not a flag; that's the
  failure mode this prompt exists to replace.
- Do not optimize for a high PASS rate. The Discernment layer's value is in
  catching drift, which means saying NEEDS WORK or FAIL when the draft
  deserves it.

---

## Notes

The question this prompt operationalizes is: "Would I send this?" — applied
with `VOICE.md` as the rubric. The human still makes the call after the
report. voice-check shows them what to look at, not what to change.
