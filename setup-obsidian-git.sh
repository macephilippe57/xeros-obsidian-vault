#!/bin/bash
#
# Setup Git Sync pour Obsidian
# Crée le repo GitHub et configure le push
#

set -e

echo "============================================"
echo "  🚀 Obsidian Git Sync - Quick Setup"
echo "============================================"
echo ""

# Demander le username GitHub
read -p "Ton username GitHub (ex: Xeros): " GITHUB_USER

if [ -z "$GITHUB_USER" ]; then
    echo "❌ Username GitHub requis"
    exit 1
fi

REPO_NAME="xeros-obsidian-vault"
REMOTE_URL="git@github.com:${GITHUB_USER}/${REPO_NAME}.git"

echo ""
echo "📋 Configuration:"
echo "   User: $GITHUB_USER"
echo "   Repo: $REPO_NAME"
echo "   URL: $REMOTE_URL"
echo ""

# Créer le repo GitHub (si gh installé)
echo "🔧 Création du repository..."
if command -v gh &> /dev/null; then
    gh repo create "$GITHUB_USER/$REPO_NAME" --public --description="Obsidian Trading Vault" --source=. --remote=origin 2>&1 || echo "⚠️ Repo existe déjà ou erreur"
else
    echo "ℹ️  gh CLI non installé"
    echo "   Va sur: https://github.com/new"
    echo "   Nom: $REPO_NAME"
    echo "   Pas de README initial"
    echo ""
    read -p "Appuie sur Entrée quand le repo est créé"
fi

# Ajouter le remote et push
echo ""
echo "📤 Configuration du remote et premier push..."
cd /root/obsidian-vault
git remote add origin "$REMOTE_URL" 2>/dev/null || echo "⚠️ Remote existe déjà"
git remote -v

echo ""
echo "🚀 Premier push (suivi des instructions SSH)..."
read -p "Es-tu prêt pour le push ? (o/n): " CONFIRM
if [ "$CONFIRM" = "o" ]; then
    git push -u origin master 2>&1
    echo ""
    echo "✅ SUCCESS!"
    echo ""
    echo "📋 Prochaines étapes:"
    echo "   1. Va sur https://github.com/$GITHUB_USER/$REPO_NAME"
    echo "   2. Clone le repo sur ton PC:"
    echo "      git clone git@github.com:$GITHUB_USER/$REPO_NAME.git"
    echo "   3. Ouvre le folder dans Obsidian"
    echo ""
    echo "🔄 Sync automatique: toutes les 5 minutes depuis le VPS"
else
    echo "❌ Setup annulé"
    exit 1
fi
