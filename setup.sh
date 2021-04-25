#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux/ ~/.tmux && ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/alacritty/
ln -sf ~/dotfiles/terminals/alacritty.yml ~/.config/alacritty/
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/zsh ~/.zsh && ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
