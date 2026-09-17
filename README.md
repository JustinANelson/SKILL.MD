# SKILL.MD — Modular AI Assistant Engineering Skills

A cross-platform scaffolding toolkit and catalog of curated engineering skills for AI coding assistants (Claude Code, Cursor, Windsurf, GitHub Copilot, Gemini CLI / Antigravity, OpenAI Codex, Zed, and more).

Instead of maintaining brittle, monolithic prompts or dumping pages of instructions that saturate context windows, **SKILL.MD** provides modular, task-triggered behavioral guidelines and quality gates that activate only when relevant.

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

## Available Skills

| Skill | Focus & Discipline | Trigger Context |
| :--- | :--- | :--- |
| **`token-efficiency`** | Context & Token Economy | Writing code, exploring repositories, or replying; avoids redundant file dumps and narration. |
| **`code-conventions`** | Clean Architecture | Consistent formatting, idiomatic naming, avoiding premature abstractions and dead code. |
| **`testing-before-done`** | Verification | Running existing test suites, linters, and type checkers before claiming completion. |
| **`commit-hygiene`** | Git Discipline | Conventional commits, single-purpose commits, preserving history, confirming pushes. |
| **`security-baseline`** | Secure Defaults | Input validation at boundaries, parameterized queries, secret safety, XSS escaping. |
| **`scope-discipline`** | Minimal Blast Radius | Sticking strictly to requested scope; avoids unprompted refactorings and scope creep. |
| **`quality-gate`** | Concrete Thresholds | Static analysis gates: `< 3%` code duplication, `80%+` new code test coverage, cyclomatic complexity limits. |
| **`efficiency-gate`** | Runtime Complexity | Big-O analysis on hot paths, N+1 query prevention, caching, and dependency size budgets. |
| **`error-resilience`** | Robust Error Handling | Explicit failure handling, defensive guards, safe resource teardown (`finally`/`using`), clear diagnostics. |
| **`dependency-hygiene`** | Supply Chain Safety | Vetting third-party packages, avoiding utility bloat, committing lockfiles, vulnerability audits. |
| **`docs-and-changelog`** | Documentation Sync | Keeping READMEs, API docs, CLI flags, and changelogs up-to-date with every functional change. |

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
