---
name: code-conventions
description: Use when writing or editing code in this project to keep style, naming, and structure consistent and to avoid unnecessary complexity.
metadata:
  category: core-engineering-gates
  tagline: 'Clean Architecture'
  summary: 'Consistent style, idiomatic naming, avoiding premature abstractions and dead code.'
---

# Code Conventions

- Match the existing naming, formatting, and file layout already used nearby.
- Do not add abstractions, config flags, or helper layers for a single current use.
- Delete code that is no longer used instead of commenting it out or leaving compatibility shims.
- Keep functions small and named for what they do, so comments are rarely needed.
- Only comment on the why - a hidden constraint or a non-obvious workaround - never on the what.
- Prefer editing an existing file over creating a new one.
