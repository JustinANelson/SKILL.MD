---
name: quality-gate
description: Use before calling changed code done, to check it against industry-standard static-analysis and coverage thresholds rather than a subjective read of the diff.
metadata:
  category: core-engineering-gates
  tagline: 'Concrete Thresholds'
  summary: 'Concrete static analysis thresholds, cyclomatic complexity limits, and test coverage standards.'
---

# Quality Gate

- Block on any new blocker/critical static-analysis or linter issue introduced by the change - fix it, don't suppress it.
- Keep duplicated code on touched files under about 3% - extract shared logic instead of copy-paste.
- Cover new/changed logic with tests at an industry-standard bar (commonly 80%+ line/branch coverage on new code) rather than chasing 100% or skipping tests entirely.
- Keep cyclomatic complexity per function low - split a function once it crosses roughly 10-15 branches/paths.
- Treat maintainability, reliability, and security ratings from existing project tooling as gates - don't let a change regress them.
- Re-run linter/analyzer/coverage tools after fixes to confirm the gate actually passes, rather than assuming it does.
