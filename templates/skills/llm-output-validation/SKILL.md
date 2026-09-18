---
name: llm-output-validation
description: Use when parsing or acting on LLM responses (JSON extraction, classification, tool calls, generated code or SQL), to validate structure and handle refusals, truncation, and malformed output instead of trusting the model blindly.
metadata:
  category: ai-llm-engineering
  tagline: 'The model returned half a JSON object and the app crashed'
  summary: 'Schema-checked model output: structured output modes, validation with bounded retries, and explicit handling of refusals and truncated responses.'
---

# LLM Output Validation

- Prefer the provider's structured output, JSON schema, or tool-calling mode over asking for JSON in prose and regex-parsing the reply.
- Validate every parsed response against a schema (Zod, Pydantic) before using it. On failure, retry at most once or twice with the validation error included, then fail gracefully.
- Check the stop reason: a response cut off by the token limit is incomplete, not a valid answer. Retry or surface it instead of parsing it.
- Handle refusals and empty responses as their own case with a user-facing message, not as a parse error.
- Constrain classifications to an enum and map unexpected values to an explicit fallback bucket.
- Never execute model-generated code, SQL, or shell commands directly; route them through allowlists, parameterization, read-only connections, or a sandbox.
- Escape model output before rendering it as HTML; treat it with the same suspicion as user input.
