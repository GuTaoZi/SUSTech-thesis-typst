# Repository Guidelines

## Project Structure & Module Organization
`lib.typ` is the public entry for package-style usage, while `thesis.typ` remains the root sample thesis. Keep degree- or specification-level defaults in `profiles/`, reusable page components in `pages/`, higher-level orchestration in `layouts/`, and shared styling primitives plus helper exports in `utils/`. Starter-project content belongs under `template/` (`template/thesis.typ`, `template/sections/`, `template/ref.bib`), while the root `sections/` and `references.bib` remain the in-repo example thesis. Store assets in `assets/` and `images/`; treat `build/` as generated output only.

## Build, Test, and Development Commands
Use Typst locally with the bundled fonts:

```bash
typst compile --font-path fonts thesis.typ build/thesis.pdf
typst watch --font-path fonts thesis.typ build/thesis.pdf
typst compile --root . --font-path fonts template/thesis.typ build/thesis-template.pdf
```

`typst compile` performs the baseline verification for the root example. `typst watch` is the fastest way to iterate locally. Use the `template/thesis.typ` build to verify the starter project whenever you touch `lib.typ`, `utils/`, `pages/`, or `layouts/`.

## Coding Style & Naming Conventions
Match the existing Typst style: 2-space indentation, trailing commas in multiline dictionaries/tuples, and one logical block per helper. Use descriptive snake_case names for files and exported helpers when adding new modules. Keep user-facing starter content in `template/`, reusable rendering logic out of `template/`, and chapter files focused on content rather than document assembly. Prefer small, composable `#let` helpers over large inline formatting blocks.

## Testing Guidelines
This repository does not include an automated test suite; validation is compile-based. Before opening a PR, run both `typst compile --font-path fonts thesis.typ build/thesis.pdf` and `typst compile --root . --font-path fonts template/thesis.typ build/thesis-template.pdf`, then inspect the PDFs for pagination, heading spacing, bilingual cover pages, and bibliography output. For visual changes, verify both Chinese and English paths if the edited template supports both. Name new sample chapters in `sections/` or `template/sections/` with the existing numeric prefix pattern, for example `4_results.typ`.

GitHub Actions runs the same two compile commands on pushes to `main`/`master`, pull requests, and manual dispatches. Keep both entry points green before asking for review.

## Commit & Pull Request Guidelines
Recent history follows short conventional prefixes such as `feat:`, `fix:`, and `chore:`. Keep commit subjects imperative and scoped to one change, for example `fix: align English cover metadata`. PRs should describe the formatting issue or feature, list the affected files, and mention the verification command used. Include screenshots or the regenerated PDF when the change is visual, and link any related issue.
