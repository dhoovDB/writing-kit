This prompt operationalizes the Discernment and Diligence layers of the 4D framework (Delegation, Description, Discernment, Diligence) that governs this portfolio.

Before selecting a task, read CLAUDE.md and any architecture or constraints sections in ROADMAP.md. Note any norms that should shape your selection including patterns to follow, layers to respect, things explicitly ruled out. Carry these forward into your evaluation.

Then read ROADMAP.md. The roadmap states priority order — use that as the starting point, then refine using the criteria below.

**Rule out** any task with unfinished prerequisites.

Before proposing, if a task conflicts with architecture norms, **suggest** a scoped adjustment that keeps it aligned and propose the adjusted version.

Among remaining tasks, **prefer**:
- Learning value — tasks that teach a new concept over polish tasks
- Estimated scope — tasks completable in 1-2 hours over multi-day efforts

If preferences tie, **apply** career signal:

Prefer tasks that demonstrate strategic decision-making, not just coding. Ask: would this give the user something interesting to say in an interview about how they think?

Signals well:
- Adding a data validation layer because silent failures are worse than loud ones
- Updating CLAUDE.md to enforce architectural constraints across AI sessions
- Emphasizing config schema so game rules are data, not code
- Scoping a v1 that ships one real user value instead of four half-built ones

Does not signal:
- Tweaking colors or copy
- Refactoring code that already works
- Adding a feature without justifying its priority

Return:
- The selected task and why
- The specific files it touches
- The definition of done (how we'll know it's complete)
- One or two things that could go wrong and how to handle it
- Any questions or requests for clarification

Wait for approval before building.
