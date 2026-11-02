# writing-kit

A personal writing system built around a specific communication style, calibrated to my tone and writing style.

## What's here

|File|Purpose|
|-|-|
|`VOICE.md`|Load into any Claude session to write in the right voice|
|`product-management-philosophy.md`|Product-thinking companion. `VOICE.md` is how you write; this is what you decide to build. Load for PRDs, roadmaps, discovery, and build-or-buy calls.|
|`prd_template.md`|PRD skeleton structured around Problem / Solution / Go to Market|
|`examples/`|Two worked examples, each an input and output pair, showing the system prompt in use|
|`prompts/`|Reusable prompts. Several install as Claude Code slash commands (`/globalrules`, `/dailytask`, `/codereview`, `/adversarialreview`, `/adhocstay`)|
|`scripts/`|`sync-commands.ps1` copies the live prompts to `~/.claude/commands/`|
|`feature-engineering-context.md`|Domain context for feature-engineering and feature-store work|
|`ROADMAP-TEMPLATE.md`, `README-TEMPLATE.md`|The portfolio standards for every repo's roadmap and README|
|`ROADMAP.md`|This repo's priorities, status, and decision log|
|`CLAUDE.md`|Context file for Claude Code users — start here|

## How to use

**Claude.ai:** Paste `VOICE.md` at the start of a conversation, or upload it to a Project so it persists. Then describe the task.

**Claude Code:** `CLAUDE.md` is read automatically. See it for full usage instructions.

## Philosophy

Built on the [AI Fluency Framework](https://aifluencyframework.org) (Delegation, Description, Discernment, Diligence) and the PM frameworks of Nils Davis and Marty Cagan, captured in `product-management-philosophy.md`. AI drafts, but you make the decisions.

## Tech stack

| Area | Choice |
|---|---|
| Language | Markdown; PowerShell for `scripts/sync-commands.ps1` |
| Runtime/platform | Claude.ai (paste or attach to a Project) and Claude Code (slash commands in `~/.claude/commands/`) |
| Package manager | none |
| CI | none |

## Diligence

This repo was developed collaboratively with Claude (Anthropic). The voice, frameworks, and editorial judgments are the author's own. All content has been reviewed and approved before use. The author takes full responsibility for anything produced with these tools.
