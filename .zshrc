bindkey -e
eval "$(starship init zsh)"

. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# git path
export PATH=$PATH:"/usr/local/bin/git"

# for curl
setopt nonomatch

# go path
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# hyper
precmd() {
   pwd=$(pwd)
   cwd=${pwd##*/}
   print -Pn "\e]0;$cwd\a"
}

# rbenv ruby
eval "$(rbenv init -)"

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# peco-src
bindkey '^]' peco-src
function peco-src() {
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c
}
zle -N peco-src

export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -Uz compinit && compinit

# alias for tmux ide
alias ide="sh ~/dotfiles/ide.sh"

# set color for ls command
autoload -Uz colors
colors
alias ls='exa -F --icons'
alias ll='ls -l'
alias la='ll -aF'
alias lt='ll -TF'
alias l='ll -F'
alias cat='bat'

# set vim and nvim
alias vi='nvim'
alias vim='nvim'

# set shortcurt ctrl+r for peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

export TERM=xterm-256color
