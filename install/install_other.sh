#!/bin/bash

# fish
# echo /usr/local/bin/fish | sudo tee -a /etc/shells

# powerline
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
chmod +x install.sh
./install.sh
cd ..
rm -rf fonts

# Cica (powerline + nerd font)
mkdir ~/.tmp_font
cd ~/.tmp_font
curl -OL https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip
curl -OL https://github.com/yuru7/HackGen/releases/download/v2.5.3/HackGenNerd_v2.5.3.zip
unzip Cica_v5.0.2_with_emoji.zip
unzip HackGenNerd_v2.5.3.zip
cp -f Cica*.ttf ~/Library/Fonts/
cp -f HackGenNerd_v2.5.3/HackGen*.ttf ~/Library/Fonts/
fc-cache -vf
rm -rf ~/.tmp_font

# tmux
# After downloading tmux, restart tmux & ctrl+a I
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# zsh
chsh -s /bin/zsh

# tex
brew install --cask mactex
sudo tlmgr update --self --all
sudo tlmgr paper a4

# auto-selfcontrol
cp -n auto-selfcontrol/config.json /usr/local/etc/auto-selfcontrol/config.json
