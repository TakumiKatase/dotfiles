#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux/tmux-onedark-theme ~/.tmux/tmux-onedark-theme
mkdir -p ~/.config/alacritty/
ln -sf ~/dotfiles/terminals/alacritty.yml ~/.config/alacritty/
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/zsh/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
ln -sf ~/dotfiles/zsh/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
ln -sf ~/dotfiles/zsh/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
