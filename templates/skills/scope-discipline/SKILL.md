---
name: scope-discipline
description: Use when a task could be done in a small, targeted way or a large sweeping way, to keep changes matched to what was actually asked.
metadata:
  category: core-engineering-gates
  tagline: 'Minimal Blast Radius'
  summary: 'Stay strictly inside requested scope; avoid drive-by refactoring.'
---

# Scope Discipline

- Do the minimum change that satisfies the request - no drive-by refactors or unrelated cleanup.
- Ask before a change that touches many files, deletes data, or alters shared infrastructure.
- Do not add features, fallbacks, or configuration the user did not ask for.
- If a bigger problem is spotted while working, mention it and ask, rather than fixing it unprompted.
