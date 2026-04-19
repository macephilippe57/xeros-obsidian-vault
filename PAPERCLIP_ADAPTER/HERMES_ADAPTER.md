# Paperclip + Hermes Agent Integration

## Overview
**Paperclip Adapter for Hermes Agent** — Run Hermes Agent as a managed employee in a Paperclip company.

**Documentation Source**: `/tmp/hermes-paperclip-adapter/`

## Key Features

| Feature | Description |
|---------|-------------|
| **8 Inference Providers** | Anthropic, OpenRouter, OpenAI, Nous, OpenAI Codex, ZAI, Kimi Coding, MiniMax |
| **Skills Integration** | Scans Paperclip-managed + `~/.hermes/skills/` (30+ skills) |
| **Structured Transcripts** | Parsed `TranscriptEntry` objects → tool cards with status icons |
| **Rich Post-processing** | Converts ASCII banners, headings, `+--+` borders → clean GFM |
| **Comment-driven Wakeups** | Agents respond to issue comments, not just task assignments |
| **Auto Model Detection** | Reads `~/.hermes/config.yaml` → pre-populates UI |
| **Session Codec** | Structured validation & migration of session state |
| **Benign Stderr** | MCP init messages → reclassified (no UI errors) |
| **Session Tagging** → `tool` source (won't clutter interactive history) |
| **Filesystem Checkpoints** | Optional `--checkpoints` for rollback safety |
| **Thinking Effort Control** | `--reasoning-effort` for thinking/reasoning models |

## Hermes Agent Capabilities

| Capability | Claude Code | Codex | **Hermes Agent** |
|------------|-------------|-------|-----------------|
| Persistent Memory | ❌ | ❌ | ✅ Remembers across sessions |
| Native Tools | ~5 | ~5 | ✅ 30+ (terminal, file, web, browser, vision, git) |
| Skills System | ❌ | ❌ | ✅ 80+ loadable skills |
| Session Search | ❌ | ❌ | ✅ FTS5 search over past convos |
| Sub-agent Delegation | ❌ | ❌ | ✅ Parallel sub-tasks |
| Context Compression | ❌ | ❌ | ✅ Auto-compresses long convos |
| MCP Client | ❌ | ❌ | ✅ Connect to any MCP server |
| Multi-provider | Anthropic only | OpenAI only | ✅ 8 providers out-of-box |

## Quick Start

### Prerequisites
```bash
# Hermes Agent
pip install hermes-agent

# Paperclip adapter
npm install hermes-paperclip-adapter
```

### 1. Register Adapter in Paperclip
```typescript
// server/src/adapters/registry.ts
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

### 2. Create Hermes Agent in Paperclip
```json
{
  "name": "Hermes Employee",
  "adapterType": "hermes_local",
  "adapterConfig": {
    "model": "anthropic/claude-sonnet-4",
    "provider": "anthropic",
    "apiKey": "<your-key>",
    "hermesArgs": ["--quiet", "--reasoning-effort", "high"]
  }
}
```

## Architecture

```
src/
├── index.ts              # Root: type, label, models, agentConfigurationDoc
├── shared/constants.ts   # Shared constants (regex, defaults)
├── server/
│   ├── index.ts          # Re-exports execute + testEnvironment
│   ├── execute.ts        # Core: spawns `hermes chat -q "..."`
│   └── test.ts           # Environment checks (CLI, Python, API keys)
├── ui/
│   ├── index.ts          # Re-exports
│   ├── parse-stdout.ts   # Hermes stdout → TranscriptEntry[]
│   └── build-config.ts   # UI form → adapterConfig
└── cli/
    ├── index.ts          # Re-exports
    └── format-event.ts   # Terminal output formatting
```

## Build & Test

```bash
npm install
npm run build        # tsc → dist/
npm run typecheck    # type checking only
```

### Testing against Local Paperclip
1. Build adapter: `npm run build`
2. Add as local dependency in Paperclip repo
3. Register in `server/src/adapters/registry.ts`
4. Create agent with `adapterType: "hermes_local"`
5. Trigger heartbeat → observe logs

## Hermes CLI Flags Reference
- `-q/--query`       single query (non-interactive)
- `-Q/--quiet`       quiet mode (no banner/spinner)
- `-m/--model`       model name (e.g. `anthropic/claude-sonnet-4`)
- `-t/--toolsets`    comma-separated toolsets
- `--provider`       inference provider
- `-r/--resume`      resume session by ID
- `--checkpoints`    filesystem checkpoints
- `--yolo`           bypass dangerous-command approval
- `--source`         session source tag

## Integration with Existing Vault

- **Skills**: All 30+ existing skills remain functional
- **PAPERCLIP_DIR**: `/root/obsidian-vault/PAPERCLIP_ADAPTER/`
- **INDEX**: See `ADAPTER_INTEGRATIONS/INDEX.md` for index

## Related Files in Vault
- `ADAPTER_INTEGRATIONS/INDEX.md` — Master index of all adapters
- `TRADING_OPERATIONS/DASHBOARD.md` — Trading dashboard with `/claw` command
- `GBRAIN_SKILLS/24_claw_code_integration.md` — Claw Code documentation
