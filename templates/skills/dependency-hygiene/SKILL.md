---
name: dependency-hygiene
description: Use when adding, updating, or reviewing external libraries and package dependencies, to prevent supply-chain bloat and maintain security.
---

# Dependency Hygiene

- Prefer standard library or minimal existing helpers over adding a new third-party dependency for trivial tasks (e.g., single utility functions).
- When a new package is genuinely required, check its maintenance health, weekly downloads, vulnerability history, and license compatibility before installing.
- Pin dependency versions or commit lockfiles (`package-lock.json`, `poetry.lock`, `Cargo.lock`, `go.sum`) to prevent non-deterministic builds.
- Separate runtime dependencies from development/test-only dependencies.
- Audit installed packages periodically for known vulnerabilities using ecosystem tools (`npm audit`, `pip-audit`, `cargo audit`, `govulncheck`).
- Remove unused dependencies immediately upon refactoring rather than leaving them in manifests.
