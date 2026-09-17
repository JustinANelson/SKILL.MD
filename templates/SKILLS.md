# Project Skills Index

This project uses modular AI Agent Skills. Each skill lives in its own folder
(e.g., `.claude/skills/NAME/SKILL.md` or `.cursor/rules/NAME.mdc`) and is loaded
automatically by your AI coding assistant when its description matches the current task.

---

## 🎨 Vibe Coder Essentials

Designed for rapid, prompt-driven iteration without the common traps of AI-generated code:

- **protect-existing-features** - Stop the regression loop: never break previously working flows or routes when adding new code.
- **stack-consistency** - Stop framework sprawl: reuse existing UI libraries, Tailwind/CSS patterns, and state management instead of mixing rival libraries.
- **environment-readiness** - Zero deployment amnesia: keeps `.env.example` synced, validates missing keys gracefully, and prevents runtime crashes.
- **database-safety** - Never wipe data: prevents accidental schema resets (`--force-reset`), destructive column drops, and protects test/production rows.
- **build-verification** - Zero deployment surprises: runs production builds and TypeScript checks before claiming completion so Vercel/Netlify never fail.
- **no-dead-ends** - Honest completion: eliminates fake "dummy" buttons that do nothing, wires forms end-to-end, and flags mock data clearly.
- **human-handoff** - Clear next steps: delivers exact localhost URLs, click-by-click test instructions, and zero engineering jargon.

---

## 🛡️ Core Engineering Gates

Industry-standard development practices, static analysis, and security baselines:

- **token-efficiency** - Keep assistant context and tool responses lean; avoid redundant reads and narration.
- **code-conventions** - Consistent style, idiomatic naming, avoiding premature abstractions and dead code.
- **testing-before-done** - Verify work thoroughly (tests, linters, types) before reporting complete.
- **commit-hygiene** - Clean, focused, conventional git commits and branch discipline.
- **security-baseline** - Core security habits: input sanitization, secret management, injection prevention.
- **scope-discipline** - Stay strictly inside requested scope; avoid drive-by refactoring.
- **quality-gate** - Concrete static analysis thresholds, cyclomatic complexity limits, and test coverage standards.
- **efficiency-gate** - Runtime Big-O complexity, N+1 query prevention, caching, and performance budgets.
- **error-resilience** - Explicit error handling, defensive guards, safe resource cleanup, and actionable diagnostics.
- **dependency-hygiene** - Supply-chain vetting, minimal dependencies, locked versions, and vulnerability audits.
- **docs-and-changelog** - Keeping README, API guides, configuration docs, and changelogs in lockstep with changes.

---

## Adding or Customizing Skills

Add new skills by creating a folder under `skills/<name>` with its own `SKILL.md` file.
Each `SKILL.md` must start with a YAML frontmatter block containing `name` and `description`:

```yaml
---
name: my-skill
description: Use when doing XYZ to ensure ABC standards.
---

# My Skill Title

- Guidance bullet 1
- Guidance bullet 2
```
The description is what agentic tools use to dynamically activate the skill when needed.
