#!/bin/bash

# Drive safe.
set -Eexou pipefail

# Source functions.
source ./functions.sh

# Install and config brew
install_brew

# ---------------------------------------------------------
# Install dependency
# ---------------------------------------------------------

# Neovim
install_nvim

# Python
brew install python3 && pip3 install --user pynvim

# Golang
brew install golang

# Node
brew install node

# Zsh
brew install zsh

# Zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# FZF
brew install fzf
$(brew --prefix)/opt/fzf/install


# ---------------------------------------------------------
# Miscellaneous 
# ---------------------------------------------------------

# Always put to current branch
git config --global push.default current

# Use zsh
chsh -s /bin/zsh

# Setup neovim
mv ~/.vimrc ~/.vimrc_back
ln -s ~/.config/nvim/init.vim ~/.vimrc


# ---------------------------------------------------------
# Install dotfiles
# ---------------------------------------------------------
make import 
