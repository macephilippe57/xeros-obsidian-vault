# 🔗 Liaison Obsidian Git - Workflow de Synchronisation

## ✅ Configuration Complète

### 📁 Structure
- **Vault Local (VPS)**: `/root/obsidian-vault`
- **Repository GitHub**: `github.com/xeros-obsidian` (à créer)
- **Sync Automatique**: Toutes les 5 minutes via cron
- **Logs**: `/root/logs/obsidian-sync.log`

### 🔄 Workflow de Synchronisation

```
┌─────────────┐     git pull/push      ┌─────────────┐
│  PC Obsidian│ ─────────────────────> │  VPS Vault  │
│   (Local)   │ <───────────────────── │  (GitHub)   │
└─────────────┘                        └─────────────┘
       ↑                                     ↑
       │                                     │
       └─────────────────────────────────────┘
                     Cloud GitHub
```

### 📋 Étapes de Setup

#### 1️⃣ Créer le Repository GitHub
1. Va sur github.com
2. Clique sur "New repository"
3. Nom: `xeros-obsidian-vault`
4. Public/Private: selon ton choix
5. NE PAS initialiser avec README

#### 2️⃣ Configurer le Remote sur le VPS
```bash
# Remplace TON_USER par ton GitHub username
git remote add origin git@github.com:TON_USER/xeros-obsidian-vault.git

# Premier push
git push -u origin master
```

#### 3️⃣ Configurer le PC (si pas déjà fait)
```bash
# Clone du vault
git clone git@github.com:TON_USER/xeros-obsidian-vault.git ~/Obsidian-Vault

# Ouvrir dans Obsidian
# Settings → Files & Links → Default location for new notes
```

#### 4️⃣ Configuration SSH (recommandé)
```bash
# Sur le VPS
ssh-keygen -t ed25519 -C "xeros@hermes"
cat ~/.ssh/id_ed25519.pub
# Copie la clé et ajoute-la à GitHub: Settings → SSH and GPG keys

# Sur le PC
ssh-keygen -t ed25519 -C "xeros@pc"
# Ajouter à GitHub aussi
```

### ⚙️ Automatisation

#### Cron Job (VPS)
- **Fréquence**: Toutes les 5 minutes
- **Script**: `/root/obsidian-sync.sh`
- **Log**: `/root/logs/obsidian-sync.log`

**Vérification**:
```bash
crontab -l | grep obsidian
# Should show: */5 * * * * /root/obsidian-sync.sh
```

#### Manuel (au besoin)
```bash
# Force sync depuis VPS
/root/obsidian-sync.sh

# Pull seul (récupérer depuis GitHub)
cd /root/obsidian-vault && git pull --rebase

# Push seul (envoyer au GitHub)
cd /root/obsidian-vault && git push
```

### 🛠️ Dépannage

#### Problème: "Permission denied (publickey)"
**Solution**:
```bash
# Vérifier les clés SSH
ls -la ~/.ssh/

# Ajouter la clé à GitHub
# 1. Copie: cat ~/.ssh/id_ed25519.pub
# 2. GitHub → Settings → SSH and GPG keys → New SSH key
```

#### Problème: Merge conflicts
**Solution**:
```bash
cd /root/obsidian-vault
git status  # Voir les fichiers en conflit
git merge --abort  # Annuler le merge
# Éditer les fichiers, puis:
git add .
git commit -m "Fix merge conflicts"
git push
```

#### Problème: Sync ne se fait pas
**Vérifier**:
```bash
# Logs
tail -20 /root/logs/obsidian-sync.log

# Cron active
crontab -l

# Permissions
ls -la /root/obsidian-sync.sh
```

### 📊 Monitoring

```bash
# Voir les derniers syncs
tail -50 /root/logs/obsidian-sync.log

# Voir l'état du repo
cd /root/obsidian-vault && git status
git log --oneline -10  # Derniers commits
```

## 🎯 Avantages

✅ **Gratuit**: Pas de frais mensuels
✅ **Contrôle total**: Tes données chez toi (GitHub)
✅ **Versioning**: Historique complet de toutes les modifications
✅ **Backup automatique**: GitHub sert de backup cloud
✅ **Accessibilité**: Accessible depuis n'importe quel appareil
✅ **Intégration**: Compatible avec tous les clients Git

---

**Dernière mise à jour**: 2026-04-19 14:45
**Status**: ✅ Prêt pour le premier push GitHub
