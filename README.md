If you haven't installed git yet. youcan can use your os package manager
Edit the files before installing git `mac.sh`, `arch.sh`, `debian.sh`
- Mac use homebrew
```$ sh git/mac.sh```
- Arch use pacman
```$ sh git/arch.sh```
- Debian use apt
```$ sh git/debian.sh```

# Zsh settings

- change login shell to zsh
```$ chsh -s /bin/zsh```

- remove zsh files
```
rm -rf ~/.zprezto ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
```

- clone prezto from remote repository
```
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

- first setting prezto (シンボリックリンクをなんかしてる)
```
$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

- enable autosuggestions
```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```
```
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```
を.zshrcに追加

- enable git tab Complement for zsh
```
$ sh git/autoload.sh
```


- enable syntaxhighligthing
```
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

```
$ source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```
最後に
```
$ source ~/.zshrc
```
たぶんできてるはず。

# vim setting

```
$ cd
```
- vim-plug
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- clone dotfiles from devoc09's repository
```
$ git clone https://github.com/devoc09/dotfiles.git
```

- シンボリックリンクをつくる
```
$ cd dotfiles
```
- imwheelのインストール
```
$ sudo apt install imwheel
```

```
$ sh dotfilesLink.sh
```

```
$ imwheel
```
