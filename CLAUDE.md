# writing-kit

This repo is a personal writing system built around a specific communication style.
It is not a general-purpose style guide. It is calibrated to one person.

## What's here

|File|Purpose|
|-|-|
|`system\_prompt.md`|Drop this into any Claude conversation to get writing in the right voice|
|`prd\_template.md`|PRD skeleton with voice-aware section prompts|
|`examples/`|Input/output pair demonstrating the system prompt working|

## How to use

**For a new doc:** Open a Claude conversation, paste the contents of `system\_prompt.md`
as a system prompt (or at the top of your first message), then describe what you need.

**For editing existing writing:** Paste `system\_prompt.md`, then paste your draft with
the instruction: "Rewrite this in my voice. Keep all the facts. Change the structure
and tone to match the style guide."

**For PRDs specifically:** Use `prd\_template.md`. The section prompts are written to
pull the right information out of you, not just label blank boxes.

## What this is not

This is not a prompt library of generic templates. If you're looking for
"write me a professional email" — wrong repo. This is for when the writing
needs to sound like a specific person made a specific decision and is telling
you about it directly.

## Using this repo with the 4D framework

This repo is designed around Anthropic's AI Fluency Framework. Each file maps
to a different competency:

|D|What it means|Where it lives in this repo|
|-|-|-|
|**Delegation**|Decide what to hand off to AI vs. keep for yourself|You own the facts, decisions, and judgment. AI drafts the prose.|
|**Description**|Communicate intent clearly|`system\_prompt.md` is your standing description — load it before every writing session|
|**Discernment**|Evaluate outputs critically|`examples/` is your reference point. Ask: would I send this? Does it sound like me?|
|**Diligence**|Take responsibility for what you publish|See diligence statement below|

**A note on Delegation:** the boundary matters. AI should draft, restructure,
and suggest. You should decide what's true, what the recommendation is, and
whether the output is accurate before it leaves your hands. If you're unsure
about a fact in an AI-generated draft, that uncertainty is yours to resolve —
not the model's.

## Maintenance

When your style evolves, update `system\_prompt.md` first. The examples will
drift out of date if you don't update them too — treat `examples/` as a test
suite, not documentation.

\---

## Diligence statement

The files in this repo were developed collaboratively with Claude (Anthropic).
The voice, frameworks, examples, and editorial judgments reflect the repo
owner's own style and thinking. AI was used to draft, structure, and iterate
— all content has been reviewed and approved by the author before use.

When outputs from this writing system are used in professional contexts,
the author takes full responsibility for accuracy, tone, and appropriateness.
AI assistance does not transfer ownership of the work or the decisions it reflects.
