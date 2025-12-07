# Repository Guidelines

## Project Structure & Module Organization
- ASDF entry point is `nrt.asd`; primary code lives in `src/`.
- Core API: `src/main.lisp` (`response`, backend lookup), helpers in `src/util.lisp` (backend registry).
- Built-in backends in `src/backends.lisp` (JSON via Jzon, Djula renderer).
- HTTP status constants in `src/status.lisp` (`nrt/http-status` package).
- No dedicated test directory yet; add new suites under `test/` and register them in `nrt.asd`.

## Build, Test, and Development Commands
- Install dependencies pinned in `qlfile`:  
  `qlot install`
- Launch a REPL with local deps and load the system:  
  `qlot exec sbcl --eval "(ql:quickload :nrt)"`  
  (Use the same pattern for other Lisp implementations.)
- Quick manual check of backends inside the REPL:  
  `(in-package #:nrt) (response :json '((ok . t)))`
- When you add an ASDF test-op, run tests consistently via:  
  `qlot exec sbcl --eval "(asdf:test-system :nrt)"`

## Coding Style & Naming Conventions
- Common Lisp with two-space indents inside forms; keep docstrings where behavior is non-obvious.
- Use package-qualified symbols (`nrt/util:define-response-backend`, `nrt/http-status:OK`) instead of importing broadly.
- Backends are keyed by keywords (`:json`, `:djula`); status constants stay uppercase to mirror HTTP names.
- Prefer pure functions; avoid side effects outside Ningle response objects unless documented.

## Testing Guidelines
- No automated suite exists yet; prefer FiveAM or Prove under `test/` and wire it to ASDF `:in-order-to ((test-op (test-op "nrt/test")))`.
- Name tests after the function under test (`response-backend-json`, `status-constants`) and cover header/status merging plus error paths.
- For manual verification, hit sample handlers in a Ningle app and assert headers/status in the REPL.

## Commit & Pull Request Guidelines
- Follow the existing short, imperative commit style (`Added better README.md and statuses`, `Switched to qlot`).
- In PRs: summarize intent, list notable API changes, and include a quick REPL transcript or handler snippet showing expected output.
- Link related issues; add screenshots only if UI responses are relevant (headers/body dumps are fine).
- Note dependency changes (especially `qlfile`) and any new backends or status additions.

## Security & Configuration Tips
- Keep new backends deterministic; avoid reading env or filesystem from encoder functions.
- Ensure response headers always include an explicit charset when returning text backends.
- If adding templating, prefer escaping libraries (e.g., Djula defaults) and document any raw HTML output.
