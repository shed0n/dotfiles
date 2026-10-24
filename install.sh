#!/usr/bin/env bash
set -e

# Ensure we are running from the dotfiles directory root
cd "$(dirname "$0")"

echo "Deploying Dotfiles"

# 1. home directory configs utilizing --adopt
echo "📦 Automatically adopting and linking user configuration packages..."
stow --adopt -v -t ~ fastfetch flameshot niri noctalia scripts solaar starship tmux wezterm zsh

echo -e "\n🎨 Configuring System SDDM"

# 2. Safely isolate the theme directory so Stow doesn't create a '/themes' root directory
if [ -d "sddm/themes" ]; then
    echo "⚙️  Temporarily isolating theme folder for safe configuration adoption..."
    mv sddm/themes sddm_themes_bak
fi

# 3. Force Stow to adopt the system configuration file cleanly into /etc/
echo "🔗 Adopting and symlinking sddm.conf to /etc..."
sudo stow --adopt -v -t / sddm

# 4. Bring the theme folder back into the local package structure
if [ -d "sddm_themes_bak" ]; then
    mv sddm_themes_bak sddm/themes
fi

# 5. Physically copy theme assets so SDDM bypasses home directory permission security
if [ -d "sddm/themes/silent" ]; then
    echo "🎨 Installing 'silent' theme assets to /usr/share/sddm/themes/..."
    sudo mkdir -p /usr/share/sddm/themes/
    sudo cp -r sddm/themes/silent /usr/share/sddm/themes/
else
    echo "⚠️  Warning: 'sddm/themes/silent' directory not found. Skipping asset copy."
fi

echo -e "\n=========================================="
echo "       🎉 Setup complete! All systems go.  "
echo "=========================================="
