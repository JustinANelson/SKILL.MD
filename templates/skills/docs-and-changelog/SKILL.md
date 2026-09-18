---
name: docs-and-changelog
description: Use when adding new features, modifying public APIs, changing CLI flags, or altering configurations, to keep user-facing documentation and changelogs synchronized.
metadata:
  category: core-engineering-gates
  tagline: 'Documentation Sync'
  summary: 'Keeping README, API guides, configuration docs, and changelogs in lockstep with changes.'
---

# Documentation & Changelog Hygiene

- Update relevant documentation (README.md, API docs, usage guides) in the same pull request/commit as the implementation.
- Document the "why" and architectural trade-offs in docstrings or Architecture Decision Records (ADRs) when making non-obvious design choices.
- Keep CLI flags, configuration environment variables, and default configuration files in sync with code definitions.
- Maintain a concise `CHANGELOG.md` following standard conventions (e.g., Keep a Changelog) for notable additions, fixes, or breaking changes.
- Ensure all code examples in markdown files are syntactically valid and reflect the current state of the codebase.
