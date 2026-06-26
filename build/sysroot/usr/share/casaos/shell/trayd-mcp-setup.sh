#!/bin/bash
# Sets up the Trayd MCP server for Claude Code on this CasaOS system.
# Trayd enables natural-language Robinhood trading via Claude AI.
# More info: https://github.com/trayders/trayd-mcp

set -e

TRAYD_MCP_URL="https://mcp.trayd.ai/mcp"
ROBINHOOD_MCP_URL="https://agent.robinhood.com/mcp/trading"

if ! command -v claude &>/dev/null; then
  echo "Claude Code is not installed. Install it first:"
  echo "  npm install -g @anthropic-ai/claude-code"
  exit 1
fi

echo "Adding Trayd MCP server to Claude Code..."
claude mcp add --transport http trayd "$TRAYD_MCP_URL" --scope user

echo "Adding Robinhood trading MCP server to Claude Code..."
claude mcp add --transport http robinhood-trading "$ROBINHOOD_MCP_URL" --scope user

echo ""
echo "MCP servers added successfully."
echo ""
echo "Next steps:"
echo "  1. Run 'claude' to open Claude Code"
echo "  2. Run '/mcp' inside Claude Code and follow the browser OAuth flow for each server"
echo "  3. Try: 'Show me my portfolio' or 'Buy 1 share of AAPL'"
