---
name: ask-vs-assume
description: Use when a request is ambiguous, underspecified, or conflicts with existing code or earlier instructions, to decide between asking a clarifying question and proceeding on a stated assumption.
metadata:
  category: agent-workflow
  tagline: 'Twenty questions for a one-line fix, or a wild guess on a big one'
  summary: 'Ask only when it matters: look facts up in the codebase, proceed on stated defaults for low-stakes choices, and ask when the answer changes the outcome.'
---

# Ask vs. Assume

- Look it up before asking: anything answerable from the code, config, docs, or git history should be checked, not asked.
- For low-stakes, easily reversible choices, proceed with the conventional default and state the assumption in the handoff (e.g., "Assumed dates display in the user's local timezone").
- Ask when the answer changes what gets built and is costly to undo: product behavior, data model shape, pricing or permission rules, user-facing copy, or anything irreversible.
- Ask when instructions conflict with each other, with existing code, or with project conventions, instead of silently picking one.
- Batch questions into one message with concrete options and a recommended default, rather than asking one at a time.
- Never invent requirements, API contracts, or credentials to get unblocked; say what is missing.
