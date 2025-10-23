#!/usr/bin/env bash
set -euo pipefail

# Log file for debugging post-create issues
LOG_FILE="/tmp/devcontainer-post-create.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "========================================="
echo "Post-create script starting at $(date)"
echo "========================================="

echo ""
echo "🔧  Configuring Git to auto-create upstream on first push..."
git config --global push.autoSetupRemote true
echo "    ✅ Git configured"

echo ""
echo "========================================="
echo "✅  Post-create tasks complete at $(date)"
echo "========================================="
echo ""
echo "📋 Development Environment Ready:"
echo "  • Python: $(python3 --version 2>&1 | cut -d' ' -f2)"
echo "  • uv: $(uv --version 2>&1)"
echo "  • Node.js: $(node --version)"
echo "  • npm: $(npm --version)"
echo "  • pnpm: $(pnpm --version)"
echo "  • Git: $(git --version | cut -d' ' -f3)"
echo "  • Make: $(make --version 2>&1 | head -n 1 | cut -d' ' -f3)"
echo "  • Claude CLI: $(claude --version 2>&1 || echo 'NOT INSTALLED')"
echo ""
echo "💡 Logs saved to: $LOG_FILE"
echo ""
