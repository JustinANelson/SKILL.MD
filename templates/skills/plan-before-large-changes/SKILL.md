---
name: plan-before-large-changes
description: Use when a task spans many files, multiple subsystems, a data migration, or several dependent steps, to outline a plan, confirm direction, and deliver in verifiable increments instead of one giant change.
metadata:
  category: agent-workflow
  tagline: 'A 40-file rewrite that half works and cannot be reviewed'
  summary: 'Plan, then build in slices: a short plan for multi-step work, a checkpoint after each verified step, and a re-plan when assumptions break.'
---

# Plan Before Large Changes

- For work touching more than a handful of files or more than one subsystem, first write a short plan: the goal, the areas to change, the order, and how each step will be verified.
- Wait for agreement when the plan involves a design choice, a data migration, a new dependency, or a change in public behavior; proceed directly when the path is obvious.
- Break the work into steps that each leave the project building and working, and verify each step before starting the next.
- Checkpoint after each verified step (a commit, if the user works that way) so a bad step can be reverted without losing the rest.
- If a discovery invalidates the plan, stop and update it rather than silently improvising a different approach.
- Keep the plan short (a numbered list, not a design document) unless the user asks for more.
