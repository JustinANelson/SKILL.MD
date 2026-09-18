---
name: human-handoff
description: Use when completing a task or prompt, to provide clear, jargon-free instructions, exact URLs/clicks to verify the work, and explicit next steps.
metadata:
  category: vibe-coder-essentials
  tagline: 'Confusing walls of technical jargon'
  summary: 'Clear next steps: delivers exact localhost URLs, click-by-click test instructions, and zero engineering jargon.'
---

# Human Handoff (Actionable & Clear Next Steps)

- Format the completion handoff with high clarity and minimal technical noise:
  1. **What Changed**: 2-3 sentences summarizing the feature or fix in everyday language.
  2. **How to Test It**: Exact, copy-paste steps (e.g., "1. Run `npm run dev`. 2. Open `http://localhost:3000/settings`. 3. Click 'Upgrade Plan'").
  3. **Manual Actions Needed**: Clearly call out if the user needs to set an API key, run a migration, or configure a webhook.
- Avoid dumping long stack traces, internal AST diffs, or rambling narration of terminal tool calls.
- Suggest 1-2 logical next steps or sensible enhancements the user might want to tackle next.
