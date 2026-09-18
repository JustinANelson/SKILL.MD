---
name: prompt-regression-evals
description: Use when changing a prompt, system instructions, model, sampling parameters, or retrieval settings in an LLM feature, to check the change against a fixed set of examples before shipping.
metadata:
  category: ai-llm-engineering
  tagline: 'Fixed one prompt, silently broke five other cases'
  summary: 'Small eval sets for every prompt: stored test cases, before/after pass rates, and no prompt or model swaps on vibes alone.'
---

# Prompt Regression Evals

- Keep prompts in version-controlled files or named constants, not scattered inline strings, so changes show up clearly in diffs.
- Maintain a small eval set (10-50 cases) per LLM feature in the repo: real inputs with expected outputs or pass/fail criteria, including edge cases and past failures.
- Run the eval set before and after any change to the prompt, model, parameters, or retrieval pipeline, and report the pass-rate difference.
- Prefer deterministic checks (exact match, schema validity, contains / not-contains, numeric tolerance). Use an LLM-as-judge only for subjective qualities, with a written rubric.
- When a user reports a bad output, add it to the eval set before changing the prompt.
- Pin exact model versions in config rather than relying on aliases that can change behavior underneath you.
