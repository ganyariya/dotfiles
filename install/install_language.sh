#!/bin/bash

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# asdf-plugin
# asdf plugin-add nodejs
# asdf plugin-add golang
# asdf plugin-add rust
# asdf plugin-add nim
# asdf plugin-add python

# go
brew install go
go get github.com/knqyf263/pet
go get github.com/mkchoi212/fac
go get github.com/odeke-em/drive/cmd/drive
go get github.com/codegangsta/gin

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install stable

# node
nodebrew setup
nodebrew install-binary latest
nodebrew use latest

# npm
npm install -g zenn-cli
npm install -g @marp-team/marp-cli
npm install -g carbon-now-cli
npm install -g gitignore.cli
npm install -g @google/clasp
npm install -g gitmoji-cli
npm install -g gatsby-cli
npm install -g surge
npm install -g zx

# python
pip install --upgrade pip
brew install pipenv
brew install pyenv
pipx install tweet
pipx install atcoder-tools

# gh
gh extension install mislav/gh-branch
gh extension install k1LoW/gh-grep
gh extension install vilmibm/gh-screensaver
gh extension install kawarimidoll/gh-graph
