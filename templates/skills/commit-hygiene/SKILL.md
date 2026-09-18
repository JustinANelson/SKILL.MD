---
name: commit-hygiene
description: Use when creating git commits or pull requests in this project, to keep history clean and reviewable.
metadata:
  category: core-engineering-gates
  tagline: 'Git History'
  summary: 'Clean, focused, conventional git commits and branch discipline.'
---

# Commit Hygiene

- Write commit messages that explain why a change was made, not just what changed.
- Keep commits focused - one logical change per commit, not a bundle of unrelated edits.
- Never amend, force-push, or rewrite history that has already been pushed, unless explicitly asked.
- Never skip hooks or bypass checks to get a commit through.
- Confirm with the user before pushing or opening a pull request unless they already asked for that step.
