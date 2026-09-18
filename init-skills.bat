@echo off
setlocal enabledelayedexpansion

set "SRC=%~dp0templates"
set "SCRIPT_DIR=%~dp0"

if not exist "%SRC%" (
  echo [error] Templates folder not found: %SRC%
  echo Keep init-skills.bat next to its templates\ folder.
  exit /b 1
)

REM With no arguments, install Claude Code skills into the current directory.
REM Any arguments (target dir and/or flags) are translated and passed to init-skills.ps1.
if not "%~1"=="" goto run_ps

:run_batch_default
set "TARGET=%CD%"

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
REM Translate GNU-style flags into init-skills.ps1 parameters.
REM Note: cmd splits arguments on commas and "=", so --tool=all works but a
REM comma-separated category list must be quoted or given as repeated flags.
set "PS_ARGS="
set "CATS="

:parse_args
if "%~1"=="" goto invoke_ps
if "%~1"=="/?" goto show_help
if /i "%~1"=="-h" goto show_help
if /i "%~1"=="--help" goto show_help
if /i "%~1"=="-l" (set "PS_ARGS=!PS_ARGS! -List" & shift & goto parse_args)
if /i "%~1"=="--list" (set "PS_ARGS=!PS_ARGS! -List" & shift & goto parse_args)
if /i "%~1"=="-f" (set "PS_ARGS=!PS_ARGS! -Force" & shift & goto parse_args)
if /i "%~1"=="--force" (set "PS_ARGS=!PS_ARGS! -Force" & shift & goto parse_args)
if /i "%~1"=="-n" (set "PS_ARGS=!PS_ARGS! -DryRun" & shift & goto parse_args)
if /i "%~1"=="--dry-run" (set "PS_ARGS=!PS_ARGS! -DryRun" & shift & goto parse_args)
if /i "%~1"=="-t" goto arg_tool
if /i "%~1"=="--tool" goto arg_tool
if /i "%~1"=="-c" goto arg_category
if /i "%~1"=="--category" goto arg_category
set "ARG=%~1"
if "!ARG:~0,1!"=="-" (
  echo [error] Unknown option: %~1
  goto show_help_error
)
set "PS_ARGS=!PS_ARGS! -Target "%~f1""
shift
goto parse_args

:arg_tool
if "%~2"=="" (
  echo [error] %~1 requires a value
  exit /b 1
)
set "PS_ARGS=!PS_ARGS! -Tool "%~2""
shift
shift
goto parse_args

:arg_category
if "%~2"=="" (
  echo [error] %~1 requires a value
  exit /b 1
)
if defined CATS (set "CATS=!CATS!,%~2") else (set "CATS=%~2")
shift
shift
goto parse_args

:invoke_ps
if defined CATS set "PS_ARGS=!PS_ARGS! -Category "!CATS!""
where powershell >nul 2>&1
if %errorlevel% neq 0 (
  echo [error] PowerShell is required when passing arguments to init-skills.bat.
  exit /b 1
)
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%init-skills.ps1" !PS_ARGS!
exit /b %errorlevel%

:show_help
call :print_help
exit /b 0

:show_help_error
call :print_help
exit /b 1

:print_help
echo Usage: init-skills.bat [TARGET_DIR] [OPTIONS]
echo.
echo Options:
echo   --tool, -t [claude^|cursor^|windsurf^|copilot^|gemini^|agents^|all]
echo   --category, -c LIST  Only install these categories (quote comma lists,
echo                        e.g. -c "ai-llm-engineering,agent-workflow")
echo   --force, -f      Overwrite existing files
echo   --dry-run, -n    Preview actions without writing
echo   --list, -l       List all available skills, grouped by category
echo   --help, -h       Display this help message
echo.
exit /b 0
