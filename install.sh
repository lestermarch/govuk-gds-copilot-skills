#!/usr/bin/env bash
# Install GOV.UK Design System skills + agent into your local Copilot CLI config.
# Usage: ./install.sh

set -euo pipefail

SKILLS_DEST="$HOME/.copilot/skills"
AGENTS_DEST="$HOME/.copilot/agents"

mkdir -p "$SKILLS_DEST" "$AGENTS_DEST"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing GDS skills to $SKILLS_DEST"
cp -R "$REPO_ROOT"/skills/gds-* "$SKILLS_DEST"/

echo "Installing GDS agent to $AGENTS_DEST"
cp "$REPO_ROOT"/agents/gds.agent.md "$AGENTS_DEST"/

echo
echo "Done. Launch a GDS-flavoured session with:"
echo '  copilot --agent "GOV.UK Design System Expert"'
