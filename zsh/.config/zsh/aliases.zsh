# Shell aliases

# Dotfile editing shortcuts
# Open .zshrc in VS Code
alias zdot="code ~/.zshrc"
# Reload .zshrc (apply changes)
alias zr="source ~/.zshrc"
# Open tmux config in VS Code
alias tdot="code ~/.tmux.conf"
# Reload tmux config
alias tr="tmux source-file ~/.tmux.conf"

# Directory navigation
# Go up one directory
alias ..="cd .."
# Go up two directories
alias ...="cd ../.."
# Go up three directories
alias ....="cd ../../../"

# Better ls (macOS uses -G for color, GNU ls uses --color=auto)
# On macOS, use BSD ls with -G flag
# If you install GNU coreutils, gls will be available
# List with colors
alias ls="ls -G"
# List all files with details (size, permissions, etc.)
alias ll="ls -aslG"

# If GNU ls is installed via brew coreutils, use it instead
if command -v gls >/dev/null 2>&1; then
  alias ls="gls --color=auto"
  alias ll="gls -asl --color=auto"
fi

# Use bat instead of cat (with --paging=never to not break pipes)
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
fi

# Git aliases
# Show git status
alias gs="git status"
# Stage files for commit
alias ga="git add"
# Commit staged changes
alias gc="git commit"
# Amend the last commit
alias gca="git commit --amend"
# Push to remote
alias gp="git push"
# Pull from remote
alias gl="git pull"
# Switch branches
alias gco="git checkout"
# List branches
alias gb="git branch"
# Show unstaged changes
alias gd="git diff"
# Show staged changes
alias gdc="git diff --cached"
# Clone a repository
alias gcl="git clone"

# Tree command aliases (if tree is installed)
if command -v tree >/dev/null 2>&1; then
  # Set LS_COLORS to match macOS BSD ls color scheme
  # This makes tree colors consistent with ls
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

  # Show tree with colors
  alias tree="tree -C"
  # Tree with depth 1 (current directory only)
  alias t1="tree -L 1 -C"
  # Tree with depth 2
  alias t2="tree -L 2 -C"
  # Tree with depth 3
  alias t3="tree -L 3 -C"
  # Tree with depth 4
  alias t4="tree -L 4 -C"
  # Tree respecting .gitignore
  alias t="tree -C --gitignore"
fi

# YQ helper function
if command -v yq >/dev/null 2>&1; then
  json2yaml() { yq -Poy "$@"; }
fi

# Git aliases cheat sheet - show all git aliases
wtfgit() {
  echo "\033[1;38;5;166m═══ Git Aliases Cheat Sheet ═══\033[0m"
  echo ""
  echo "\033[1;38;5;64mZsh Aliases (use directly):\033[0m"
  echo ""
  alias | grep "^g[a-z]*=" | sed "s/=/\t/" | while IFS=$'\t' read cmd full; do
    full=$(echo "$full" | sed "s/^'//" | sed "s/'$//")
    echo "  \033[38;5;136m$cmd\033[0m → \033[38;5;33m$full\033[0m"
  done
  echo ""
  echo "\033[1;38;5;64mGitconfig Aliases (use with 'git'):\033[0m"
  echo ""
  git config --get-regexp '^alias\.' | sed 's/alias\.//' | while read -r key value; do
    # Get the full line after the key
    full=$(git config --get "alias.$key")
    echo "  \033[38;5;136mgit $key\033[0m → \033[38;5;33m$full\033[0m"
  done
  echo ""
  echo "\033[38;5;125mTip:\033[0m Zsh aliases are faster to type, gitconfig aliases work everywhere!"
}

# Grep cheat sheet - show common grep usage examples
wtfgrep() {
  echo "\033[1;38;5;166m═══ Grep Cheat Sheet ═══\033[0m"
  echo ""
  echo "\033[1;38;5;64mCommon Examples:\033[0m"
  echo ""
  echo "  \033[38;5;136m1. Search for text in a file:\033[0m"
  echo "     \033[38;5;33m$ grep \"error\" app.log\033[0m"
  echo "     \033[2mConnection error occurred\033[0m"
  echo ""
  echo "  \033[38;5;136m2. Search recursively in all files:\033[0m"
  echo "     \033[38;5;33m$ grep -r \"TODO\" src/\033[0m"
  echo "     \033[2msrc/utils.js: // TODO: fix this bug\033[0m"
  echo ""
  echo "  \033[38;5;136m3. Case-insensitive search:\033[0m"
  echo "     \033[38;5;33m$ grep -i \"warning\" app.log\033[0m"
  echo "     \033[2mWARNING: Low memory\033[0m"
  echo ""
  echo "  \033[38;5;136m4. Show line numbers:\033[0m"
  echo "     \033[38;5;33m$ grep -n \"function\" app.js\033[0m"
  echo "     \033[2m42:function initialize() {\033[0m"
  echo ""
  echo "  \033[38;5;136m5. Pipe output into grep:\033[0m"
  echo "     \033[38;5;33m$ cat package.json | grep \"version\"\033[0m"
  echo "     \033[2m  \"version\": \"1.2.3\",\033[0m"
  echo ""
  echo "\033[38;5;125mPro tip:\033[0m Combine flags like \033[38;5;33mgrep -rni \"pattern\" .\033[0m for recursive, case-insensitive, with line numbers!"
}

# Temporary shortcuts for Signifc projects
hash -d bigimg=~/Projects/bigimage-app
hash -d bigimg-mono=~/Projects/bigimage

# Quick navigation
# Go to home directory
alias home="cd ~"
# Go to dotfiles directory
alias dots="cd ~/dotfiles"
# Go to Projects directory
alias proj="cd ~/Projects"

# Git extras
# Show pretty git log with graph
alias glog="git log --oneline --graph --decorate"
# Stash current changes
alias gst="git stash"
# Pop (restore) stashed changes
alias gstp="git stash pop"
# Rebase current branch
alias grb="git rebase"
# Git status porcelain (for scripts)
alias gsp="git status --porcelain"
# git diff cached with color
alias gdc="git diff --cached --color"

# Docker aliases (if docker is installed)
if command -v docker >/dev/null 2>&1; then
  # Docker shorthand
  alias d="docker"
  # Docker Compose
  alias dc="docker-compose"
  # List running containers
  alias dps="docker ps"
  # List docker images
  alias dimg="docker images"
fi

# Kubectl/K8s aliases (if kubectl is installed)
if command -v kubectl >/dev/null 2>&1; then
  # Kubectl shorthand
  alias k="kubectl"
  # List pods
  alias kgp="kubectl get pods"
  # List services
  alias kgs="kubectl get services"
  # Describe a pod
  alias kdp="kubectl describe pod"
fi

# Python/pip
# Use python3 as py
alias py="python3"
# Use pip3 as pip
alias pip="pip3"
# Activate virtual environment in .venv
alias activate="source .venv/bin/activate"

# System/Process monitoring
# Show which ports are listening
alias ports="lsof -i -P | grep LISTEN"
# Show top CPU-consuming processes
alias cpu="top -o cpu"
# Show top memory-consuming processes
alias mem="top -o mem"

# Better file operations
# Create directories with parent directories and verbose output
alias mkdir="mkdir -pv"
# Grep with color highlighting
alias grep="grep --color=auto"
