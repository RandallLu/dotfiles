#!/bin/bash

# Drive safe.
# set -xou pipefail

# Source functions.
source ./functions.sh

# Install and config brew
install_brew
brew tap caskroom/cask

# ---------------------------------------------------------
# Install dependency
# ---------------------------------------------------------

# Neovim
install_nvim

# Vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python
brew install python3 && pip3 install --user pynvim

# Golang
brew install golang 

# Node
brew install node 

# Iterm2
brew cask install iterm2

# Zsh
brew install zsh 

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

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
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
mv ~/.vimrc ~/.vimrc_back
ln -s ~/.config/nvim/init.vim ~/.vimrc

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font


# ---------------------------------------------------------
# Install dotfiles
# ---------------------------------------------------------
make import 
echo "Install iterm theme: https://github.com/mhartington/oceanic-next-iterm"
