# GBrain Skills Index

Complete list of all GBrain skills integrated with Obsidian.

## Quick Reference

| # | Skill | Description |
|---|-------|-------------|
| 1 | [01_ingest](01_ingest.md) | Route content to specialized ingestion skills |
| 2 | [02_idea_ingest](02_idea_ingest.md) | Ingest links, articles, tweets with analysis |
| 3 | [03_media_ingest](03_media_ingest.md) | Ingest video, audio, PDF, book, screenshot, repo |
| 4 | [04_meeting_ingestion](04_meeting_ingestion.md) | Ingest meeting transcripts with attendee enrichment |
| 5 | [05_signal_detector](05_signal_detector.md) | Always-on ambient signal capture |
| 6 | [06_brain_ops](06_brain_ops.md) | Core read-enrich-write loop |
| 7 | [07_enrich](07_enrich.md) | Tiered enrichment protocol with entity recognition |
| 8 | [08_query](08_query.md) | Hybrid search with pattern recognition |
| 9 | [09_maintain](09_maintain.md) | Brain health: backlink enforcement, citation audit |
| 10 | [10_cron_scheduler](10_cron_scheduler.md) | Schedule management with staggering and quiet hours |
| 11 | [11_minion_orchestrator](11_minion_orchestrator.md) | Manage background agents via Minions job queue |
| 12 | [12_cross_modal_review](12_cross_modal_review.md) | Quality gate via second model with refusal routing |
| 13 | [13_task_manager](13_task_manager.md) | Task lifecycle: add, complete, defer, remove, review |
| 14 | [14_daily_task_prep](14_daily_task_prep.md) | Morning preparation with calendar context |
| 15 | [15_reporting](15_reporting.md) | Save and load timestamped reports |
| 16 | [16_soul_audit](16_soul_audit.md) | 6-phase interactive interview for SOUL documentation |
| 17 | [17_webhook_transforms](17_webhook_transforms.md) | Convert external events to brain-ingestible signals |
| 18 | [18_data_research](18_data_research.md) | Structured data research with YAML recipes |
| 19 | [19_repo_architecture](19_repo_architecture.md) | Filing rules and directory conventions |
| 20 | [20_skill_creator](20_skill_creator.md) | Create new skills following conformance standard |
| 21 | [21_skillify](21_skillify.md) | Turn raw features into properly skilled units |
| 22 | [22_skillpack_check](22_skillpack_check.md) | Agent health report wrapping doctor + migrations |
| 23 | [23_migrations](23_migrations.md) | Versioned migration registry for schema changes |
| 24 | [claw-code-integration](24_claw_code_integration.md) | **🚀 Claw Code Integration** - Connect trading bot with Claw Code's 26+ skills, orchestration, MCP servers |

## Trading Workflow

### Morning Preparation
1. `daily-task-prep` - Review calendar and market conditions
2. `signal-detector` - Check for overnight market signals  
3. `data-research` - Analyze new market data and news

### Active Trading
4. `ingest` - Process real-time market feeds
5. `brain-ops` - Execute trading logic
6. `query` - Search for historical patterns
7. `enrich` - Add context and entity relationships

### Post-Trade & Automation
8. `reporting` - Document results and P&L
9. `maintain` - Ensure data quality and citations
10. `minion-orchestrator` - Schedule next cycle
11. `cross-modal-review` - Quality validation

## Automation
All skills can be triggered via:
- Obsidian commands: `/gbrain skill <name>`
- API calls through GBrain MCP server
- Automated cron jobs
- Claw Code orchestration
- Webhook integrations

## Claw Code Integration
See `claw-code-integration.md` for details on how Claw Code's 26+ skills coordinate with this vault for autonomous trading operations.

## Claw Code Features
- **24_claw_code_integration.md**: Full integration details with 26+ skills
- Orchestrates: Market analysis → Signal detection → Enrichment → Query → Trading → Reporting
- MCP servers: Claude, Cursor, Windsurf compatible
- Auto-linking: Post-hook entity extraction
- Trading-specific agents: market_analyzer, trade_executor, risk_manager
- Configuration: Max order size (50), Stop loss (2%), Take profit (4%)
