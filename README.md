# SKILL.MD — Modular AI Assistant Engineering Skills

A cross-platform scaffolding toolkit and catalog of curated engineering skills for AI coding assistants (Claude Code, Cursor, Windsurf, GitHub Copilot, Gemini CLI / Antigravity, OpenAI Codex, Zed, and more).

Whether you are an engineering team enforcing strict quality gates or a **vibe coder** building fast prototypes, **SKILL.MD** provides modular, task-triggered behavioral guidelines that activate only when relevant—keeping assistant context windows lean and focused.

---

## Quickstart

Clone or download this repository, then run the initializer targeting your project directory:

### Windows (PowerShell / CMD)

```powershell
# Initialize Claude Code skills in current directory
.\init-skills.ps1

# Initialize for Cursor (.cursor/rules/*.mdc)
.\init-skills.ps1 -Target "C:\path\to\my-app" -Tool cursor

# Initialize for all supported assistants with overwrite
.\init-skills.ps1 -Tool all -Force
```

You can also run directly from Command Prompt via `init-skills.bat`:
```cmd
init-skills.bat "C:\path\to\my-app" --tool all
```

### macOS / Linux / WSL (Bash / Zsh)

```bash
# Make script executable (first time only)
chmod +x init-skills.sh

# Initialize Claude Code skills in current directory
./init-skills.sh

# Initialize for a specific tool and target
./init-skills.sh /path/to/my-app --tool copilot

# List all available skills
./init-skills.sh --list
```

---

## Supported AI Assistants & Formats

Using the `--tool` flag, you can scaffold formats tailored to each assistant's native configuration:

| Tool Flag | Assistant | Generated Files | Format |
| :--- | :--- | :--- | :--- |
| `claude` *(default)* | **Claude Code** | `.claude/skills/<name>/SKILL.md`<br>`SKILLS.md`<br>`AI-TOOL-LOCATIONS.md` | Modular Agent Skills with YAML frontmatter |
| `cursor` | **Cursor** | `.cursor/rules/<name>.mdc` | Modular MDC rules with glob and apply metadata |
| `windsurf` | **Windsurf** | `.windsurf/rules/<name>.md` | Markdown rules with frontmatter triggers |
| `copilot` | **GitHub Copilot** | `.github/copilot-instructions.md` | Aggregated repository instructions |
| `gemini` | **Gemini CLI / Antigravity** | `GEMINI.md` | Aggregated project instructions doc |
| `agents` | **Codex, Zed, Open Agents** | `AGENTS.md` | Standard Agent guideline document |
| `all` | **All Assistants** | *Generates all of the above formats simultaneously* |

See [`templates/AI-TOOL-LOCATIONS.md`](file:///C:/Users/jnels/Projects/SKILL.MD/templates/AI-TOOL-LOCATIONS.md) for full details on each tool's configuration paths.

---

## Skill Catalog

### 🎨 Vibe Coder Essentials (13 Skills)
Designed to solve the most common frustrations and traps when building apps by prompting:

| Skill | Solves This Vibe Coding Pain Point | Trigger Context |
| :--- | :--- | :--- |
| **`protect-existing-features`** | The AI broke what was working 5 minutes ago | Modifying existing code or adding features; preserves adjacent routes and caller contracts. |
| **`stack-consistency`** | The AI installed 3 competing UI frameworks | Adding components or styles; forces reuse of existing Tailwind, icons, and UI primitives. |
| **`environment-readiness`** | Mystery crashes on deploy due to missing `.env` | Adding APIs or secrets; keeps `.env.example` synced and provides friendly missing-key hints. |
| **`database-safety`** | The AI ran `--force-reset` and wiped all my data | Altering models or schemas; blocks destructive table drops and ensures additive migrations. |
| **`build-verification`** | Pushed to Vercel/Netlify and the build failed red | Finishing tasks; validates `npm run build` and TypeScript types before claiming success. |
| **`no-dead-ends`** | Buttons that do nothing and silent mock data | Building UI; eliminates non-working dummy elements, wires forms, and flags demo mock data. |
| **`human-handoff`** | Confusing walls of technical jargon | Completing prompts; outputs exact localhost URLs, click-by-click test steps, and clear next moves. |
| **`mobile-ready`** | Broken mobile layout and horizontal scroll leaks | Layouts and pages; enforces 44px+ touch targets, mobile drawers, and zero horizontal scrolling. |
| **`loading-and-error-states`** | White screen freeze or multi-click duplicates | Async actions; adds skeletons, disables buttons while submitting, and adds error toasts. |
| **`api-cost-safety`** | Leaked AI keys or accidental $50 credit drains | Integrating LLMs; keeps keys server-side, sets `max_tokens` limits, and debounces inputs. |
| **`auth-flow-guard`** | Flash of private dashboard UI & null user errors | Authentication flows; guards route transitions, handles guest redirects, and checks null users safely. |
| **`dark-mode-polish`** | Unreadable dark-on-dark or white-on-white text | Theming & styles; ensures inputs, popovers, dropdowns, and modals have crisp contrast in both modes. |
| **`dev-server-sanity`** | Port drift (3000 vs 3001) and broken OAuth loops | Dev servers & ports; locks default ports, clears zombie processes, and aligns OAuth redirect URIs. |

### 🛡️ Core Engineering Gates (11 Skills)
Industry-standard software engineering practices, static analysis, and security baselines:

| Skill | Focus & Discipline | Trigger Context |
| :--- | :--- | :--- |
| **`token-efficiency`** | Context Economy | Exploring code or replying; prevents redundant file dumps and narration. |
| **`code-conventions`** | Clean Architecture | Consistent formatting, idiomatic naming, avoiding premature abstractions. |
| **`testing-before-done`** | Verification | Running existing test suites and linters before reporting complete. |
| **`commit-hygiene`** | Git History | Conventional commits, single-purpose commits, preserving history. |
| **`security-baseline`** | Secure Defaults | Input validation, parameterized queries, secret safety, XSS escaping. |
| **`scope-discipline`** | Minimal Blast Radius | Sticking strictly to requested scope; avoids unprompted refactorings. |
| **`quality-gate`** | Concrete Thresholds | Static analysis gates: `< 3%` duplication, `80%+` coverage, cyclomatic limits. |
| **`efficiency-gate`** | Runtime Complexity | Big-O on hot paths, N+1 query prevention, caching, bundle size budgets. |
| **`error-resilience`** | Robust Error Handling | Explicit failure handling, defensive guards, safe resource teardown. |
| **`dependency-hygiene`** | Supply Chain Safety | Vetting third-party packages, avoiding utility bloat, lockfiles. |
| **`docs-and-changelog`** | Documentation Sync | Keeping READMEs, API docs, CLI flags, and changelogs up to date. |

---

## CLI Reference

### Parameters & Flags

```text
Options:
  -t, --tool TOOL       Target tool: claude, cursor, windsurf, copilot, gemini, agents, all
                        (default: claude)
  -f, --force           Overwrite existing files instead of skipping
  -n, --dry-run         Preview files that will be created without modifying disk
  -l, --list            List all available skills with their triggers
  -h, --help            Show help message
```

---

## Creating Custom Skills

To add a new skill to the catalog:

1. Create a directory under `templates/skills/<skill-name>/`
2. Add a `SKILL.md` file with standard YAML frontmatter:

```markdown
---
name: my-new-skill
description: Use when doing [specific task] to ensure [quality/standard/habit].
---

# My New Skill Title

- Actionable, imperative guideline 1.
- Concrete threshold or boundary condition 2.
- Failure mode to avoid 3.
```

The initializer scripts dynamically discover all subfolders in `templates/skills/` without requiring script modifications.

---

## License

MIT License. See [`LICENSE`](file:///C:/Users/jnels/Projects/SKILL.MD/LICENSE) for details.
