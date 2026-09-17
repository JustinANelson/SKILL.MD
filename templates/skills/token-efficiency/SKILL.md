---
name: token-efficiency
description: Use whenever writing code, exploring a codebase, or replying to the user, to keep assistant context and tool responses lean and avoid wasting tokens on redundant reads or narration.
---

# Token & Context Efficiency

- Prefer targeted search and pattern matching (grep, ripgrep, glob, ast-grep) over reading whole files when only a symbol or pattern is needed.
- Read a file once per task and reuse the result in context instead of re-reading it after small edits.
- Batch independent tool calls in one turn instead of executing them sequentially.
- Read only the relevant slice of a large file using offset/line ranges instead of dumping the entire file.
- Keep replies concise - state the result and what changed; avoid step-by-step narration of internal tool calls.
- Avoid repeating entire code blocks the user can already see in an active diff or open editor.
- Do not generate unsolicited summary documents or walkthrough files unless explicitly requested.
