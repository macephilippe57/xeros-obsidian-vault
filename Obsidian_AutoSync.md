# Obsidian Auto-Sync Setup

## 📁 Vault Location
- **Local (VPS):** `/root/obsidian-vault/`
- **Cloud (Google Drive):** Via rclone `obsidian_gdrive`

---

## 📋 Fichiers Créés

| Fichier | Chemin | Description |
|---------|--------|-------------|
| Script de sync | `/root/sync-obsidian-vault.sh` | Script principal de sync |
| Guide config | `/root/OBSIDIAN_SYNC_GUIDE.md` | Documentation complète |
| Guide usage | `/root/USAGE.md` | Instructions d'utilisation |
| Template rclone | `/root/rclone_template.conf` | Exemple de config |

---

## 🔧 Configuration Requise

### 1. Installer rclone
```bash
curl -L https://rclone.org/install.sh | sudo bash
```

### 2. Configurer Google Drive
```bash
rclone config
# - Nom: obsidian_gdrive
# - Type: Google Drive
# - Suivre l'autorisation OAuth
```

### 3. Transférer vers VPS
```bash
scp ~/.config/rclone/rclone.conf root@srv1557856.hstgr.cloud:/root/.config/rclone/rclone.conf
```

---

## 🚀 Utilisation

### Sync manuel
```bash
# Sur VPS
ssh root@srv1557856.hstgr.cloud
/root/sync-obsidian-vault.sh
```

### Auto-sync (configuré)
```bash
# Toutes les heures via cron
0 * * * * /root/sync-obsidian-vault.sh >> /var/log/obsidian-sync.log 2>&1
```

---

## 📝 Notes dans Vault

- `ZSecurity_Profile.md` - Profile de @ZSecurity (scrapé depuis GitHub)
- `OBSIDIAN_SYNC_GUIDE.md` - Guide complet de configuration
- `USAGE.md` - Instructions d'utilisation

---

## ⚙️ Cron Configuration

```bash
# Vérifier le cron
crontab -l

# Output:
# 0 * * * * /root/sync-obsidian-vault.sh >> /var/log/obsidian-sync.log 2>&1
```

---

## 🐛 Dépannage

### Erreur: remote not configured
```bash
rclone listremotes  # devrait montrer: obsidian_gdrive:
```

### Erreur: 401 Unauthorized
```bash
rclone authorize "obsidian_gdrive"
```

### Erreur: disk quota exceeded
```bash
rclone lsf obsidian_gdrive: --size
rclone purge obsidian_gdrive:obsidian-vault --tpa
```

---

## 📊 Status

- [ ] rclone installé sur VPS ✅
- [ ] Script de sync créé ✅
- [ ] Cron job configuré ✅
- [ ] rclone configuré avec Google Drive ⏳
- [ ] First sync completed ⏳
- [ ] Vault visible dans Obsidian local ⏳

---

**Created:** 2026-04-19  
**Last Updated:** 2026-04-19  
**Tags:** [[Obsidian]], [[Google-Drive]], [[Sync]], [[Automation]]
