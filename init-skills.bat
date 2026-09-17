@echo off
setlocal enabledelayedexpansion

set "SRC=%~dp0templates"
set "SCRIPT_DIR=%~dp0"

if not exist "%SRC%" (
  echo [error] Templates folder not found: %SRC%
  echo Keep init-skills.bat next to its templates\ folder.
  exit /b 1
)

REM If advanced flags or arguments are passed, delegate to init-skills.ps1 for rich feature support
if not "%~1"=="" (
  if "%~1"=="/?" goto show_help
  if "%~1"=="-h" goto show_help
  if "%~1"=="--help" goto show_help
  if "%~1"=="-l" goto run_ps
  if "%~1"=="--list" goto run_ps
  if "%~1"=="-t" goto run_ps
  if "%~1"=="--tool" goto run_ps
  if "%~1"=="-n" goto run_ps
  if "%~1"=="--dry-run" goto run_ps
  if "%~1"=="-f" goto run_ps
  if "%~1"=="--force" goto run_ps
)

:run_batch_default
REM Determine target directory (first arg if it's a directory, else current working directory)
set "TARGET=%CD%"
if not "%~1"=="" (
  if exist "%~1\" (
    set "TARGET=%~f1"
  )
)

echo.
echo ========================================================
echo  Initializing Claude Code Skills in: %TARGET%
echo ========================================================
echo.

if not exist "%TARGET%\.claude" mkdir "%TARGET%\.claude"
if not exist "%TARGET%\.claude\skills" mkdir "%TARGET%\.claude\skills"

REM ---------------------------------------------------------------
REM Root index / reference files
REM ---------------------------------------------------------------
for %%F in (SKILLS.md AI-TOOL-LOCATIONS.md) do (
  if exist "%TARGET%\%%F" (
    echo   [skip] %%F already exists
  ) else (
    copy /Y "%SRC%\%%F" "%TARGET%\%%F" >nul
    echo   [ok]   %%F
  )
)

REM ---------------------------------------------------------------
REM Dynamically discover all skills under templates\skills\*
REM ---------------------------------------------------------------
for /d %%D in ("%SRC%\skills\*") do (
  set "SKILL_NAME=%%~nxD"
  if not exist "%TARGET%\.claude\skills\!SKILL_NAME!" mkdir "%TARGET%\.claude\skills\!SKILL_NAME!"
  if exist "%TARGET%\.claude\skills\!SKILL_NAME!\SKILL.md" (
    echo   [skip] !SKILL_NAME!
  ) else (
    copy /Y "%%D\SKILL.md" "%TARGET%\.claude\skills\!SKILL_NAME!\SKILL.md" >nul
    echo   [ok]   !SKILL_NAME!
  )
)

echo.
echo [done] Skills initialized under %TARGET%\.claude\skills\
echo For other AI assistants (Cursor, Windsurf, Copilot, Gemini), run:
echo   powershell -File "%SCRIPT_DIR%init-skills.ps1" -Tool all
echo.
exit /b 0

:run_ps
where powershell >nul 2>&1
if %errorlevel% equ 0 (
  powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%init-skills.ps1" %*
  exit /b %errorlevel%
) else (
  echo [error] PowerShell is required to process advanced flags like %1.
  exit /b 1
)

:show_help
echo Usage: init-skills.bat [TARGET_DIR] [OPTIONS]
echo.
echo Options:
echo   --tool, -t [claude^|cursor^|windsurf^|copilot^|gemini^|agents^|all]
echo   --force, -f      Overwrite existing files
echo   --dry-run, -n    Preview actions without writing
echo   --list, -l       List all available skills
echo   --help, -h       Display this help message
echo.
exit /b 0
