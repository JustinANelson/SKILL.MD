<#
.SYNOPSIS
    Initializes AI coding assistant skills and instructions in a target repository.

.DESCRIPTION
    Scaffolds modular AI skills from templates/skills into target project formats:
    - claude:   .claude/skills/<name>/SKILL.md, SKILLS.md, AI-TOOL-LOCATIONS.md
    - cursor:   .cursor/rules/<name>.mdc
    - windsurf: .windsurf/rules/<name>.md
    - copilot:  .github/copilot-instructions.md
    - gemini:   GEMINI.md
    - agents:   AGENTS.md
    - all:      Generates rules for all supported assistant tools.

.PARAMETER Target
    Destination directory to initialize (default: current directory).

.PARAMETER Tool
    Target AI assistant tool format. Options: claude, cursor, windsurf, copilot, gemini, agents, all. Default: claude.

.PARAMETER Force
    Overwrite existing files instead of skipping them.

.PARAMETER DryRun
    Display actions that would be taken without writing files to disk.

.PARAMETER List
    List all available skills in the templates directory.

.EXAMPLE
    .\init-skills.ps1
    .\init-skills.ps1 -Target "C:\Users\User\Projects\MyApp" -Tool cursor
    .\init-skills.ps1 -Tool all -Force
    .\init-skills.ps1 -List
#>

[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [Alias("Destination", "Dir")]
    [string]$Target = (Get-Location).Path,

    [Alias("t")]
    [ValidateSet("claude", "cursor", "windsurf", "copilot", "gemini", "agents", "all")]
    [string]$Tool = "claude",

    [Alias("f")]
    [switch]$Force,

    [Alias("n")]
    [switch]$DryRun,

    [Alias("l")]
    [switch]$List
)

$ErrorActionPreference = "Stop"

$ScriptDir = $null
if ($PSScriptRoot) {
    $ScriptDir = $PSScriptRoot
} elseif ($MyInvocation.MyCommand.Path) {
    $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
}

$TemplateDir = if ($ScriptDir) { Join-Path $ScriptDir "templates" } else { Join-Path (Get-Location).Path "templates" }
$SkillsDir = Join-Path $TemplateDir "skills"
$TempDirToClean = $null

if (-not (Test-Path -LiteralPath $SkillsDir)) {
    Write-Host "[info] Templates not found locally. Fetching latest templates from GitHub (JustinANelson/SKILL.MD)..." -ForegroundColor Cyan
    $TempZip = Join-Path ([System.IO.Path]::GetTempPath()) ("skillmd-" + [System.Guid]::NewGuid().ToString("N") + ".zip")
    $TempDirToClean = Join-Path ([System.IO.Path]::GetTempPath()) ("skillmd-" + [System.Guid]::NewGuid().ToString("N"))
    try {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-WebRequest -Uri "https://github.com/JustinANelson/SKILL.MD/archive/refs/heads/master.zip" -OutFile $TempZip -UseBasicParsing
        Expand-Archive -LiteralPath $TempZip -DestinationPath $TempDirToClean -Force
        Remove-Item -LiteralPath $TempZip -Force -ErrorAction SilentlyContinue
        $ScriptDir = Join-Path $TempDirToClean "SKILL.MD-master"
        $TemplateDir = Join-Path $ScriptDir "templates"
        $SkillsDir = Join-Path $TemplateDir "skills"
    } catch {
        Write-Error "[error] Failed to fetch templates from GitHub: $_"
        if ($TempDirToClean -and (Test-Path -LiteralPath $TempDirToClean)) {
            Remove-Item -LiteralPath $TempDirToClean -Recurse -Force -ErrorAction SilentlyContinue
        }
        exit 1
    }
}

if (-not (Test-Path -LiteralPath $SkillsDir)) {
    Write-Error "[error] Skills templates folder not found at: $SkillsDir"
    if ($TempDirToClean -and (Test-Path -LiteralPath $TempDirToClean)) {
        Remove-Item -LiteralPath $TempDirToClean -Recurse -Force -ErrorAction SilentlyContinue
    }
    exit 1
}

# Collect all available skills
$SkillFolders = Get-ChildItem -LiteralPath $SkillsDir -Directory | Sort-Object Name
$SkillsData = @()

foreach ($folder in $SkillFolders) {
    $skillFile = Join-Path $folder.FullName "SKILL.md"
    if (Test-Path -LiteralPath $skillFile) {
        $content = Get-Content -LiteralPath $skillFile -Raw
        $name = $folder.Name
        $description = ""

        if ($content -match "(?ms)^---\s*\r?\n(.*?)\r?\n---") {
            $frontmatter = $matches[1]
            if ($frontmatter -match "name:\s*([^\r\n]+)") {
                $name = $matches[1].Trim()
            }
            if ($frontmatter -match "description:\s*([^\r\n]+)") {
                $description = $matches[1].Trim()
            }
        }

        # Body without frontmatter
        $body = ($content -replace "(?ms)^---\s*\r?\n.*?\r?\n---\s*\r?\n", "").Trim()

        $SkillsData += [PSCustomObject]@{
            Name        = $name
            FolderName  = $folder.Name
            Description = $description
            FullContent = $content
            Body        = $body
            SourceFile  = $skillFile
        }
    }
}

# Handle -List flag
if ($List) {
    Write-Host "`nAvailable Skills in Templates ($($SkillsData.Count) found):" -ForegroundColor Cyan
    Write-Host ("-" * 75)
    foreach ($s in $SkillsData) {
        Write-Host ("  {0,-22} " -f $s.Name) -NoNewline -ForegroundColor Green
        Write-Host $s.Description
    }
    Write-Host ("-" * 75)`n
    if ($TempDirToClean -and (Test-Path -LiteralPath $TempDirToClean)) {
        Remove-Item -LiteralPath $TempDirToClean -Recurse -Force -ErrorAction SilentlyContinue
    }
    exit 0
}

# Resolve target directory
$ResolvedTarget = [System.IO.Path]::GetFullPath($Target)

# Safety check: prevent accidentally initializing into the template repo itself unless forced
if (-not $TempDirToClean -and $ScriptDir -and $ResolvedTarget -eq [System.IO.Path]::GetFullPath($ScriptDir) -and -not $Force) {
    Write-Warning "Target is the SKILL.MD template repository itself."
    Write-Warning "If you really want to initialize here, pass -Force."
    exit 0
}

Write-Host "`n========================================================" -ForegroundColor Cyan
Write-Host " Initializing AI Skills & Guidelines" -ForegroundColor Cyan
Write-Host " Tool:   $Tool" -ForegroundColor Gray
Write-Host " Target: $ResolvedTarget" -ForegroundColor Gray
if ($DryRun) { Write-Host " Mode:   DRY-RUN (no files will be written)" -ForegroundColor Yellow }
Write-Host "========================================================`n" -ForegroundColor Cyan

function Write-OutputAction {
    param([string]$Status, [string]$Path)
    switch ($Status) {
        "ok"   { Write-Host "  [ok]   " -NoNewline -ForegroundColor Green; Write-Host $Path }
        "skip" { Write-Host "  [skip] " -NoNewline -ForegroundColor DarkGray; Write-Host "$Path (already exists)" }
        "plan" { Write-Host "  [plan] " -NoNewline -ForegroundColor Yellow; Write-Host $Path }
        "info" { Write-Host "  [info] " -NoNewline -ForegroundColor Cyan; Write-Host $Path }
    }
}

function Save-FileContent {
    param(
        [string]$DestinationPath,
        [string]$Content
    )
    $parent = Split-Path -Parent $DestinationPath
    if (-not (Test-Path -LiteralPath $parent)) {
        if (-not $DryRun) {
            [System.IO.Directory]::CreateDirectory($parent) | Out-Null
        }
    }

    if (Test-Path -LiteralPath $DestinationPath) {
        if ($Force) {
            if ($DryRun) {
                Write-OutputAction "plan" "$DestinationPath (overwrite)"
            } else {
                [System.IO.File]::WriteAllText($DestinationPath, $Content, [System.Text.Encoding]::UTF8)
                Write-OutputAction "ok" "$DestinationPath (overwritten)"
            }
        } else {
            Write-OutputAction "skip" $DestinationPath
        }
    } else {
        if ($DryRun) {
            Write-OutputAction "plan" $DestinationPath
        } else {
            [System.IO.File]::WriteAllText($DestinationPath, $Content, [System.Text.Encoding]::UTF8)
            Write-OutputAction "ok" $DestinationPath
        }
    }
}

function Build-AggregatedMarkdown {
    param([string]$Title, [string]$Subtitle)
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine("# $Title")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($Subtitle)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")

    foreach ($s in $SkillsData) {
        [void]$sb.AppendLine("## Skill: $($s.Name)")
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("> **Trigger/Description:** $($s.Description)")
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine($s.Body)
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("---")
        [void]$sb.AppendLine("")
    }
    return $sb.ToString()
}

# 1. Claude Code
if ($Tool -in @("claude", "all")) {
    Write-OutputAction "info" "Targeting Claude Code (.claude/skills/)..."

    foreach ($file in @("SKILLS.md", "AI-TOOL-LOCATIONS.md")) {
        $srcPath = Join-Path $TemplateDir $file
        $destPath = Join-Path $ResolvedTarget $file
        if (Test-Path -LiteralPath $srcPath) {
            $content = Get-Content -LiteralPath $srcPath -Raw
            Save-FileContent -DestinationPath $destPath -Content $content
        }
    }

    foreach ($s in $SkillsData) {
        $destSkill = Join-Path $ResolvedTarget (Join-Path ".claude\skills" (Join-Path $s.FolderName "SKILL.md"))
        Save-FileContent -DestinationPath $destSkill -Content $s.FullContent
    }
}

# 2. Cursor (.cursor/rules/<name>.mdc)
if ($Tool -in @("cursor", "all")) {
    Write-OutputAction "info" "Targeting Cursor (.cursor/rules/)..."
    foreach ($s in $SkillsData) {
        $mdcContent = @"
---
description: $($s.Description)
globs: *
alwaysApply: false
---

$($s.Body)
"@
        $dest = Join-Path $ResolvedTarget (Join-Path ".cursor\rules" "$($s.FolderName).mdc")
        Save-FileContent -DestinationPath $dest -Content $mdcContent
    }
}

# 3. Windsurf (.windsurf/rules/<name>.md)
if ($Tool -in @("windsurf", "all")) {
    Write-OutputAction "info" "Targeting Windsurf (.windsurf/rules/)..."
    foreach ($s in $SkillsData) {
        $dest = Join-Path $ResolvedTarget (Join-Path ".windsurf\rules" "$($s.FolderName).md")
        Save-FileContent -DestinationPath $dest -Content $s.FullContent
    }
}

# 4. GitHub Copilot (.github/copilot-instructions.md)
if ($Tool -in @("copilot", "all")) {
    Write-OutputAction "info" "Targeting GitHub Copilot (.github/copilot-instructions.md)..."
    $doc = Build-AggregatedMarkdown "Repository AI Instructions (GitHub Copilot)" "The following instructions and engineering guidelines apply to all Copilot interactions in this repository."
    $dest = Join-Path $ResolvedTarget (Join-Path ".github" "copilot-instructions.md")
    Save-FileContent -DestinationPath $dest -Content $doc
}

# 5. Gemini CLI / Antigravity (GEMINI.md)
if ($Tool -in @("gemini", "all")) {
    Write-OutputAction "info" "Targeting Gemini CLI & Antigravity (GEMINI.md)..."
    $doc = Build-AggregatedMarkdown "Project Instructions (Gemini / Antigravity)" "Engineering guidelines, constraints, and operational skills for Gemini CLI and Google Antigravity agents."
    $dest = Join-Path $ResolvedTarget "GEMINI.md"
    Save-FileContent -DestinationPath $dest -Content $doc
}

# 6. OpenAI Codex / Zed / General AGENTS.md
if ($Tool -in @("agents", "all")) {
    Write-OutputAction "info" "Targeting General Agents & Codex (AGENTS.md)..."
    $doc = Build-AggregatedMarkdown "Repository Agent Guidelines (AGENTS.md)" "General agent guidelines, coding standards, and operational gates for AI assistants."
    $dest = Join-Path $ResolvedTarget "AGENTS.md"
    Save-FileContent -DestinationPath $dest -Content $doc
}

if ($TempDirToClean -and (Test-Path -LiteralPath $TempDirToClean)) {
    Remove-Item -LiteralPath $TempDirToClean -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "`n[done] Initialization complete.`n" -ForegroundColor Green
