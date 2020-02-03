.PHONY: updatezsh importzsh updatevim importvim update import install

updatezsh:
	cp ~/.zshrc ./zsh/zshrc

importzsh:
	mv ~/.zshrc ~/.zshrc_back 
	cp ./zsh/zshrc ~/.zshrc

updatevim:
	cp ~/.vimrc ./vim/vimrc

importvim:
	mv ~/.vimrc ~/.vimrc_back	
	cp ./vim/vimrc ~/.vimrc

update: updatezsh updatevim 
	@echo "Done."

import: importzsh importvim
	@echo "Done."

install:
	./install.sh

