# 📁 Obsidian Vault - PC Setup Instructions

## ✅ VPS Configuré

Le vault sur le VPS (`/root/obsidian-vault`) est **déjà initialisé avec Git** et prêt à être syncé avec GitHub.

## 🔄 Workflow

```
VPS (/root/obsidian-vault) ──git──▶ GitHub ──git──▶ PC (Obsidian)
      ⬇️ cron 5min                          ⬇️ Manuel/automatisé
```

## 📋 Setup PC (3 étapes)

### 1️⃣ Créer le repository GitHub

**Via web** (recommandé):
1. Va sur https://github.com/new
2. Repository name: `xeros-obsidian-vault`
3. Visibility: **Public** ou **Private**
4. **NE PAS** cocher "Add README"
5. Créer le repo

**Via CLI** (si `gh` installé):
```bash
gh auth login
gh repo create xeros-obsidian-vault --public --description="Obsidian Trading Vault"
```

### 2️⃣ Ajouter le remote sur le VPS

```bash
# Remplace XEROS par ton username GitHub
git remote add origin git@github.com:XEROS/xeros-obsidian-vault.git

# Tester la connexion
git push -u origin master
# Suivi des instructions SSH si première fois
```

### 3️⃣ Clone sur le PC

```bash
# Installer Git si nécessaire
# Windows: https://git-scm.com/download/win
# Mac: brew install git
# Linux: apt install git

# Clone le vault
git clone git@github.com:XEROS/xeros-obsidian-vault.git ~/Obsidian-Vault

# Ouvrir dans Obsidian
# File → Open Folder → ~/Obsidian-Vault
```

## 🎯 Vérification

```bash
# Sur le VPS
cd /root/obsidian-vault
git status
git log --oneline -5

# Sur le PC
cd ~/Obsidian-Vault
git status
git log --oneline -5
```

## 🔄 Synchronisation

### Automatique (VPS)
- **Toutes les 5 minutes**: `/root/obsidian-sync.sh` via cron
- Les modifications sur le VPS sont pushées automatiquement

### Manuel (PC)
```bash
# Récupérer les dernières modifs du VPS
git pull

# Envoyer les modifs du PC
git add .
git commit -m "Message"
git push
```

### Via Interface (recommandé pour PC)

**Windows**:
- GitKraken, SourceTree, ou GitHub Desktop

**Mac**:
- GitHub Desktop (recommandé)
- Tower
- Fork

**Linux**:
- Git Extensions
- GitKraken

## 🛠️ SSH Setup

### Générer une clé SSH
```bash
ssh-keygen -t ed25519 -C "xeros@hermes"
```

### Ajouter la clé à GitHub
1. Copie: `cat ~/.ssh/id_ed25519.pub`
2. GitHub → Settings → SSH and GPG keys → New SSH key
3. Titre: "VPS + PC"
4. Clé: colle le contenu du fichier

### Tester la connexion
```bash
ssh -T git@github.com
# Should show: "Hi XEROS! You've successfully authenticated"
```

## 📊 Monitoring

### Logs VPS
```bash
tail -f /root/logs/obsidian-sync.log
```

### Status Git
```bash
cd /root/obsidian-vault
git status
git branch -a
git remote -v
```

## 🎁 Structure du Vault

```
obsidian-vault/
├── .obsidian/           # Config Obsidian
├── TRADING_OPERATIONS/  # Trading, signals, analysis
├── GBRAIN_SKILLS/       # Documentation GBRAIN
├── ADAPTER_INTEGRATIONS/
├── PAPERCLIP_ADAPTER/
├── CLAW_CODE_ANALYSIS/
├── GIT_SYNC_SETUP.md    # Ce docs
├── .env                 # Env vars
└── *.md                 # Notes principales
```

## 💡 Tips

✅ **Backup**: GitHub sert de backup cloud automatique
✅ **Versioning**: Historique complet de toutes modifications
✅ **Collaboration**: Possible d'inviter des collaborators
✅ **Mobile**: Git mobile apps disponibles (GitFox, etc.)

## ⚠️ Dépannage

**"Permission denied"**:
```bash
# Régénérer la clé SSH
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "xeros@newkey"
# Ajouter la nouvelle clé à GitHub
```

**"Merge conflict"**:
```bash
git mergetool  # Utiliser un outil visuel
# Ou éditer manuellement
git add .
git commit -m "Fix conflicts"
```

**"Too many commits"**:
```bash
git rebase -i HEAD~10  # Squash les derniers commits
git push --force-with-lease
```

---

**Status**: ✅ VPS prêt | ⏳ En attente: GitHub repo + PC clone

**Prochaine étape**: Créer le repo GitHub et push depuis le VPS ! 🚀
