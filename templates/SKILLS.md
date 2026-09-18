# Project Skills Index

This project uses modular AI Agent Skills. Each skill lives in its own folder
(e.g., `.claude/skills/NAME/SKILL.md` or `.cursor/rules/NAME.mdc`) and is loaded
automatically by your AI coding assistant when its description matches the current task.

<!-- BEGIN CATEGORY vibe-coder-essentials -->

---

## 🎨 Vibe Coder Essentials (10 Skills)

Designed to solve the most common frustrations and traps when building apps by prompting.

- **auth-flow-guard** - Rock-solid auth flows: stops flashes of protected content, safely handles null users, and cleans up state on logout.
- **build-verification** - Zero deployment surprises: runs production builds and TypeScript checks before claiming completion so Vercel/Netlify never fail.
- **dark-mode-polish** - High-contrast themes: ensures modals, inputs, and dropdowns adapt cleanly without unreadable white-on-white or dark-on-dark bugs.
- **database-safety** - Never wipe data: prevents accidental schema resets (`--force-reset`), destructive column drops, and protects test/production rows.
- **dev-server-sanity** - Port and CORS clarity: locks default ports (e.g. 3000), stops OAuth callback mismatches, and prevents CORS traps.
- **environment-readiness** - Zero deployment amnesia: keeps `.env.example` synced, validates missing keys gracefully, and prevents runtime crashes.
- **loading-and-error-states** - Zero white screens: adds skeleton loaders, disables buttons while submitting, shows error toasts, and designs helpful empty states.
- **mobile-ready** - Clean responsiveness: ensures touch targets (44px+), accessible drawers, and zero horizontal scroll leaks on mobile viewports.
- **no-dead-ends** - Honest completion: eliminates fake "dummy" buttons that do nothing, wires forms end-to-end, and flags mock data clearly.
- **stack-consistency** - Stop framework sprawl: reuse existing UI libraries, Tailwind/CSS patterns, and state management instead of mixing rival libraries.
<!-- END CATEGORY vibe-coder-essentials -->

<!-- BEGIN CATEGORY core-engineering-gates -->

---

## 🛡️ Core Engineering Gates (8 Skills)

Industry-standard software engineering practices, static analysis, and quality baselines.

- **code-conventions** - Consistent style, idiomatic naming, avoiding premature abstractions and dead code.
- **commit-hygiene** - Clean, focused, conventional git commits and branch discipline.
- **dependency-hygiene** - Supply-chain vetting, minimal dependencies, locked versions, and vulnerability audits.
- **docs-and-changelog** - Keeping README, API guides, configuration docs, and changelogs in lockstep with changes.
- **efficiency-gate** - Runtime Big-O complexity, N+1 query prevention, caching, and performance budgets.
- **error-resilience** - Explicit error handling, defensive guards, safe resource cleanup, and actionable diagnostics.
- **quality-gate** - Concrete static analysis thresholds, cyclomatic complexity limits, and test coverage standards.
- **testing-before-done** - Verify work thoroughly (tests, linters, types) before reporting complete.
<!-- END CATEGORY core-engineering-gates -->

<!-- BEGIN CATEGORY architecture-and-devops -->

---

## ⚙️ Architecture & DevOps Standards (6 Skills)

Production-grade patterns for APIs, accessibility, containerization, and automation.

- **accessibility-baseline** - WCAG 2.1 AA compliance: semantic HTML, keyboard focus navigation, ARIA labels, and accessible dialogs.
- **api-design-standards** - Clean RESTful endpoints: plural nouns, HTTP verb semantics, standard status codes, and uniform response envelopes.
- **ci-cd-pipeline** - Reliable automation: cached dependencies, parallel test matrices, least-privilege permissions, and GitHub Actions security.
- **container-hygiene** - Production container best practices: multi-stage Dockerfiles, non-root users, .dockerignore, and layer caching.
- **schema-validation** - Runtime type safety: Zod/Pydantic validation at boundaries, safe error mapping, and input sanitization.
- **seo-and-metadata** - Social sharing & discovery: Open Graph tags, Twitter cards, dynamic titles, meta descriptions, and sitemaps.
<!-- END CATEGORY architecture-and-devops -->

<!-- BEGIN CATEGORY ai-llm-engineering -->

---

## 🤖 AI & LLM App Engineering (6 Skills)

Guardrails for apps that call language models: cost, prompt injection, output validation, evals, streaming, and retrieval.

- **api-cost-safety** - Credit and secret protection: keeps paid AI keys server-side only, enforces `max_tokens` limits, debounces inputs, and blocks infinite retry loops.
- **llm-output-validation** - Schema-checked model output: structured output modes, validation with bounded retries, and explicit handling of refusals and truncated responses.
- **prompt-injection-defense** - Untrusted content stays data: delimits retrieved text, scopes agent tools to least privilege, and requires server-side checks before side effects.
- **prompt-regression-evals** - Small eval sets for every prompt: stored test cases, before/after pass rates, and no prompt or model swaps on vibes alone.
- **rag-hygiene** - Trustworthy retrieval: structure-aware chunking, per-user access filters at query time, source citations, and re-indexing when content changes.
- **streaming-ux** - Responsive AI interfaces: token streaming, Stop buttons that actually cancel upstream, and clean recovery when a stream fails halfway.
<!-- END CATEGORY ai-llm-engineering -->

<!-- BEGIN CATEGORY security-and-privacy -->

---

## 🔐 Security & Privacy (5 Skills)

Defenses beyond secure defaults: authorization, abuse prevention, secrets, and personal data handling.

- **authorization-checks** - Server-side ownership checks on every read and write: scoped queries, row-level security, and never trusting IDs or roles sent by the client.
- **privacy-and-pii** - Privacy by default: collect only what is needed, keep PII out of logs and prompts, set retention limits, and support real export and deletion.
- **rate-limiting-and-abuse** - Abuse-resistant endpoints: per-IP and per-account limits, backoff on failures, bot checks on public forms, and quotas on costly operations.
- **secrets-management** - Secret lifecycle discipline: least-privilege keys per environment, nothing in git or client bundles, and immediate rotation when one leaks.
- **security-baseline** - Core security habits: input sanitization, secret management, injection prevention.
<!-- END CATEGORY security-and-privacy -->

<!-- BEGIN CATEGORY agent-workflow -->

---

## 🧭 Agent Workflow & Collaboration (8 Skills)

How the assistant itself works: staying in scope, staying safe, managing context, and handing off clearly.

- **ask-vs-assume** - Ask only when it matters: look facts up in the codebase, proceed on stated defaults for low-stakes choices, and ask when the answer changes the outcome.
- **destructive-command-guard** - Look before you delete: inspect targets, prefer reversible commands, and get explicit confirmation for irreversible or production-affecting actions.
- **human-handoff** - Clear next steps: delivers exact localhost URLs, click-by-click test instructions, and zero engineering jargon.
- **plan-before-large-changes** - Plan, then build in slices: a short plan for multi-step work, a checkpoint after each verified step, and a re-plan when assumptions break.
- **protect-existing-features** - Stop the regression loop: never break previously working flows or routes when adding new code.
- **scope-discipline** - Stay strictly inside requested scope; avoid drive-by refactoring.
- **session-notes** - Durable working memory: a short progress file with goal, decisions, status, next steps, and gotchas, read on resume and updated at milestones.
- **token-efficiency** - Keep assistant context and tool responses lean; avoid redundant reads and narration.
<!-- END CATEGORY agent-workflow -->

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
