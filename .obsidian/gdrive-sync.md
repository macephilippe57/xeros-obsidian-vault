# Google Drive Sync Configuration

## Vault Location
- **Vault Path:** `/root/obsidian-vault`
- **Google Drive Mount:** `G:/` (mapped network drive)
- **Sync Method:** File system sync via mounted Google Drive

## Setup Instructions

### Option 1: Direct Mount (Recommended)
1. Mount Google Drive to G: drive on your system
2. Configure vault location to point to G:/Obsidian Vault
3. Enable sync in Obsidian settings

### Option 2: Symbolic Link
```bash
# Create symlink from vault to Google Drive
ln -s /mnt/g/Obsidian\ Vault /root/obsidian-vault
```

### Option 3: rclone sync
```bash
# Sync vault to Google Drive
rclone sync /root/obsidian-vault remote:obsidian-vault --progress
```

## Sync Settings
- Auto-sync: Enabled
- Sync interval: 5 minutes
- Conflict resolution: Manual review
- Backup: Keep 7 days history

## Notes
- Ensure Google Drive is mounted before launching Obsidian
- Use `OBSIDIAN_VAULT_PATH` env var to override location
- Monitor sync status in Obsidian's sync panel
