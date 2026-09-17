# AI Coding Assistant Instruction Locations

Different AI coding assistants expect instructions, system prompts, or skill definitions at different repository paths.

The `init-skills` initialization scripts (`init-skills.sh`, `init-skills.ps1`, `init-skills.bat`) can scaffold these rules automatically using the `--tool` flag (e.g., `--tool=cursor`, `--tool=all`, `--tool=copilot`).

| Tool | Rule / Skill File Locations | Format Supported by `init-skills` |
| :--- | :--- | :--- |
| **Claude Code** | `.claude/skills/<name>/SKILL.md`, `CLAUDE.md` | Modular Agent Skills |
| **Cursor** | `.cursor/rules/*.mdc` (legacy: `.cursorrules`) | MDC Rules with frontmatter |
| **Windsurf** | `.windsurf/rules/*.md` (legacy: `.windsurfrules`) | Markdown Rules |
| **GitHub Copilot** | `.github/copilot-instructions.md`, `.github/instructions/*.instructions.md` | Bundled Markdown Instructions |
| **Antigravity / Gemini CLI** | `GEMINI.md` | Bundled Markdown Instructions |
| **OpenAI Codex / Zed / General Agents**| `AGENTS.md` | Standard Agent Instruction Doc |
| **Cline** | `.clinerules/` or `.clinerules` | Markdown Rules |
| **Roo Code** | `.roo/rules/` | Markdown Rules |
| **Continue.dev** | `.continue/rules/*.md` | Markdown Rules |
| **Aider** | `CONVENTIONS.md` (via `--read`), `.aider.conf.yml` | Conventions Doc |
| **Amazon Q Developer** | `.amazonq/rules/*.md` | Markdown Rules |
| **JetBrains Junie** | `.junie/guidelines.md` | Guidelines Doc |

> [!NOTE]
> Tool specifications evolve over time. Run `init-skills.sh --tool=all` or `init-skills.ps1 -Tool all` to generate instruction artifacts across all major formats simultaneously.
