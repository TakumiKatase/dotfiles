zsh:
	mkdir -p ~/.zsh
	ln -sf ~/dotfiles/zsh/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	ln -sf ~/dotfiles/zsh/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
	ln -sf ~/dotfiles/zsh/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	cp ~/dotfiles/zsh/.zshrc ~/.zshrc
	source ~/.zshrc
starship:
	mkdir -p ~/.config
	ln -sf ~/dotfiles/shell/starship.toml ~/.config/starship.toml
tmux:
	mkdir -p ~/.tmux
	ln -sf ~/dotfiles/tmux/srcery-tmux-master ~/.tmux/srcery-tmux-master
	cp ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
vim:
	# vim
	curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
	# neovim
	curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p $HOME/.config/nvim
	ln -sf ~/dotfiles/.init.vim ~/.config/nvim/init.vim
	nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
alacritty:
	mkdir -p $HOME/.config/alacritty
	ln -sf ~/dotfiles/terminals/alacritty.yml ~/.config/alacritty/
