#!/bin/bash

install_brew() {
	which brew 1>&/dev/null
	if [ ! $? -eq 0 ]; then
		echo "Homebrew not installed. Attempting to install Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		if [ ! "$?" -eq 0 ] ; then
			echo "Something went wrong. Exiting..." && exit 1
		fi
	fi	
}

install_nvim() {
	which nvim 1>&/dev/null
	if [ ! $? -eq 0 ]; then
		echo "Neovim is not installed. Attempting to install neovim"
		brew install neovim
		if [ ! "$?" -eq 0 ]; then
			echo "Somthing went wrong. Exiting..." && exit 1
		fi
	fi
	mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
}

