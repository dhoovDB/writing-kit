Review the completed work below against the principles for this project.

## Task completed

[One sentence: what was the task and what does it do now that it didn't before]

## What changed

[Paste the diff, or describe the key files and what moved]

## Decisions made

[Any non-obvious choices during implementation — why one approach over another, what was punted]

## Open questions

[Anything you're not sure about, or where you felt the principles were in tension]

---

Return:
1. What was done well — be specific
2. What violates a principle — be clinical and critical
3. Whether ROADMAP.md should be updated and how
4. One thing to add to the roadmap based on what this task revealed

---

## Completed examples

### 2026-04-26 — Unit tests for engine functions

## Task completed

Added unit test suite for pure engine functions — `npm test` now verifies the financial formulas are correct.

## What changed

New file `engine/financials.test.js` (24 tests). Added `vitest` to devDependencies, `test` script to `package.json`, and `test.environment: node` to `vite.config.js`.

## Decisions made

Used Vitest over Jest because it integrates with the existing Vite config with zero additional setup. Kept tests in `engine/` next to the source file rather than a separate `__tests__/` directory — the functions are few enough that colocation is cleaner.

## Open questions

`calculateFrustration` is called out in ROADMAP.md as a test target but doesn't exist yet. Left a TODO comment. Is this function planned for a specific file, or was the roadmap item premature?
