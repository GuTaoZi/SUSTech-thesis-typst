# SUSTech Thesis P0 Package And API Foundation Plan

**Status:** Completed on 2026-04-05. The repository now provides a package entry (`lib.typ`), a starter template entry (`template/thesis.typ`), reusable internals under `pages/` and `layouts/`, and one `setup(...)` API consumed by both supported entry points.

**Goal:** Complete the three P0 tasks for this repository: package the project for Typst Universe-style distribution, separate reusable library code from the example thesis project, and introduce a unified configuration API for document assembly.

**Architecture:** Convert the current single-entry bachelor template into a two-layer structure: a reusable library entry that exports the public API, and a template entry that demonstrates recommended usage. Preserve existing page implementations where possible, but move orchestration logic behind a single `setup(...)` or `documentclass(...)` entry so users no longer compose the full thesis manually in `thesis.typ`.

**Tech Stack:** Typst, Typst package metadata, GitHub Actions-compatible CLI workflow

---

### Task 1: Add package metadata and a public export entry

**Files:**
- Create: `typst.toml`
- Create: `lib.typ`
- Create or reuse: `thumbnail.png` or `assets/thumbnail.png`
- Modify: `README.md`

**Step 1: Add `typst.toml`**

- Define `[package]` metadata: package name, version, authors, license, description, repository, keywords, categories, compiler.
- Define `[template]` metadata so the repository can provide a starter template entry.
- Exclude generated files such as `build/`.

**Step 2: Add a public export surface**

- Create `lib.typ` as the stable import entry.
- Re-export the new unified API instead of requiring users to import internal page modules directly.
- Keep internal module paths out of the public-facing usage examples.

**Step 3: Add template thumbnail support**

- Provide a valid thumbnail asset for future package publishing.
- Keep the asset path aligned with `typst.toml`.

**Step 4: Update README usage**

- Add one section for local repo usage.
- Add one section for future package usage via `#import`.
- Clarify that the package API is the preferred long-term interface.

**Step 5: Verify**

Run:

```bash
typst compile --font-path fonts thesis.typ build/thesis.pdf
```

Expected: PASS. Existing local usage should still compile during this stage.

### Task 2: Separate library code from the example thesis project

**Files:**
- Create: `pages/`
- Create: `layouts/`
- Modify: `thesis.typ`
- Create: `template/thesis.typ`
- Move or adapt: reusable modules from the old `template/*.typ` set into `pages/`, `layouts/`, and `utils/`

**Step 1: Define the split**

- Treat reusable document logic as library code.
- Treat the current sample thesis content as an example project.
- Keep `sections/` as example thesis content, not as part of the public API.

**Step 2: Introduce the example template entry**

- Create `template/thesis.typ` as the canonical starter project entry.
- Move end-user usage patterns there: metadata filling, chapter includes, bibliography path, appendix content.

**Step 3: Reduce orchestration in root `thesis.typ`**

- Either make root `thesis.typ` a compatibility wrapper around the new API, or align it with the template structure.
- Avoid leaving orchestration duplicated in multiple places.

**Step 4: Organize reusable internals**

- Keep page components isolated from higher-level orchestration.
- If helpful, split current code into:
  - `pages/`: cover, declaration, abstract, references, appendix, acknowledgement
  - `layouts/`: front matter, main matter, appendix flow
  - `utils/`: fonts, date formatting, shared styling helpers

**Step 5: Verify**

Run:

```bash
typst compile --root . --font-path fonts template/thesis.typ build/thesis-template.pdf
typst compile --font-path fonts thesis.typ build/thesis.pdf
```

Expected: PASS. Both the example template and compatibility path compile.

### Task 3: Introduce a unified configuration API

**Files:**
- Modify or create: `lib.typ`
- Keep unified configuration logic in `lib.typ` or an equivalent internal module
- Modify: reusable page/layout modules to accept normalized config
- Modify: `template/thesis.typ`
- Modify: `thesis.typ`

**Step 1: Design the API surface**

- Introduce one primary entry such as `setup(...)` or `documentclass(...)`.
- Centralize metadata including language, anonymity, title, subtitle, author, department, supervisor, bibliography path, and feature toggles.
- Keep defaults compatible with the current bachelor template.

**Step 2: Normalize configuration once**

- Build one internal config dictionary with default values.
- Pass normalized config into page and layout helpers.
- Remove repeated default-merging logic scattered across page functions where possible.

**Step 3: Return a stable set of document helpers**

- Export a small public surface such as:
  - `cover`
  - `declaration`
  - `abstract`
  - `content`
  - `references`
  - `appendix`
- Or return layout/page closures from `setup(...)`, depending on which produces the cleaner calling pattern.

**Step 4: Migrate the example thesis**

- Update `template/thesis.typ` to consume only the new public API.
- Stop manually wiring the full document out of internal modules.

**Step 5: Verify**

Run:

```bash
typst compile --root . --font-path fonts template/thesis.typ build/thesis-template.pdf
typst compile --font-path fonts thesis.typ build/thesis.pdf
```

Expected: PASS. The example thesis uses only the new API, and the root entry remains usable during migration.

### Task 4: Final P0 verification and cleanup

**Files:**
- Modify: `README.md`
- Modify: `AGENTS.md` only if contributor workflow changes materially
- No additional structural changes expected beyond cleanup

**Step 1: Smoke-test the public shape**

- Confirm the repository has:
  - `typst.toml`
  - `lib.typ`
  - `template/thesis.typ`
  - a documented public import path

**Step 2: Compile both supported entry points**

Run:

```bash
typst compile --font-path fonts thesis.typ build/thesis.pdf
typst compile --root . --font-path fonts template/thesis.typ build/thesis-template.pdf
```

Expected: PASS.

**Step 3: Review API consistency**

- Confirm internal modules are no longer required in user-facing examples.
- Confirm metadata fields are named consistently across README, template example, and implementation.
- Confirm the public API does not expose unnecessary internal helpers.

**Step 4: Commit**

```bash
git add typst.toml lib.typ template/thesis.typ thesis.typ README.md docs/reconstruction-roadmap.md docs/plans/2026-04-05-p0-package-and-api-foundation.md
git commit -m "feat: add package foundation and unified thesis api"
```
