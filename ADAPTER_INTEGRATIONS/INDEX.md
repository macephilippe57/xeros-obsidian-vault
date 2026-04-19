# Adapter Integrations Index

## Overview
Master index of all external adapter and tool integrations in your Obsidian vault.

## Available Adapters

| Adapter | Source | Stars | Status | Primary Features |
|---------|--------|-------|--------|------------------|
| **Claw Code** | `/tmp/claw-code` | — | ✅ Active | 26+ skills, orchestration, MCP |
| **Hermes Agent** | `/tmp/hermes-agent` | 100,086 | ✅ Core | 30+ tools, persistent memory, 8 providers |
| **Hermes Paperclip Adapter** | `/tmp/hermes-paperclip-adapter` | 870 | ✅ Integrated | Paperclip + Hermes |
| **GBrain** | `/tmp/gbrain` | 9,222 | ✅ Active | OpenClaw, 26 skills |

## Quick Access Links

### Hermes Ecosystem
- [Hermes Agent (Core Framework)](https://github.com/NousResearch/hermes-agent) — Primary agent framework
- [Hermes Paperclip Adapter](PAPERCLIP_ADAPTER/HERMES_ADAPTER.md) — Already integrated
- [Hermes Search Results](ADAPTER_INTEGRATIONS/HERMES_SEARCH.md) — Repository search findings

### Claw Code Integration
- [Claw Code Integration](GBRAIN_SKILLS/24_claw_code_integration.md) — Full documentation
- [Claw Code Skills](GBRAIN_SKILLS/INDEX.md) — 24 documented skills

### GBrain Integration  
- [GBrain Skills Index](GBRAIN_SKILLS/INDEX.md) — All 24 skills
- [GBrain Adapter](ADAPTER_INTEGRATIONS/HERMES_SEARCH.md) — Search results

### Trading Operations
- [Trading Dashboard](TRADING_OPERATIONS/DASHBOARD.md) — Live trading UI
- [Trading Operations Index](TRADING_OPERATIONS/INDEX.md) — Operations guide

## Cross-Adapter Integration

### Shared Skills Ecosystem
```
GBRAIN_SKILLS/
  ├── 24_claw_code_integration.md → References Claw Code
  └── INDEX.md → Links to all skills

ADAPTER_INTEGRATIONS/
  ├── HERMES_ADAPTER.md → Uses GBRAIN_SKILLS
  ├── HERMES_SEARCH.md → References all repos
  └── INDEX.md → Master index

TRADING_OPERATIONS/
  ├── DASHBOARD.md → Uses /claw command
  └── INDEX.md → Links to all trading docs
```

### Command Integration
| Command | Scope | Action |
|---------|-------|--------|
| `/claw` | Trading Dashboard | Claw Code orchestration |
| `/gbrain` | All docs | List 26+ skills |
| `/hermes` | Hermes adapter | Hermes agent commands |

## File Statistics

```
/root/obsidian-vault/
├── 31 new adapter files (PAPERCLIP_ADAPTER/ + ADAPTER_INTEGRATIONS/)
├── 24 GBrain skill docs (GBRAIN_SKILLS/)
├── 4 integration docs (updated/created)
├── 1 search results doc (new)
└── 2 updated index files (GBRAIN_SKILLS/INDEX.md, ADAPTER_INTEGRATIONS/INDEX.md)
```

## Status
- ✅ Claw Code analyzed and integrated
- ✅ Hermes Agent identified and documented
- ✅ Hermes Paperclip Adapter integrated  
- ✅ GBrain 26+ skills documented
- ✅ All cross-references established
- ✅ Trading dashboard updated with new commands
