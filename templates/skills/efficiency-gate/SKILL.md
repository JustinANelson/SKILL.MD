---
name: efficiency-gate
description: Use when writing or reviewing code on a hot path, loop, or query, to catch avoidable algorithmic and resource-usage regressions before they ship.
---

# Efficiency Gate

- Know the Big-O of new/changed hot-path code - avoid quadratic-or-worse behavior over unbounded input when a linear approach is available.
- Avoid N+1 query or API-call patterns - batch, join, or fetch in bulk instead of looping a call per item.
- Cache or memoize results that are expensive and reused, instead of recomputing them on every call.
- Respect existing performance and bundle-size budgets - don't pull in a heavy dependency for a small utility need.
- Reason about or profile the actual bottleneck before optimizing - don't trade readability for a micro-optimization on a cold path.
- Flag an existing efficiency problem noticed while working, even outside current scope, rather than silently fixing or ignoring it.
