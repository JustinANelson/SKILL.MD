---
name: session-notes
description: Use when working on a multi-session or long-running task, before context is likely to be reset or summarized, or when resuming earlier work, to keep a concise progress file that lets the next session pick up where the last one stopped.
metadata:
  category: agent-workflow
  tagline: 'New chat, and the AI forgot everything decided yesterday'
  summary: 'Durable working memory: a short progress file with goal, decisions, status, next steps, and gotchas, read on resume and updated at milestones.'
---

# Session Notes

- For work spanning multiple sessions, keep a short progress file (e.g., `PROGRESS.md`), or use the project's existing notes file if one exists.
- Record only what a fresh session needs: the goal, key decisions and why, what is done, what is next, and known gotchas or failing tests.
- Read the progress file at the start of a resumed task, before re-exploring the codebase.
- Update it at meaningful milestones and before stopping, not after every small edit.
- Keep it current rather than append-only: remove finished items and stale notes so it stays under a page.
- Do not duplicate what git history, the README, or code comments already record; link to them instead.
- Never store secrets, credentials, or personal data in the notes file.
- Ask before committing the notes file if the user may not want it in the repository.
