# Trading Operations Index

## Overview
Central index for trading operations, adapters, and skill integrations.

## Sections

### 1. Dashboard
- **File**: `TRADING_OPERATIONS/DASHBOARD.md`
- **Purpose**: Live trading status, quick actions, skill overview
- **Key Commands**:
  - `/gbrain` — All 26+ GBrain skills
  - `/claw` — Claw Code orchestration
  - `/gbrain cycle` — Full autonomous cycle

### 2. Claw Code Integration
- **File**: `GBRAIN_SKILLS/24_claw_code_integration.md`
- **Purpose**: Claw Code's 26+ skills for autonomous trading
- **Agents**:
  - `market_analyzer` — Signal detection, indicators
  - `risk_manager` — Compliance, stop-loss enforcement
  - `trade_executor` — Order placement, execution

### 3. Hermes Paperclip Adapter
- **File**: `PAPERCLIP_ADAPTER/HERMES_ADAPTER.md`
- **Purpose**: Run Hermes as managed Paperclip employee
- **Features**: 30+ tools, MCP, 8 providers, persistent memory

### 4. GBrain Skills
- **Folder**: `GBRAIN_SKILLS/`
- **Count**: 24 documented skills
- **Index**: `GBRAIN_SKILLS/INDEX.md`

## Cross-References

```
DASHBOARD.md
  ├─ /claw → 24_claw_code_integration.md
  └─ /gbrain → GBRAIN_SKILLS/INDEX.md

24_claw_code_integration.md
  └─ links → TRADING_OPERATIONS/DASHBOARD.md

HERMES_ADAPTER.md
  └─ references → GBRAIN_SKILLS/ (shared ecosystem)
```

## File Tree

```
TRADING_OPERATIONS/
├── DASHBOARD.md              # Live trading UI
├── INDEX.md                  # This file
├── Signals/                  # Signal logs
├── Analysis/                 # Analysis reports
├── Backtests/                # Backtest results
├── Reports/                  # Daily reports
└── Scripts/                  # Automation scripts
```

## Quick Actions

| Command | Action | Scope |
|---------|--------|-------|
| `/gbrain` | List all skills | All 26+ skills |
| `/claw` | Claw Code orchestration | 3 agents |
| `/gbrain cycle` | Full autonomous cycle | All skills |
| `/claw config` | View Claw settings | Market + Risk + Executor |
