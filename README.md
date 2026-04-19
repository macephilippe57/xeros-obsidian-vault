# 📁 Obsidian Vault Setup Guide

Welcome to your **Trading & Research Obsidian Vault**!

## 🎯 Purpose
This vault contains:
- **TRADING_OPERATIONS** - Trading signals, analysis, backtests
- **GBRAIN_SKILLS** - Trading bot skills documentation
- **ADAPTER_INTEGRATIONS** - System integrations
- **PAPERCLIP_ADAPTER** - Hermes Paperclip integration
- **CLAW_CODE_ANALALYSIS** - Autonomous agent analysis

## 🔄 Sync Architecture

```
┌─────────────────┐     SSH + Git      ┌─────────────────┐
│  VPS (Heremes)  │ ─────────────────> │    GitHub       │
│  /root/obsidian │   (auto sync)      │    Cloud Repo   │
└─────────────────┘                    └─────────────────┘
                                            │
                                            │ clone
                                            ↓
                              ┌─────────────────────────┐
                              │  Your PC Obsidian       │
                              │  (local editing)        │
                              └─────────────────────────┘
```

## ⚙️ Configuration

### VPS (Already Done ✅)
- ✅ Git repository initialized at `/root/obsidian-vault`
- ✅ Auto-sync cron job every 5 minutes
- ✅ Scripts ready for GitHub push
- 📋 Log file: `/root/logs/obsidian-sync.log`

### GitHub Repo (Next Step)
1. Create new repo: **xeros-obsidian-vault**
2. Keep it **public** or **private** (your choice)
3. **Do NOT** add README during creation
4. URL: `git@github.com:XEROS/xeros-obsidian-vault.git`

### PC Setup (After GitHub)
```bash
# Clone the vault
git clone git@github.com:XEROS/xeros-obsidian-vault.git ~/Obsidian-Vault

# Open in Obsidian
# File → Open Folder → ~/Obsidian-Vault
```

## 🚀 Quick Start

### Option 1: Automated Setup Script
```bash
# On VPS
cd /root/obsidian-vault
./setup-obsidian-git.sh
# Follow prompts
```

### Option 2: Manual Setup
```bash
# On VPS
cd /root/obsidian-vault
git remote add origin git@github.com:XEROS/xeros-obsidian-vault.git
git push -u origin master

# On PC
git clone git@github.com:XEROS/xeros-obsidian-vault.git ~/Obsidian-Vault
```

## 📊 Monitoring

```bash
# Check sync status on VPS
tail -f /root/logs/obsidian-sync.log

# Check vault status
cd /root/obsidian-vault
git status
git log --oneline -10
```

## 🔐 SSH Authentication

```bash
# Generate SSH key (if not exists)
ssh-keygen -t ed25519 -C "xeros@hermes"

# Add to GitHub
cat ~/.ssh/id_ed25519.pub
# → GitHub Settings → SSH and GPG Keys → New SSH Key

# Test connection
ssh -T git@github.com
```

## 💡 Tips

✅ **Automatic backup** - GitHub serves as cloud backup
✅ **Version history** - All changes tracked via Git
✅ **Multi-device access** - Same vault on VPS and PC
✅ **Free solution** - No monthly fees (vs Obsidian Sync $8/mo)

## 📚 Documentation Files

- `GIT_SYNC_SETUP.md` - Complete sync configuration
- `PC_SETUP.md` - PC installation guide
- `setup-obsidian-git.sh` - Quick setup script

## 🎯 Next Steps

1. ✅ **Done**: VPS Git configuration
2. ⏳ **To do**: Create GitHub repo
3. ⏳ **To do**: Push from VPS to GitHub
4. ⏳ **To do**: Clone to PC Obsidian
5. ✅ **Done**: Auto-sync every 5 minutes

---

**Status**: 🟢 VPS Ready | 🟡 GitHub Setup Needed | 🔵 PC Clone Pending

**Last Updated**: 2026-04-19 14:45
