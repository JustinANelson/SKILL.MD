---
name: destructive-command-guard
description: Use before running shell, git, database, cloud, or deploy commands that delete, overwrite, reset, force-push, or touch production, to inspect the target first and prefer reversible alternatives.
metadata:
  category: agent-workflow
  tagline: 'The AI ran `git reset --hard` and uncommitted work vanished'
  summary: 'Look before you delete: inspect targets, prefer reversible commands, and get explicit confirmation for irreversible or production-affecting actions.'
---

# Destructive Command Guard

- Get explicit confirmation before irreversible actions: `rm -rf`, `git reset --hard`, `git clean -fd`, `git push --force`, `git branch -D`, dropping or truncating tables, deleting cloud resources, or running anything against production.
- Inspect the target first: list the directory, check `git status` and `git stash list`, count affected rows with a `SELECT` before a `DELETE` or `UPDATE`, and use `--dry-run` or `terraform plan` where available.
- Prefer reversible alternatives: `git stash` over discarding changes, `--force-with-lease` over `--force`, a new commit over rewriting shared history, moving to a backup over deleting.
- Never escalate to get past an error (`sudo`, `--force`, `--no-verify`, disabling a check) without explaining why and asking first.
- Quote paths and guard against empty variables and broad globs (`rm -rf "$DIR"/*` with an unset `DIR` deletes from the root).
- Treat approval as specific: permission to delete one directory or force-push once does not cover the next one.
- If a destructive action happened by mistake, say so immediately and explain what can be recovered.
