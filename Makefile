zshset:
	mkdir -p ~/.zsh
	ln -sf ~/dotfiles/zsh/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	ln -sf ~/dotfiles/zsh/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
	ln -sf ~/dotfiles/zsh/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	cp ~/dotfiles/zsh/.zshrc ~/.zshrc
	source ~/.zshrc
starshipset:
	mkdir -p ~/.config
	ln -sf ~/dotfiles/shell/starship.toml ~/.config/starship.toml
tmuxset:
	mkdir -p ~/.tmux
	ln -sf ~/dotfiles/tmux/srcery-tmux-master ~/.tmux/srcery-tmux-master
	cp ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
vimset:
	# vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
nvimset:
	# neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.config/nvim
	ln -sf ~/dotfiles/.init.vim ~/.config/nvim/init.vim
alacrittyset:
	mkdir -p ~/.config/alacritty
	ln -sf ~/dotfiles/terminals/alacritty.yml ~/.config/alacritty/
