---
name: api-cost-safety
description: Use when integrating LLMs, paid AI APIs (OpenAI, Anthropic, Replicate), or third-party webhooks, to protect secret keys from browser exposure and prevent accidental credit drain.
metadata:
  category: vibe-coder-essentials
  tagline: 'Leaked AI keys or accidental $50 credit drains'
  summary: 'Credit and secret protection: keeps paid AI keys server-side only, enforces `max_tokens` limits, debounces inputs, and blocks infinite retry loops.'
---

# API Cost & Secret Safety

- **Never call paid AI APIs directly from client-side browser code**. Always route LLM requests through a backend route or serverless edge function so API keys are never exposed in browser network inspection.
- Set conservative default limits on completions (e.g., `max_tokens: 1000` or `max_completion_tokens`) so runaway prompts or loops cannot rapidly consume API balances.
- Add timeout limits (e.g., 15–30 seconds) on AI streaming and model generation endpoints to avoid hanging connections that hold billable serverless invocations open.
- Implement basic client-side debouncing on search or generative input fields to avoid triggering rapid-fire API calls on every keystroke.
- Prevent infinite retry loops: if an API returns HTTP 401, 402 (Payment Required), 403, or 429 (Rate Limited), stop retrying immediately and notify the user.
- Choose cost-effective default models for basic classification or parsing tasks (e.g., `gpt-4o-mini`, `gemini-flash`, `claude-3-haiku`) rather than defaulting every trivial task to maximum-tier models.
