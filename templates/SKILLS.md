# Project Skills Index

This project uses modular AI Agent Skills. Each skill lives in its own folder
(e.g., `.claude/skills/NAME/SKILL.md` or `.cursor/rules/NAME.mdc`) and is loaded
automatically by your AI coding assistant when its description matches the current task.

---

## 🎨 Vibe Coder Essentials (13 Skills)

Designed to solve the most common frustrations and traps when building apps by prompting.

- **api-cost-safety** - Credit and secret protection: keeps paid AI keys server-side only, enforces `max_tokens` limits, debounces inputs, and blocks infinite retry loops.
- **auth-flow-guard** - Rock-solid auth flows: stops flashes of protected content, safely handles null users, and cleans up state on logout.
- **build-verification** - Zero deployment surprises: runs production builds and TypeScript checks before claiming completion so Vercel/Netlify never fail.
- **dark-mode-polish** - High-contrast themes: ensures modals, inputs, and dropdowns adapt cleanly without unreadable white-on-white or dark-on-dark bugs.
- **database-safety** - Never wipe data: prevents accidental schema resets (`--force-reset`), destructive column drops, and protects test/production rows.
- **dev-server-sanity** - Port and CORS clarity: locks default ports (e.g. 3000), stops OAuth callback mismatches, and prevents CORS traps.
- **environment-readiness** - Zero deployment amnesia: keeps `.env.example` synced, validates missing keys gracefully, and prevents runtime crashes.
- **human-handoff** - Clear next steps: delivers exact localhost URLs, click-by-click test instructions, and zero engineering jargon.
- **loading-and-error-states** - Zero white screens: adds skeleton loaders, disables buttons while submitting, shows error toasts, and designs helpful empty states.
- **mobile-ready** - Clean responsiveness: ensures touch targets (44px+), accessible drawers, and zero horizontal scroll leaks on mobile viewports.
- **no-dead-ends** - Honest completion: eliminates fake "dummy" buttons that do nothing, wires forms end-to-end, and flags mock data clearly.
- **protect-existing-features** - Stop the regression loop: never break previously working flows or routes when adding new code.
- **stack-consistency** - Stop framework sprawl: reuse existing UI libraries, Tailwind/CSS patterns, and state management instead of mixing rival libraries.

---

## 🛡️ Core Engineering Gates (11 Skills)

Industry-standard software engineering practices, static analysis, and security baselines.

- **code-conventions** - Consistent style, idiomatic naming, avoiding premature abstractions and dead code.
- **commit-hygiene** - Clean, focused, conventional git commits and branch discipline.
- **dependency-hygiene** - Supply-chain vetting, minimal dependencies, locked versions, and vulnerability audits.
- **docs-and-changelog** - Keeping README, API guides, configuration docs, and changelogs in lockstep with changes.
- **efficiency-gate** - Runtime Big-O complexity, N+1 query prevention, caching, and performance budgets.
- **error-resilience** - Explicit error handling, defensive guards, safe resource cleanup, and actionable diagnostics.
- **quality-gate** - Concrete static analysis thresholds, cyclomatic complexity limits, and test coverage standards.
- **scope-discipline** - Stay strictly inside requested scope; avoid drive-by refactoring.
- **security-baseline** - Core security habits: input sanitization, secret management, injection prevention.
- **testing-before-done** - Verify work thoroughly (tests, linters, types) before reporting complete.
- **token-efficiency** - Keep assistant context and tool responses lean; avoid redundant reads and narration.

---

## ⚙️ Architecture & DevOps Standards (6 Skills)

Production-grade patterns for APIs, accessibility, containerization, and automation.

- **accessibility-baseline** - WCAG 2.1 AA compliance: semantic HTML, keyboard focus navigation, ARIA labels, and accessible dialogs.
- **api-design-standards** - Clean RESTful endpoints: plural nouns, HTTP verb semantics, standard status codes, and uniform response envelopes.
- **ci-cd-pipeline** - Reliable automation: cached dependencies, parallel test matrices, least-privilege permissions, and GitHub Actions security.
- **container-hygiene** - Production container best practices: multi-stage Dockerfiles, non-root users, .dockerignore, and layer caching.
- **schema-validation** - Runtime type safety: Zod/Pydantic validation at boundaries, safe error mapping, and input sanitization.
- **seo-and-metadata** - Social sharing & discovery: Open Graph tags, Twitter cards, dynamic titles, meta descriptions, and sitemaps.

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
