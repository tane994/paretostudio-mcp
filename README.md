# paretostudio-mcp

> Read your ParetoStudio prompt, agent, and skill library from Claude Code, Cursor, and any MCP client. Install agents and skills as files into Claude Code.

## Quick Start

### 1. Get your API key

Go to [paretostudio.io/settings](https://paretostudio.io/settings) and navigate to Developer, then create an API Key.

### 2. Configure your client

**Claude Code** (`.mcp.json` in your project root):

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

**Cursor** (Settings > MCP):

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

**Claude Desktop** (`claude_desktop_config.json`):

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

**Codex** (`~/.codex/config.toml`):

```toml
[mcp_servers.paretostudio]
command = "npx"
args = ["-y", "paretostudio-mcp@latest"]

[mcp_servers.paretostudio.env]
PARETOSTUDIO_API_KEY = "psk_your_key_here"
```

### 3. Use it

Ask Codex, Claude, or your MCP client to "list my prompts" or "install my agent" — the tools are available automatically.

## Available Tools

| Tool | Description |
|------|-------------|
| `list_prompts` | List all prompts in your library |
| `get_prompt` | Get full prompt content (all 6 steps) |
| `search_prompts` | Search prompts by title or description |
| `list_agents` | List all agents |
| `get_agent` | Get agent with full configuration |
| `search_agents` | Search agents |
| `list_skills` | List all skills |
| `get_skill` | Get skill with full configuration |
| `search_skills` | Search skills |
| `install_skill` | Install skill for Claude or Codex project layouts |
| `install_agent` | Download agent to `.claude/agents/` |
| `install_bundle` | Install agent + skills in one operation |
| `create_prompt` | Create a new prompt |
| `update_prompt` | Update a prompt |
| `delete_prompt` | Delete a prompt |
| `create_skill` | Create a new skill |
| `update_skill` | Update a skill |
| `delete_skill` | Delete a skill |
| `create_agent` | Create a new agent |
| `update_agent` | Update an agent |
| `delete_agent` | Delete an agent |

Install tools never overwrite existing files by default. Pass `overwrite: true`
only when you intentionally want to replace an installed agent or skill.
For Codex project skills, call `install_skill` with `client: "codex"`; the skill
is written to `.agents/skills/<name>/SKILL.md` instead of `.claude/skills/`.

Write tools respect your plan's library caps (Free: 5 prompts / 2 agents / 2 skills; Pro and Team: unlimited).

## Rate Limits

| Plan | Daily Requests | Write Access |
|------|---------------|--------------|
| Free | 50 | Yes — within plan caps (5 prompts / 2 agents / 2 skills) |
| Pro | 500 | Yes — unlimited |
| Team | 500 | Yes — unlimited, shared team library |

## Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `PARETOSTUDIO_API_KEY` | Yes | -- | Your API key (starts with `psk_`) |
| `PARETOSTUDIO_API_URL` | No | `https://paretostudio.io` | API base URL |

## Source

The server source lives in the ParetoStudio application repository, because it
imports the same business rules the API enforces (`src/rules/`) — duplicating them
here would let the two drift apart. This repository is the public home of the
published package: the manifest registries read, the configuration examples, and
the documentation.

Releases are automatic: a version bump reaching `main` publishes to npm, and a CI
gate refuses a build whose server changed since the last bump.

## Links

- [Documentation](https://paretostudio.io/docs/mcp-server)
- [Get API Key](https://paretostudio.io/settings)
- [ParetoStudio](https://paretostudio.io)

## License

MIT — see [LICENSE](LICENSE).
