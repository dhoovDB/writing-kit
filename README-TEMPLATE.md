# README Standard

The shared structure every portfolio `README.md` follows. The goal matches
`ROADMAP-TEMPLATE.md`: one **common spine**, so a reader meets a familiar shape in
every repo, while each repo keeps the product sections that fit it.

This file is the source of truth for README structure. It lives in writing-kit
because writing-kit is the portfolio hub for working conventions.

---

## Principles

- **Three files, three jobs.** The README describes the product: what it is, how
  to run it, and what it is built with. `ROADMAP.md` owns status, plan, and
  decisions. `CLAUDE.md` owns how to work in the repo. The README points to the
  ROADMAP's Current status instead of restating it.
- **Common spine, flexible body.** The required headers below are fixed. The
  product sections between them are free.
- **Structure, not prose.** Adopting this template adds or renames sections. It
  never rewrites or reorders existing README prose.
- **Facts come from the files.** Every version, service, and command in a README
  is checked against the manifests and code before it is written.
- **Voice.** A README is content the owner publishes. Prose is drafted with
  `VOICE.md` when the owner invokes it. Otherwise, additions stay minimal and
  factual and pass the "Before you write anything" checks in `VOICE.md`.

---

## The spine

1. **Title.** `# <Product name>`.
2. **Pitch.** One to three sentences. The first sentence says what the thing is
   and who it is for. If the shipped copy lives somewhere else (an upstream repo,
   a marketplace), say where here.
3. **Status line.** Optional. One line or a blockquote banner, for example
   `> In development: Phase 2. See ROADMAP.md for current status.` Detail stays in
   the ROADMAP.
4. **Product body.** Free-form headers: What it does, Usage, How it works,
   Architecture, and so on.
5. **Running locally.** Required when the repo is runnable or installable. Use
   `## Running locally`, `## Local setup`, or `## Install`, in any position. State
   the runtime floor and point to `.env.example` for environment variables. Never
   list secret values.
6. **`## Tech stack`.** Required. Place it immediately before the closing block,
   or last if there is none.
7. **Closing block.** Optional: What's next, `## Diligence`, or a footer line
   (Built with, License).

---

## Tech stack rules

A two-column table. Use only the rows that apply, in this order:

| Area | What goes here |
|---|---|
| Language | Languages and their major version |
| Runtime/platform | Where it runs: browser, Node, Cloudflare Workers, Claude Code skill |
| Framework | UI or app frameworks |
| Build | Bundler and build tooling |
| Styling | CSS approach |
| Data/storage | Databases, files, browser storage |
| AI/LLM | Model provider, model ID, and the file that sets it |
| External services & data | Every API, feed, CDN, or data source the code calls |
| Hosting/deploy | Where it is served and how it ships |
| Distribution | Where users get it (marketplace, upstream repo) |
| Testing/evals | Test runners and eval harnesses |
| Quality | Linters, formatters, enforced rules |
| Package manager | npm, bun, pip, none |
| CI | Workflows, or `none` |

Rules:

- **Major versions only** (`React 18`, `Vite 5`). For a 0.x package use
  major.minor (`Feast 0.66`) or no version.
- **Mark unbuilt items `(planned)`.**
- **State notable absences.** `Backend: none, runs in the browser` tells a reader
  more than a missing row.
- **No counts.** Test counts and line counts go stale. Put them in prose if they
  matter.
- **No `||` inside a cell.** It breaks the table. Write version ranges in words.
- **About 12 rows at most.** Mechanism belongs in Architecture.
- **The runtime floor lives in Running locally**, taken from the lockfile
  `engines` fields. State the exact minimum.
- **Update the table in the same commit** that changes a manifest or lockfile, or
  the file that sets a model ID.

---

## Special cases

- **Fork.** The README belongs to upstream. Leave it alone.
- **Archived repo.** Outside this template. The README is a short archive notice:
  what the repo was, when work stopped, and where it continues.
- **Repo whose build order puts the README last.** A stub with the pitch, a
  status line, and the Tech stack (planned rows marked) is fine once the owner
  approves it. Log the deviation in the ROADMAP decision log.

---

## Copy-paste skeleton

```markdown
# <Product name>

<What it is and who it is for, in one sentence. One or two more if needed.>

> <Optional status line. See ROADMAP.md for current status.>

## <What it does | Usage | How it works>

<Product body.>

## Running locally

<Runtime floor, install and run commands, pointer to .env.example.>

## Tech stack

| Area | Choice |
|---|---|
| Language | <language + major version> |
| Framework | <framework + major version> |
| Hosting/deploy | <where it runs> |
| Testing/evals | <test runner> |
| CI | <workflow, or none> |

## Diligence

<Optional AI-assistance statement.>
```

---

*Last updated: 2026-11-02*
