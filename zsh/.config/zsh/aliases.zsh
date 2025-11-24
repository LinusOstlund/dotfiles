# Shell aliases

# Dotfile editing shortcuts
alias zdot="code ~/.zshrc"
alias zr="source ~/.zshrc"
alias tdot="code ~/.tmux.conf"
alias tr="tmux source-file ~/.tmux.conf"

# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"

# Better ls (macOS uses -G for color, GNU ls uses --color=auto)
# Check if GNU ls is available (will have --version flag)
if ls --version &>/dev/null 2>&1; then
  # GNU ls (if installed via brew coreutils)
  alias ls="ls --color=auto"
  alias ll="ls -asl --color=auto"
else
  # macOS BSD ls
  alias ls="ls -G"
  alias ll="ls -aslG"
fi

# Use bat instead of cat (with --paging=never to not break pipes)
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
fi

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gcl="git clone"

# Tree command aliases (if tree is installed)
if command -v tree >/dev/null 2>&1; then
  alias tree="tree -C"
  alias t2="tree -L 2 -C"
  alias t3="tree -L 3 -C"
  alias t4="tree -L 4 -C"
  alias t="tree -C --gitignore"
fi

# YQ helper function
if command -v yq >/dev/null 2>&1; then
  json2yaml() { yq -Poy "$@"; }
fi

# Temporary shortcuts for Signifc projects
hash -d bigimg=~/Projects/bigimage-app
hash -d bigimg-mono=~/Projects/bigimage
