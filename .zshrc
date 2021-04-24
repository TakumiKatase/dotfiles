bindkey -e
eval "$(starship init zsh)"

# extention
# AutoSuggestion
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntaxhightlight
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
    ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
fi

# HistorySearch
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
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

# direnv
export EDITOR=nvim
eval "$(direnv hook zsh)"

# alias for tmux ide
alias ide="sh ~/dotfiles/tmux/ide.sh"
alias dide="sh ~/dotfiles/tmux/default-ide.sh"

# set color for ls command
autoload -Uz colors
colors
alias ls='exa -F --icons'
alias ll='ls -l'
alias la='ll -aF'
alias lt='ll -TF'
alias l='ll -F'
alias cat='bat'

export TERM=xterm-256color
