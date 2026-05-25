# ROADMAP Standard

The shared structure every portfolio `ROADMAP.md` follows. The goal is one
**common spine** — same titles, same section headers, same order — so a reader
(and the `/dailytask` selector) meets a familiar shape in every repo, while each
repo keeps the prioritization scheme that fits how it actually works.

This file is the source of truth for roadmap structure. It lives in writing-kit
because writing-kit is the portfolio hub for working conventions.

---

## Principles

- **Common spine, flexible scheme.** The section headers and their order are
  fixed. The *prioritization scheme* inside the work section is not — pick the
  one that fits the repo (see below).
- **Structure, not prose.** Standardize headers and section presence/order. Do
  not rewrite existing item bodies to a uniform shape. The item framing below is
  a recommendation for *new* items, never a reason to rewrite history.
- **Priority order is stated top-down.** `/dailytask` reads "the roadmap states
  priority order — use that as the starting point." Whatever scheme you use, the
  highest-priority work must come first.
- **One decision log per concern.** Project and architectural decisions live in
  ROADMAP.md. Changes to a repo's `CLAUDE.md` live in that `CLAUDE.md`. Each side
  carries a one-line pointer to the other.

---

## The spine (in order)

1. **Title** — `# <Repo Name> — Roadmap`. One format for all repos.
2. **`## What this builds toward`** — a short outcome statement: what the repo is
   building toward and how its phases tighten that loop. Lead with the user/owner
   outcome, not a feature list.
3. **Optional: `## Guiding principles` and/or `## Definition of done`** — include
   where they earn their place (e.g. a product with a hard v1 bar). Use these
   exact headers when present.
4. **The work** — the body, under whichever scheme fits (see "Schemes"). Must be
   ordered highest-priority-first. New items use the item framing below.
5. **`## Decision log`** — project / architectural decisions only. Dated entries,
   newest or grouped by date. Open with the pointer note:
   *"Project and architectural decisions live here. Changes to this repo's
   CLAUDE.md are logged in CLAUDE.md, not here."* Omit the section entirely if the
   repo has no such decisions yet — don't create an empty log.
6. **`## Completed`** — dated, for repos that track completion in-roadmap. Inline
   `✅ SHIPPED (date)` markers on a versioned scheme are an acceptable substitute;
   if you use a section, use this header.
7. **`## Cut ideas`** — a `| Idea | Reason cut |` table. Optional; use this header
   when present.
8. **Footer** — `*Last updated: <YYYY-MM-DD>*`. Update it on every commit that
   touches the roadmap (globalrules already requires the roadmap update itself).

---

## Schemes (pick one per repo)

The work section is ordered top-down by priority under one of these. All four are
legitimate; `/dailytask` reads any of them generically.

- **Time-horizon** — `## SHORT TERM` / `## MEDIUM TERM` / `## LONG TERM`. Best for
  a live product with a stream of bugs and incremental features. *(banking-empire)*
- **Version** — `## v1` / `## v2` / … with each version carrying a Goal and a
  "Done when" bar. Best for a product shipping in discrete releases. *(str-host-assistant)*
- **Priority tier** — `## Now (P1)` / `## Next (P2)` / `## Backlog`. Best for a
  library or toolkit picked from by priority. *(writing-kit)*
- **Build spec** — numbered design/build sections, for a repo still pre-development
  that has a build plan but not yet a prioritized backlog. Convert to one of the
  schemes above once real backlog items exist. *(passive-deal-screener, for now)*

---

## Item framing (recommended for new items)

A work item reads cleanly as:

- **What** — the change, in one line.
- **Why** — the reason it matters / the problem it solves.
- **Done when** — the observable condition that closes it.

Mark status with a checkbox and stamp a date on completion:
`- [x] <item> (YYYY-MM-DD)`. This is guidance for items you add going forward,
not a mandate to reformat existing entries.

---

## CLAUDE.md decision log (the paired rule)

Each repo's `CLAUDE.md` carries a short `## Decision log` scoped to changes to
*that guide* — when and why the CLAUDE.md itself changed. Open it with:

> *Project and architectural decisions are logged in ROADMAP.md. This log tracks
> changes to this CLAUDE.md only.*

Seed it only where real entries exist. A CLAUDE.md with no change history yet
carries just the pointer note, not an empty log.

---

## Copy-paste skeleton

```markdown
# <Repo Name> — Roadmap

## What this builds toward

<One or two short paragraphs: the outcome this repo drives toward, and how its
phases tighten that loop.>

---

## <SHORT TERM | v1 | Now (P1) | 1. First build section>

- [ ] **<item>** — <what, why, done-when>

## <MEDIUM TERM | v2 | Next (P2) | 2. …>

- [ ] **<item>** — <what, why, done-when>

---

## Decision log

*Project and architectural decisions live here. Changes to this repo's CLAUDE.md
are logged in CLAUDE.md, not here.*

### YYYY-MM-DD — <decision title>
<what was decided and why>

---

## Completed
*Add the date when moving items here.*

- [x] <item> (YYYY-MM-DD)

---

## Cut ideas

| Idea | Reason cut |
|---|---|
| <idea> | <why> |

---

*Last updated: YYYY-MM-DD*
```

Sections 5–7 (Decision log, Completed, Cut ideas) are include-where-relevant. The
title, "What this builds toward," the work body, and the footer are required in
every roadmap.

---

*Last updated: 2026-05-25*
