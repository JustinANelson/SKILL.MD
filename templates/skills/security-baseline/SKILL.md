---
name: security-baseline
description: Use when writing code that handles user input, external data, secrets, or authentication, to avoid common vulnerabilities.
---

# Security Baseline

- Validate and sanitize input at system boundaries - user input, file uploads, API responses.
- Never hardcode secrets, API keys, or credentials in source files.
- Use parameterized queries instead of building SQL or shell commands from raw strings.
- Escape output that will be rendered as HTML to avoid injection.
- Flag any place where you notice existing insecure code, even if it is outside the current task.
