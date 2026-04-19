# Hermes Paperclip Adapter — Integration Guide

## Overview
This adapter runs **Hermes Agent** as a managed employee inside **Paperclip**.
It exposes Hermes' 30+ skills, persistent memory, and MCP support through Paperclip's UI.

## Quick Links
- **Adapter Source**: `/tmp/hermes-paperclip-adapter/`
- **Skills Vault**: `/root/obsidian-vault/GBRAIN_SKILLS/`
- **Trading Dashboard**: `/root/obsidian-vault/TRADING_OPERATIONS/DASHBOARD.md`
- **Index**: `/root/obsidian-vault/ADAPTER_INTEGRATIONS/INDEX.md`

## Capabilities

### Provider Support
```
1. Anthropic       (claude-*)
2. OpenRouter      (200+ models)
3. OpenAI          (gpt-*)  
4. Nous            (nous-*)
5. OpenAI Codex    (o3-mini-*)
6. ZAI             (glm-*)  
7. Kimi Coding     (moonshot-*)
8. MiniMax         (all models)
```

### Hermes Features Enabled
- 30+ native tools (terminal, file, web, browser, vision, git)
- Persistent memory across sessions
- 80+ loadable skills
- FTS5 session search
- Sub-agent delegation
- Context compression
- MCP client (any MCP server)
- Multi-provider switching

## Installation Steps

### Step 1: Install Adapter
```bash
cd /root/obsidian-vault
npm install hermes-paperclip-adapter
```

### Step 2: Register in Paperclip
```typescript
// Paperclip repo: server/src/adapters/registry.ts
import * as hermesLocal from "hermes-paperclip-adapter";
import {
  execute,
  testEnvironment,
  detectModel,
  listSkills,
  syncSkills,
  sessionCodec,
} from "hermes-paperclip-adapter/server";

registry.set("hermes_local", {
  ...hermesLocal,
  execute,
  testEnvironment,
  detectModel,
  listSkills,
  syncSkills,
  sessionCodec,
});
```

### Step 3: Create Agent
```json
{
  "name": "Hermes Employee",
  "adapterType": "hermes_local",
  "adapterConfig": {
    "model": "anthropic/claude-sonnet-4",
    "provider": "anthropic",
    "apiKey": "<your-anthropic-key>",
    "hermesArgs": ["--quiet", "--reasoning-effort", "high"]
  }
}
```

## Hermes CLI Flags

| Flag | Description |
|------|-------------|
| `-q` | Single query (non-interactive) |
| `-Q` | Quiet mode (no banner) |
| `-m` | Model selection |
| `-t` | Toolsets |
| `--provider` | Inference provider |
| `-r` | Resume session |
| `--checkpoints` | Filesystem rollback |
| `--yolo` | Bypass approval (agents) |
| `--source` | Session tagging |

## Integration Flow

```
Paperclip UI
    ↓
adapter: hermes_local
    ↓
spawn: hermes chat -q "..."
    ↓
parse: TranscriptEntry[]
    ↓
render: Markdown tool cards
```

## Configuration

### Environment Variables
```bash
# Hermes home (~/.hermes)
HERMES_HOME=/home/user/.hermes

# Paperclip API
PAPERCLIP_API_URL=https://api.paperclip.dev
PAPERCLIP_API_KEY=...

# Model provider
PROVIDER=openrouter
OPENROUTER_API_KEY=...
```

### Model Detection
Adapter reads `~/.hermes/config.yaml`:
```yaml
model: anthropic/claude-sonnet-4
provider: anthropic
```

## Troubleshooting

### Hermes CLI not found
```bash
which hermes || pip install hermes-agent
```

### Skills not loading
```bash
# Ensure skills directory exists
mkdir -p ~/.hermes/skills
# Restart Paperclip server
```

### API key errors
```bash
# Verify provider config
hermes model  # Should show selected model
```

## Related Vault Files
- `GBRAIN_SKILLS/` — 20+ skill documents
- `TRADING_OPERATIONS/DASHBOARD.md` — Trading with `/claw`
- `24_claw_code_integration.md` — Claw Code docs
- `ADAPTER_INTEGRATIONS/INDEX.md` — Master index
