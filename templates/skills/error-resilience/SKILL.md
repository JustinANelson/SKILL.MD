---
name: error-resilience
description: Use when implementing error handling, external I/O, network requests, or parsing logic, to ensure robust failure handling, defensive checks, and clear diagnostics.
---

# Error Resilience & Handling

- Never silently catch and swallow exceptions with empty handlers (`catch {}` or `except: pass`). Always log or rethrow.
- Handle failure states explicitly at I/O and network boundaries (timeouts, network drops, malformed responses).
- Provide actionable, informative error messages with context (e.g., file path, attempted operation, key identifiers), without leaking sensitive tokens or PII.
- Use early returns and guard clauses to fail fast on invalid preconditions before executing complex logic.
- Ensure resources (file handles, database connections, streams) are deterministically released using appropriate idioms (`try...finally`, `with`, `using`, `defer`).
- Prefer typed/custom domain error classes over generic strings or ambiguous error codes when structuring library or API interfaces.
