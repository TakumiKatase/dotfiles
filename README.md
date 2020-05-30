# prezto導入

- ログインシェルの変更
```$ chsh -s /bin/zsh```

- リモートリポジトリからpreztoをクローン
```
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 
```

- preztoの初期設定みたいなの(シンボリックリンクをなんかしてる)
```
$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

- autosuggestionsを有効にする
```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```
```
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```
を.zshrcに追加


- syntaxhighligthingを有効にする
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

# GitHubからvimの設定を

```
$ cd
```
- vim-plug導入
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- devoc09のリポジトリから設定ファイルとってくる
```
$ git clone https://github.com/devoc09/dotfiles.git
```

- シンボリックリンクをつくる
```
$ cd dotfiles
```

```
$ sh dotfilesLink.sh
```

- vim-hybridの有効化
```
$ git clone https://github.com/w0ng/vim-hybrid
```

```
$ mv vim-hybrid/colors/hybrid.vim ~/.vim/colors
```
