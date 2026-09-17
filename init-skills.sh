#!/usr/bin/env bash
# ==============================================================================
# init-skills.sh - Cross-platform AI Coding Assistant Skills Initializer
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="${SCRIPT_DIR}/templates"
SKILLS_DIR="${TEMPLATES_DIR}/skills"

TARGET="${PWD}"
TOOL="claude"
FORCE=0
DRY_RUN=0
LIST_ONLY=0

show_help() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] [TARGET_DIR]

Initializes AI assistant skills and instructions into a project repository.

Arguments:
  TARGET_DIR                 Destination repository (default: current directory)

Options:
  -t, --tool TOOL            Target format: claude, cursor, windsurf, copilot,
                             gemini, agents, all (default: claude)
  -f, --force                Overwrite existing files
  -n, --dry-run              Display operations without writing to disk
  -l, --list                 List all available skills
  -h, --help                 Show this help message

Examples:
  $(basename "$0")                                # Initialize Claude Code skills in current dir
  $(basename "$0") /path/to/project -t cursor     # Initialize Cursor rules in target dir
  $(basename "$0") -t all -f                      # Initialize all tool formats, overwriting existing
  $(basename "$0") -l                             # List all available skills
EOF
}

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -l|--list)
      LIST_ONLY=1
      shift
      ;;
    -f|--force)
      FORCE=1
      shift
      ;;
    -n|--dry-run)
      DRY_RUN=1
      shift
      ;;
    -t|--tool)
      TOOL="$2"
      shift 2
      ;;
    --tool=*)
      TOOL="${1#*=}"
      shift
      ;;
    -*)
      echo "[error] Unknown option: $1" >&2
      show_help
      exit 1
      ;;
    *)
      TARGET="$1"
      shift
      ;;
  esac
done

if [[ ! -d "${SKILLS_DIR}" ]]; then
  echo "[error] Templates directory not found at: ${SKILLS_DIR}" >&2
  exit 1
fi

# List skills
if [[ ${LIST_ONLY} -eq 1 ]]; then
  echo ""
  echo "Available Skills in Templates:"
  echo "------------------------------------------------------------------------"
  for skill_path in "${SKILLS_DIR}"/*; do
    if [[ -d "${skill_path}" && -f "${skill_path}/SKILL.md" ]]; then
      skill_name="$(basename "${skill_path}")"
      desc=$(sed -n '/^description:/s/^description:[[:space:]]*//p' "${skill_path}/SKILL.md" | head -n 1)
      printf "  %-22s %s\n" "${skill_name}" "${desc}"
    fi
  done
  echo "------------------------------------------------------------------------"
  echo ""
  exit 0
fi

# Resolve absolute target path
TARGET="$(cd "${TARGET}" 2>/dev/null && pwd || echo "${TARGET}")"

# Safety check
if [[ "${TARGET}" == "${SCRIPT_DIR}" && ${FORCE} -eq 0 ]]; then
  echo "[warning] Target is the SKILL.MD template repository itself."
  echo "Pass --force if you intentionally wish to install here."
  exit 0
fi

echo ""
echo "========================================================"
echo " Initializing AI Skills & Guidelines"
echo " Tool:   ${TOOL}"
echo " Target: ${TARGET}"
if [[ ${DRY_RUN} -eq 1 ]]; then echo " Mode:   DRY-RUN (no files will be written)"; fi
echo "========================================================"
echo ""

copy_or_skip() {
  local src="$1"
  local dest="$2"
  local dest_dir
  dest_dir="$(dirname "${dest}")"

  if [[ ! -d "${dest_dir}" ]]; then
    if [[ ${DRY_RUN} -eq 0 ]]; then
      mkdir -p "${dest_dir}"
    fi
  fi

  if [[ -f "${dest}" ]]; then
    if [[ ${FORCE} -eq 1 ]]; then
      if [[ ${DRY_RUN} -eq 1 ]]; then
        echo "  [plan] ${dest} (overwrite)"
      else
        cp "${src}" "${dest}"
        echo "  [ok]   ${dest} (overwritten)"
      fi
    else
      echo "  [skip] ${dest} (already exists)"
    fi
  else
    if [[ ${DRY_RUN} -eq 1 ]]; then
      echo "  [plan] ${dest}"
    else
      cp "${src}" "${dest}"
      echo "  [ok]   ${dest}"
    fi
  fi
}

write_or_skip() {
  local content="$1"
  local dest="$2"
  local dest_dir
  dest_dir="$(dirname "${dest}")"

  if [[ ! -d "${dest_dir}" ]]; then
    if [[ ${DRY_RUN} -eq 0 ]]; then
      mkdir -p "${dest_dir}"
    fi
  fi

  if [[ -f "${dest}" ]]; then
    if [[ ${FORCE} -eq 1 ]]; then
      if [[ ${DRY_RUN} -eq 1 ]]; then
        echo "  [plan] ${dest} (overwrite)"
      else
        printf "%s\n" "${content}" > "${dest}"
        echo "  [ok]   ${dest} (overwritten)"
      fi
    else
      echo "  [skip] ${dest} (already exists)"
    fi
  else
    if [[ ${DRY_RUN} -eq 1 ]]; then
      echo "  [plan] ${dest}"
    else
      printf "%s\n" "${content}" > "${dest}"
      echo "  [ok]   ${dest}"
    fi
  fi
}

generate_aggregated() {
  local title="$1"
  local subtitle="$2"
  local out=""

  out="# ${title}\n\n${subtitle}\n\n---\n\n"
  for skill_path in "${SKILLS_DIR}"/*; do
    if [[ -d "${skill_path}" && -f "${skill_path}/SKILL.md" ]]; then
      skill_name="$(basename "${skill_path}")"
      desc=$(sed -n '/^description:/s/^description:[[:space:]]*//p' "${skill_path}/SKILL.md" | head -n 1)
      # Extract body without frontmatter
      body=$(awk 'BEGIN{c=0} /^---$/{c++; next} c>=2{print}' "${skill_path}/SKILL.md")
      out="${out}## Skill: ${skill_name}\n\n> **Trigger/Description:** ${desc}\n\n${body}\n\n---\n\n"
    fi
  done
  echo -e "${out}"
}

# 1. Claude Code
if [[ "${TOOL}" == "claude" || "${TOOL}" == "all" ]]; then
  echo "  [info] Targeting Claude Code (.claude/skills/)..."
  copy_or_skip "${TEMPLATES_DIR}/SKILLS.md" "${TARGET}/SKILLS.md"
  copy_or_skip "${TEMPLATES_DIR}/AI-TOOL-LOCATIONS.md" "${TARGET}/AI-TOOL-LOCATIONS.md"

  for skill_path in "${SKILLS_DIR}"/*; do
    if [[ -d "${skill_path}" && -f "${skill_path}/SKILL.md" ]]; then
      skill_name="$(basename "${skill_path}")"
      copy_or_skip "${skill_path}/SKILL.md" "${TARGET}/.claude/skills/${skill_name}/SKILL.md"
    fi
  done
fi

# 2. Cursor (.cursor/rules/<name>.mdc)
if [[ "${TOOL}" == "cursor" || "${TOOL}" == "all" ]]; then
  echo "  [info] Targeting Cursor (.cursor/rules/)..."
  for skill_path in "${SKILLS_DIR}"/*; do
    if [[ -d "${skill_path}" && -f "${skill_path}/SKILL.md" ]]; then
      skill_name="$(basename "${skill_path}")"
      desc=$(sed -n '/^description:/s/^description:[[:space:]]*//p' "${skill_path}/SKILL.md" | head -n 1)
      body=$(awk 'BEGIN{c=0} /^---$/{c++; next} c>=2{print}' "${skill_path}/SKILL.md")
      mdc="---\ndescription: ${desc}\nglobs: *\nalwaysApply: false\n---\n\n${body}"
      write_or_skip "$(echo -e "${mdc}")" "${TARGET}/.cursor/rules/${skill_name}.mdc"
    fi
  done
fi

# 3. Windsurf (.windsurf/rules/<name>.md)
if [[ "${TOOL}" == "windsurf" || "${TOOL}" == "all" ]]; then
  echo "  [info] Targeting Windsurf (.windsurf/rules/)..."
  for skill_path in "${SKILLS_DIR}"/*; do
    if [[ -d "${skill_path}" && -f "${skill_path}/SKILL.md" ]]; then
      skill_name="$(basename "${skill_path}")"
      copy_or_skip "${skill_path}/SKILL.md" "${TARGET}/.windsurf/rules/${skill_name}.md"
    fi
  done
fi

# 4. Copilot (.github/copilot-instructions.md)
if [[ "${TOOL}" == "copilot" || "${TOOL}" == "all" ]]; then
  echo "  [info] Targeting GitHub Copilot (.github/copilot-instructions.md)..."
  content=$(generate_aggregated "Repository AI Instructions (GitHub Copilot)" "The following engineering standards apply to Copilot interactions in this repository.")
  write_or_skip "${content}" "${TARGET}/.github/copilot-instructions.md"
fi

# 5. Gemini / Antigravity (GEMINI.md)
if [[ "${TOOL}" == "gemini" || "${TOOL}" == "all" ]]; then
  echo "  [info] Targeting Gemini CLI & Antigravity (GEMINI.md)..."
  content=$(generate_aggregated "Project Instructions (Gemini / Antigravity)" "Engineering guidelines and operational skills for Gemini CLI and Antigravity agents.")
  write_or_skip "${content}" "${TARGET}/GEMINI.md"
fi

# 6. Agents / Codex (AGENTS.md)
if [[ "${TOOL}" == "agents" || "${TOOL}" == "all" ]]; then
  echo "  [info] Targeting General Agents & Codex (AGENTS.md)..."
  content=$(generate_aggregated "Repository Agent Guidelines (AGENTS.md)" "General agent guidelines, coding standards, and operational gates for AI assistants.")
  write_or_skip "${content}" "${TARGET}/AGENTS.md"
fi

echo ""
echo "[done] Initialization complete."
echo ""
