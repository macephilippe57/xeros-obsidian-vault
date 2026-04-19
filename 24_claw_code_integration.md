# Claw Code Integration

## Overview
**🚀 UltraWorkers Claw Code** - Integration with the autonomous agent framework for coordinated trading operations. Claw Code provides 26+ skills, orchestration capabilities, and MCP server infrastructure to power autonomous trading workflows.

## Trading Applications
- Connect trading bot with Claw Code's 26 skills for autonomous operation
- Orchestrate multi-agent workflows (market analysis, signal detection, execution, risk management)
- Leverage Claw Code's MCP servers for Claude, Cursor, Windsurf compatibility
- Enable auto-linking and entity extraction across trading documentation

## Obsidian Integration
- **File**: `GBRAIN_SKILLS/24_claw_code_integration.md`
- **Status**: ✅ Active
- **Last Updated**: 2026-04-19

## Key Features

### 1. Multi-Agent Orchestration
- **Market Analyzer Agent**: Signal detection, indicator analysis, pattern recognition
- **Trade Executor Agent**: Order placement, position management, execution tracking  
- **Risk Manager Agent**: Compliance checks, stop-loss enforcement, portfolio limits

### 2. Skills Integration
Claw Code's 26+ skills map to trading operations:
- `signal-detector` - Real-time market signal capture
- `enrich` - Add entity context and risk tags  
- `query` - Pattern recognition and historical analogies
- `brain-ops` - Core trading logic execution
- `reporting` - P&L and performance documentation
- `cross-modal-review` - Quality validation
- `minion-orchestrator` - Background task management
- `soul-audit` - Trading psychology documentation

### 3. MCP Server Support
- Claude, Cursor, Windsurf compatible
- Auto-linking between agent notes
- Post-hook entity extraction
- Real-time collaboration

## Implementation Notes
- **Configuration**: Max order size 50 units, Stop loss 2%, Take profit 4%
- **Trading Hours**: Europe/Paris 08:00-17:00 (Mon-Fri)
- **Symbols**: XAU, SPY, VOO, QQQ, GLD, IAU, TLT, AGG
- **Strategy**: Contrarian based on Fear & Greed Index + VIX/DXY/ECB
- **Mode**: Mock Mode (default) → Ready for Real Mode with API keys

## Quick Actions

| Command | Action | Description |
|---------|--------|-------------|
| `/claw config` | View Claw Code settings | Show current agent configuration |
| `/claw agents` | List active agents | Market analyzer, risk manager, executor |
| `/claw cycle` | Run trading cycle | Execute full autonomous workflow |
| `/claw analyze` | Analyze signals | Process market data through all agents |
| `/claw export` | Export results | Save to Obsidian vault |
| `/gbrain skill claw-code-integration` | View details | Open this documentation |

## File Structure

```
claw_code/
├── agents/
│   ├── market_analyzer/
│   ├── trade_executor/
│   └── risk_manager/
├── mcp_servers/
│   ├── claude_mcp.json
│   ├── cursor_mcp.json
│   └── windsurf_mcp.json
├── config/
│   └── trading_config.yaml
└── state/
    └── active_agents.json
```

## Integration with GBrain

Claw Code and GBrain work together:
1. **GBrain** provides the knowledge base and skill framework (26+ skills)
2. **Claw Code** provides orchestration and autonomous agent coordination
3. **Shared Skills**: signal detection, enrichment, querying, reporting
4. **Data Flow**: Market data → GBrain enrich → Claw Code analyze → Execute → Report

## Getting Started

### Configuration
```bash
# Set environment variables
export CLAW_CODE_PATH=/tmp/claw-code
export OBSIDIAN_VAULT=/root/obsidian-vault
export TRADING_BOT_PATH=/root/trading-bot
```

### Running the Integration
```python
from claw_integration import ClawCodeIntegration
import asyncio

async def main():
    integration = ClawCodeIntegration()
    results = await integration.run_trading_cycle(market_data)
    integration.export_to_obsidian(results)

asyncio.run(main())
```

## Monitoring
- **Dashboard**: `TRADING_OPERATIONS/DASHBOARD.md`
- **Analysis Export**: `CLAW_CODE_ANALYSIS/`
- **Signal Logs**: `TRADING_OPERATIONS/Signals/`
- **Performance Reports**: `TRADING_OPERATIONS/Reports/`

## Troubleshooting

### Mock Mode Issues
- Default mode simulates trades without execution
- Set `API_KEYS` in `.env` for Real Mode
- Check `rust/PARITY.md` for Rust compilation status

### Claw Code Not Found
- Verify `CLAW_CODE_PATH` points to `/tmp/claw-code`
- Check `claw-code` is cloned at specified path
- Ensure Rust toolchain is available for CLI execution

## Related Files
- `claw_integration.py` - Python integration wrapper
- `auto_trading_agent.py` - Main autonomous agent
- `gbrain_integration.py` - GBrain skills interface
- `obsidian_gbrain_integration.py` - Vault synchronizer

## Status
- ✅ Claw Code cloned at `/tmp/claw-code`
- ✅ Python wrapper created
- ✅ 24 skill files documented
- ✅ Dashboard updated
- ⚠ Rust compilation blocked (lock file version mismatch)
- 🔁 Ready for Real Mode with API configuration
