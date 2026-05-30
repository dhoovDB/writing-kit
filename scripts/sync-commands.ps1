# Syncs the live slash commands from this repo to ~/.claude/commands/.
#
# Why this script exists: the source of truth for /globalrules, /dailytask,
# and /codereview lives in writing-kit/prompts/. The active versions Claude
# Code actually loads live at ~/.claude/commands/. Without a sync step, the
# tracked source drifts out of sync with what actually runs in sessions.
# Last drift incident: VOICE.md rename, 2026-05-30.
#
# Run after editing any of the listed commands below. Idempotent — only
# copies when source and destination differ.
#
# Promoting a new prompt to a live slash command: add an entry to $commands,
# add a row to the workflow table in C:\Projects\CLAUDE.md (or the writing-kit
# README), then run this script.

$ErrorActionPreference = "Stop"

# Resolve paths from the script's own location so cwd doesn't matter.
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceDir = (Resolve-Path (Join-Path $scriptDir "..\prompts")).Path
$destDir   = Join-Path $HOME ".claude\commands"

# Filenames are identical at both ends (intentional — see writing-kit ROADMAP
# decision log 2026-05-30 for the daily-task.md → dailytask.md rename that
# established parity).
$commands = @(
    "globalrules.md",
    "dailytask.md",
    "codereview.md"
)

if (-not (Test-Path $destDir)) {
    Write-Error "Destination $destDir does not exist. Install Claude Code first, or create the directory and re-run."
    exit 1
}

$copied = 0
$skipped = 0
foreach ($name in $commands) {
    $src  = Join-Path $sourceDir $name
    $dest = Join-Path $destDir   $name

    if (-not (Test-Path $src)) {
        Write-Warning "Missing source: $src — skipping."
        continue
    }

    # Skip when destination already matches source byte-for-byte. Avoids
    # spurious mtime updates so the script is safe to run on a schedule.
    if (Test-Path $dest) {
        $srcHash  = (Get-FileHash $src  -Algorithm SHA256).Hash
        $destHash = (Get-FileHash $dest -Algorithm SHA256).Hash
        if ($srcHash -eq $destHash) {
            Write-Host "= $name (already up-to-date)"
            $skipped++
            continue
        }
    }

    Copy-Item -Path $src -Destination $dest -Force
    Write-Host "-> $name (copied)"
    $copied++
}

Write-Host ""
Write-Host "Sync complete: $copied copied, $skipped already up-to-date."
