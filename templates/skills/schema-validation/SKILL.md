---
name: schema-validation
description: Use when handling external data, API payloads, form inputs, or environment variables, to enforce strict runtime type validation using schemas (Zod, Pydantic, etc.).
metadata:
  category: architecture-and-devops
  tagline: 'Runtime Type Safety'
  summary: 'Runtime type safety: Zod/Pydantic validation at boundaries, safe error mapping, and input sanitization.'
---

# Schema Validation (Runtime Type Safety)

- Validate and parse all incoming data at application boundaries (request bodies, query params, route params, webhook payloads, third-party responses).
- Use schema validation libraries (e.g., Zod, Pydantic, Valibot, Yup, Joi) and infer static types directly from runtime schemas—never duplicate types manually.
- Use `safeParse()` or structured validation methods to catch validation errors cleanly and return friendly, field-specific error messages (`{"email": "Invalid email address"}`) instead of uncaught 500 crashes.
- Strip or reject unrecognized properties (`.strict()` or default stripping) to protect against parameter mass-assignment attacks.
- Enforce strict transformations at parse time (e.g., converting numeric strings to numbers, trimming whitespace, lowercasing emails).
- Validate environment variables with a strict startup schema so misconfigured environments fail immediately upon launch with an explicit explanation.
