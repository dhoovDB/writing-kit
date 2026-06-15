# writing-kit

This repo is a personal writing system built around a specific communication style.
It is not a general-purpose style guide. It is calibrated to one person.

## What's here

|File|Purpose|
|-|-|
|`VOICE.md`|Drop this into any Claude conversation to get writing in the right voice|
|`product-management-philosophy.md`|Product-thinking companion to `VOICE.md`. Governs *what* to build and *which* doc you are writing (Problem / Solution / GTM, discovery, build-or-buy). Load it for product work; `VOICE.md` alone covers pure writing. The bottom-line summary is mirrored in both files.|
|`prompts/`|Reusable prompts. `globalrules.md`, `dailytask.md`, and `codereview.md` are also installed as live slash commands — after editing any of those three, run `scripts/sync-commands.ps1` to propagate. `voice-check.md` is in-source-only for now.|
|`scripts/`|Maintenance utilities. `sync-commands.ps1` copies the three live prompts to `~/.claude/commands/`; idempotent, safe to re-run.|
|`prd\_template.md`|PRD skeleton with voice-aware section prompts|
|`examples/`|Input/output pair demonstrating the system prompt working|

## How to use

**For a new doc:** Open a Claude conversation, paste the contents of `VOICE.md`
as a system prompt (or at the top of your first message), then describe what you need.

**For editing existing writing:** Paste `VOICE.md`, then paste your draft with
the instruction: "Rewrite this in my voice. Keep all the facts. Change the structure
and tone to match the style guide."

**For product thinking (what to build, roadmaps, discovery, the reasoning behind a
PRD):** Load `product-management-philosophy.md` together with `VOICE.md`. The first
decides what's worth building and which doc you're in; the second makes it read like
you. For pure writing with no product decision behind it, `VOICE.md` alone is enough.

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
|**Description**|Communicate intent clearly|`VOICE.md` is your standing description — load it before every writing session|
|**Discernment**|Evaluate outputs critically|`examples/` is your reference point. Ask: would I send this? Does it sound like me?|
|**Diligence**|Take responsibility for what you publish|See diligence statement below|

**A note on Delegation:** the boundary matters. AI should draft, restructure,
and suggest. You should decide what's true, what the recommendation is, and
whether the output is accurate before it leaves your hands. If you're unsure
about a fact in an AI-generated draft, that uncertainty is yours to resolve —
not the model's.

## Skill repos

Two skill libraries are available locally. When a task matches a skill's 
trigger, load the SKILL.md before writing any code or output.

claude-skills: C:\Projects\claude-skills
pm-skills:     C:\Projects\pm-skills

Do not load skills speculatively or in bulk. One skill per task, loaded 
only when the trigger matches. Check once at session start and once when 
a new task type is introduced.

---

### High-relevance skills and their triggers

**React and frontend**
- senior-frontend — any React component, bundle, performance, or a11y task
- ui-design-system — design tokens, component documentation, design handoff

**ML and data**
- senior-ml-engineer — MLOps, model deployment, drift, LLM integration
- senior-data-engineer — data pipelines, ETL/ELT, Spark, Airflow, dbt
- senior-data-scientist — experiment design, feature engineering, model eval
- data-quality-auditor — dataset profiling, anomaly detection, remediation
- llm-cost-optimizer — token usage, prompt caching, model selection

**Robotics and infrastructure**
- senior-computer-vision — object detection, segmentation, ONNX/TensorRT
- docker-development — Dockerfile optimization, multi-stage builds
- kubernetes-operator — K8s controllers, CRDs, reconcile loops
- senior-devops — CI/CD, IaC, cloud deploy, monitoring
- observability-designer — metrics, logs, traces, SLI/SLO design
- chaos-engineering — fault injection, gamedays, fleet resilience

**AI application development**
- mcp-server-builder — exposing an API as MCP, Claude/Cursor integrations
- agent-designer — multi-agent systems, autonomous workflows
- senior-prompt-engineer — prompt optimization, LLM eval, structured output
- rag-architect — RAG design, retrieval strategy, vector search

**Code quality (cross-cutting)**
- code-reviewer — PR review, SOLID checks, quality analysis
- tdd-guide — TDD workflow, coverage gaps, Jest/Pytest/Vitest
- senior-architect — system design, ADRs, architecture diagrams
- performance-profiler — slow endpoints, memory leaks, perf budgets

**PM craft**
- create-prd — writing or reviewing a PRD or feature spec
- outcome-roadmap — rewriting output-focused roadmaps as outcome-focused
- prioritization-frameworks — RICE, ICE, Kano, MoSCoW reference
- opportunity-solution-tree — discovery structure, outcome to experiments
- ab-test-analysis — experiment results, significance, ship/stop calls
- cohort-analysis — retention by cohort, feature adoption, churn patterns
- metrics-dashboard — KPI definition, dashboard design, alert thresholds
- sql-queries — natural language to SQL, data reports
- product-challenge — before committing a roadmap or shipping a release: six forcing questions (JTBD, north star, PMF signal, RICE, cut list, kill criteria)

---

### Skills to build (gaps not covered by either repo)

- ros2 — ROS2 node patterns, launch files, topic/service conventions. 
  Build this as ros2-hello-world progresses.
- tanstack-start — SSR routing, server functions, Cloudflare Workers 
  deployment. Build this as str-host-assistant matures.
- vitest — testing conventions for pure engine functions, multi-tick 
  simulation integration tests. Build from banking-empire patterns.
- html5-canvas — iso coordinate system, tile-fraction sizing, no raw 
  pixel anchors. Build from banking-empire renderer patterns.

## Maintenance

When your style evolves, update `VOICE.md` first. The examples will
drift out of date if you don't update them too — treat `examples/` as a test
suite, not documentation.

**Syncing slash commands to the live install.** The source of truth for the
slash commands `/globalrules`, `/dailytask`, and `/codereview` lives in this
repo's `prompts/` directory. The active versions Claude Code actually loads
live at `~/.claude/commands/`. Without a sync step the two drift apart — the
canonical incident is the 2026-05-30 `VOICE.md` rename, which left the live
copy of `/globalrules` pointing at the old filename for hours.

After editing any of those three prompt files, run:

```powershell
.\scripts\sync-commands.ps1
```

The script is idempotent (skips when source and destination match
byte-for-byte) so it's safe to run on a schedule or as a habit after any
edit. Filenames match between source and destination by design — see the
2026-05-30 decision-log entry for the `daily-task.md` → `dailytask.md`
rename that established that parity. Promoting a new prompt to a live slash
command means: add an entry to `$commands` in `sync-commands.ps1`, add a
row to the portfolio workflow table, then run the script.

\---

## Diligence statement

The files in this repo were developed collaboratively with Claude (Anthropic).
The voice, frameworks, examples, and editorial judgments reflect the repo
owner's own style and thinking. AI was used to draft, structure, and iterate
— all content has been reviewed and approved by the author before use.

When outputs from this writing system are used in professional contexts,
the author takes full responsibility for accuracy, tone, and appropriateness.
AI assistance does not transfer ownership of the work or the decisions it reflects.

---

## Decision log

*Project and architectural decisions are logged in `ROADMAP.md`. This log tracks
changes to this CLAUDE.md only.*

### 2026-05-25 — Adopted the portfolio ROADMAP standard

Created `ROADMAP-TEMPLATE.md` as the source of truth for roadmap structure across
the portfolio, and added this decision log. Project-level decisions for writing-kit
live in `ROADMAP.md`; this section records changes to this guide.
