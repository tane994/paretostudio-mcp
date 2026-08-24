# Installing paretostudio-mcp (guide for AI agents)

This file is for AI agents (Cline, Claude Code, etc.) setting up the
ParetoStudio MCP server for a user.

## Prerequisites

1. **Node.js >= 18** available as `node`/`npx`.
2. **A ParetoStudio API key.** The USER must create it themselves (it is shown
   only once): ask them to open <https://paretostudio.io/settings>, go to
   **Developer**, click **Create Key**, and paste the key (starts with `psk_`)
   back to you. Never invent or reuse a key.

## Install

No download step is needed — the package runs via `npx`.

Add this to the client's MCP configuration, replacing `psk_your_key_here` with
the user's key:

```json
{
  "mcpServers": {
    "paretostudio": {
      "command": "npx",
      "args": ["-y", "paretostudio-mcp@latest"],
      "env": {
        "PARETOSTUDIO_API_KEY": "psk_your_key_here"
      }
    }
  }
}
```

Config file locations:

- **Cline**: MCP settings via the MCP Servers panel (`cline_mcp_settings.json`)
- **Claude Code**: `.mcp.json` in the project root
- **Claude Desktop**: `claude_desktop_config.json`
- **Cursor**: Settings → MCP
- **Codex** (`~/.codex/config.toml`):

  ```toml
  [mcp_servers.paretostudio]
  command = "npx"
  args = ["-y", "paretostudio-mcp@latest"]

  [mcp_servers.paretostudio.env]
  PARETOSTUDIO_API_KEY = "psk_your_key_here"
  ```

Restart the client after editing the config.

## Verify

Call the `list_prompts` tool (or ask the model to "list my ParetoStudio
prompts"). A valid setup returns the user's library (possibly empty). Common
errors:

- `PARETOSTUDIO_API_KEY environment variable is required` → the env var is
  missing from the config.
- Authentication error → the key is wrong or revoked; ask the user to create a
  new one.
- Rate limit error → the plan's daily request cap was hit (Free: 50/day).

## Notes

- `install_skill` / `install_agent` / `install_bundle` write files into the
  current project (`.claude/skills/`, `.claude/agents/`, or `.agents/skills/`
  for Codex). They never overwrite existing files unless `overwrite: true` is
  passed explicitly.
- Full documentation: <https://paretostudio.io/docs/mcp-server>
