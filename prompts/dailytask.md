# Daily Task Selection

This prompt operationalizes the Discernment and Diligence layers of the 
4D framework. Discernment: evaluate the roadmap critically before picking. 
Diligence: the selection is mine to own — you propose, I approve, nothing 
ships without a human decision.

Before running this prompt, start fresh. If this is a new session, 
run /clear then /globalrules. If you are mid-session with globalrules 
already active, run /compact to free context before proceeding. 
Either way, /globalrules must be active before continuing.

Work in plan mode for this entire prompt. Read files, reason about 
options, and propose. Do not create, edit, or delete any files until 
the user explicitly approves the selected task.

Before selecting a task, read CLAUDE.md and any architecture or 
constraints sections in ROADMAP.md. Note any norms that should shape 
your selection — patterns to follow, layers to respect, things explicitly 
ruled out. Carry these forward into your evaluation.

Then read ROADMAP.md. The roadmap states priority order — use that as 
the starting point, then refine using the criteria below.

Rule out any task with unfinished prerequisites.

Before proposing, if a task conflicts with architecture norms, suggest 
a scoped adjustment that keeps it aligned and propose the adjusted version.

Among remaining tasks, prefer:
- Learning value — tasks that teach a new concept over polish tasks
- Estimated scope — tasks completable in 1-2 hours over multi-day efforts

If preferences tie, apply career signal:

Prefer tasks that demonstrate strategic decision-making, not just coding. 
Ask: would this give the user something interesting to say about how they 
think?

Signals well:
- Adding a data validation layer because silent failures are worse than 
  loud ones
- Updating CLAUDE.md to enforce architectural constraints across AI sessions
- Designing a config schema so game rules are data, not code
- Scoping a v1 that ships one real user value instead of four half-built ones

Does not signal:
- Tweaking colors or copy
- Refactoring code that already works
- Adding a feature without justifying its priority

Return:
- The selected task and why
- The specific files it touches
- The definition of done
- 1-2 likely failure modes and mitigations

Wait for approval before building.