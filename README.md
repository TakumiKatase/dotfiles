# prezto導入

- ログインシェルの変更
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
