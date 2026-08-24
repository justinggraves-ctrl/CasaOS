#!/bin/bash
# Sets up the Trayd MCP server for Claude Code on this CasaOS system.
# Trayd enables natural-language Robinhood trading via Claude AI.
# More info: https://github.com/justinggraves-ctrl/trayd-mcp

set -e

TRAYD_MCP_URL="https://mcp.trayd.ai/mcp"

if ! command -v claude &>/dev/null; then
  echo "Claude Code is not installed. Install it first:"
  echo "  npm install -g @anthropic-ai/claude-code"
  exit 1
fi

echo "Adding Trayd MCP server to Claude Code (user-scoped)..."
claude mcp add --transport http trayd "$TRAYD_MCP_URL" --scope user

echo ""
echo "Trayd MCP server added successfully."
echo ""
echo "Next steps:"
echo "  1. Run 'claude' to open Claude Code"
echo "  2. Type '/mcp' to open the server panel"
echo "  3. Select 'trayd' and click Authorize to complete the OAuth flow"
echo "  4. Say: 'Link my Robinhood account'"
echo "  5. Try: 'Show me my portfolio' or 'Buy 1 share of AAPL'"
