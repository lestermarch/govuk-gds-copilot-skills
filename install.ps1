# Install GOV.UK Design System skills + agent into your local Copilot CLI config.
# Usage: .\install.ps1

$ErrorActionPreference = "Stop"

$skillsDest = Join-Path $HOME ".copilot\skills"
$agentsDest = Join-Path $HOME ".copilot\agents"

New-Item -ItemType Directory -Force -Path $skillsDest, $agentsDest | Out-Null

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Installing GDS skills to $skillsDest" -ForegroundColor Cyan
Copy-Item -Recurse -Force (Join-Path $repoRoot "skills\gds-*") $skillsDest

Write-Host "Installing GDS agent to $agentsDest" -ForegroundColor Cyan
Copy-Item -Force (Join-Path $repoRoot "agents\gds.agent.md") $agentsDest

Write-Host ""
Write-Host "Done. Launch a GDS-flavoured session with:" -ForegroundColor Green
Write-Host '  copilot --agent gds' -ForegroundColor Yellow
