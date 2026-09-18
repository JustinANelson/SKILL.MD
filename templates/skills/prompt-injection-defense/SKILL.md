---
name: prompt-injection-defense
description: Use when building LLM features that read user input, web pages, documents, emails, or tool results, or when giving a model tools or agent actions, to keep untrusted content from hijacking the model or leaking data.
metadata:
  category: ai-llm-engineering
  tagline: 'A pasted document tells your chatbot to leak its data'
  summary: 'Untrusted content stays data: delimits retrieved text, scopes agent tools to least privilege, and requires server-side checks before side effects.'
---

# Prompt Injection Defense

- Treat any text the model did not get from you as untrusted: user messages, uploaded files, scraped pages, emails, search results, and tool outputs can all contain instructions.
- Keep instructions in the system prompt and pass untrusted content inside clearly delimited blocks (e.g., XML tags) marked as data to analyze, not instructions to follow. Delimiting reduces risk; it does not eliminate it.
- **Never let model output alone authorize a side effect.** Sending email, deleting records, making payments, or calling write APIs requires server-side permission checks and, for high-impact actions, explicit user confirmation.
- Give agents the fewest tools and narrowest scopes possible: read-only by default, per-user credentials instead of an admin key, allowlisted domains for fetch tools.
- Enforce authorization in code, not in the prompt. A model can be talked out of "only show the user their own orders"; a `WHERE user_id = ?` cannot.
- Keep secrets, API keys, and other users' data out of the prompt context; assume anything in context can be exfiltrated.
- Block exfiltration through rendered output: do not auto-load images or links in model-generated markdown that point to arbitrary domains.
