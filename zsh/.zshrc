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

# for curl
setopt nonomatch

# direnv
export EDITOR=nvim

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

export TERM=xterm-256color
source $HOME/dotfiles/shell/zsh-extension/history_share.sh
