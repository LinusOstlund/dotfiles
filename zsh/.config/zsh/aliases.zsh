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
# Reload everything
alias r="zr && tr"
# Launch tmux with dev layout
alias tdev="~/dotfiles/tmux/layouts/dev.sh"
# Open dotfiles repo in VS Code
alias dotfiles="code ~/dotfiles"
# Open dotfiles repo in Claude Code
alias cdot="cd ~/dotfiles && claude"
# List all tmux sessions
alias tls="tmux ls"
# Kill current tmux session
alias tkill="tmux kill-session"
# Attach to tmux session
alias ta="tmux attach -t"

# Directory navigation
# Go up one directory
alias ..="cd .."
# Go up two directories
alias ...="cd ../.."
# Go up three directories
alias ....="cd ../../../"

# Better ls using eza (with Nerd Font icons)
if command -v eza >/dev/null 2>&1; then
  # List with colors, icons, and directories first
  alias ls="eza --icons --group-directories-first"
  # List with --all
  alias lsa="eza --icons --group-directories-first --all"
  # List all files with details (size, permissions, etc.)
  alias ll="eza --icons --group-directories-first --long --all --header --git"
  # List with grid layout
  alias la="eza --icons --group-directories-first --all"
else
  # Fallback to BSD ls (macOS default)
  alias ll="ls -aslG"
fi

# Use bat instead of cat (with --paging=never to not break pipes)
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
fi

# Use tlrc for simplified man pages
if command -v tlrc >/dev/null 2>&1; then
  alias man='tldr'
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

# Tree command aliases using eza (with Nerd Font icons)
if command -v eza >/dev/null 2>&1; then
  alias t="eza --tree --icons --group-directories-first"
  alias ta="eza --tree --icons --group-directories-first --all"
  # Tree with depth 1 (current directory only)
  alias t1="eza --tree --icons --group-directories-first --level=1"
  alias t2="eza --tree --icons --group-directories-first --level=2"
  alias t3="eza --tree --icons --group-directories-first --level=3"
  alias t4="eza --tree --icons --group-directories-first --level=4"
  # Tree with --all and depth
  alias t1a="eza --tree --icons --group-directories-first --level=1 --all"
  alias t2a="eza --tree --icons --group-directories-first --level=2 --all"
  alias t3a="eza --tree --icons --group-directories-first --level=3 --all"
  alias t4a="eza --tree --icons --group-directories-first --level=4 --all"

  # Tree respecting .gitignore (shorthand)
  alias ti="eza --tree --icons --group-directories-first --git-ignore"
  alias t1i="eza --tree --icons --group-directories-first --level=1 --git-ignore"
  alias t2i="eza --tree --icons --group-directories-first --level=2 --git-ignore"
  alias t3i="eza --tree --icons --group-directories-first --level=3 --git-ignore"
  alias t4i="eza --tree --icons --group-directories-first --level=4 --git-ignore"
fi

# YQ helper function
if command -v yq >/dev/null 2>&1; then
  json2yaml() { yq -Poy "$@"; }
fi

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

# ZMK Keyboard cheat sheet - Sofle Choc Pro BT with Swedish layout
wtfzmk() {
  echo "\033[1;38;5;166m═══ ZMK Sofle Choc Pro BT - Swedish Layout ═══\033[0m"
  echo ""
  echo "\033[1;38;5;64mBase Layer:\033[0m"
  echo ""
  echo "  \033[38;5;240m┌─────┬─────┬─────┬─────┬─────┬─────┐         ┌─────┬─────┬─────┬─────┬─────┬─────┐\033[0m"
  echo "  \033[38;5;240m│\033[0m  §  \033[38;5;240m│\033[0m  1  \033[38;5;240m│\033[0m  2  \033[38;5;240m│\033[0m  3  \033[38;5;240m│\033[0m  4  \033[38;5;240m│\033[0m  5  \033[38;5;240m│         │\033[0m  6  \033[38;5;240m│\033[0m  7  \033[38;5;240m│\033[0m  8  \033[38;5;240m│\033[0m  9  \033[38;5;240m│\033[0m  0  \033[38;5;240m│\033[0m\033[38;5;166mBSPC\033[0m\033[38;5;240m│\033[0m"
  echo "  \033[38;5;240m├─────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼─────┤\033[0m"
  echo "  \033[38;5;240m│\033[0m ESC \033[38;5;240m│\033[0m  Q  \033[38;5;240m│\033[0m  W  \033[38;5;240m│\033[0m  E  \033[38;5;240m│\033[0m  R  \033[38;5;240m│\033[0m  T  \033[38;5;240m│         │\033[0m  Y  \033[38;5;240m│\033[0m  U  \033[38;5;240m│\033[0m  I  \033[38;5;240m│\033[0m  O  \033[38;5;240m│\033[0m  P  \033[38;5;240m│\033[0m\033[38;5;166m RET\033[0m\033[38;5;240m│\033[0m"
  echo "  \033[38;5;240m├─────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼─────┤\033[0m"
  echo "  \033[38;5;240m│\033[0m TAB \033[38;5;240m│\033[0m  A  \033[38;5;240m│\033[0m  S  \033[38;5;240m│\033[0m  D  \033[38;5;240m│\033[0m  F  \033[38;5;240m│\033[0m  G  \033[38;5;240m│         │\033[0m  H  \033[38;5;240m│\033[0m  J  \033[38;5;240m│\033[0m  K  \033[38;5;240m│\033[0m  L  \033[38;5;240m│\033[0m  '  \033[38;5;240m│\033[0m \033[38;5;166m+/?\033[0m\033[38;5;240m│\033[0m"
  echo "  \033[38;5;240m├─────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼─────┤\033[0m"
  echo "  \033[38;5;240m│\033[0mSHFT \033[38;5;240m│\033[0m  Z  \033[38;5;240m│\033[0m  X  \033[38;5;240m│\033[0m  C  \033[38;5;240m│\033[0m  V  \033[38;5;240m│\033[0m  B  \033[38;5;240m│         │\033[0m  N  \033[38;5;240m│\033[0m  M  \033[38;5;240m│\033[0m \033[38;5;136m,;\033[0m  \033[38;5;240m│\033[0m \033[38;5;136m.:\033[0m  \033[38;5;240m│\033[0m \033[38;5;136m-_\033[0m  \033[38;5;240m│\033[0mSHFT\033[38;5;240m│\033[0m"
  echo "  \033[38;5;240m└─────┴─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┴─────┘\033[0m"
  echo "  \033[38;5;240m            │\033[0m GUI \033[38;5;240m│\033[0m ALT \033[38;5;240m│\033[0mCTRL \033[38;5;240m│\033[0m\033[38;5;33mLWR\033[0m  \033[38;5;240m│\033[0m SPC \033[38;5;240m│   │\033[0m RET \033[38;5;240m│\033[0m\033[38;5;33mRSE\033[0m  \033[38;5;240m│\033[0mCTRL \033[38;5;240m│\033[0m ALT \033[38;5;240m│\033[0m GUI \033[38;5;240m│\033[0m"
  echo "  \033[38;5;240m            └─────┴─────┴─────┴─────┘         └─────┴─────┴─────┴─────┴─────┘\033[0m"
  echo ""
  echo "\033[1;38;5;64mCombos (press together):\033[0m"
  echo "  \033[38;5;136må\033[0m = P + Enter    \033[38;5;136mö\033[0m = L + '    \033[38;5;136mä\033[0m = ' + +/?    \033[38;5;136mSpotlight\033[0m = S + P"
  echo ""
  echo "\033[1;38;5;64mLOWER Layer (Left Thumb):\033[0m"
  echo "  \033[38;5;136mArrows:\033[0m     ESDF (left hand) or IJKL (right hand)"
  echo "  \033[38;5;136mBrackets:\033[0m   8=\033[38;5;33m[\033[0m  88=\033[38;5;33m{\033[0m  │  9=\033[38;5;33m]\033[0m  99=\033[38;5;33m}\033[0m  (tap-dance)"
  echo "  \033[38;5;136mSymbols:\033[0m    Z=\033[38;5;33m<\033[0m  X=\033[38;5;33m>\033[0m  2=\033[38;5;33m@\033[0m  4=\033[38;5;33m\$\033[0m"
  echo "  \033[38;5;136mWord Jump:\033[0m  U=\033[38;5;33m←word\033[0m  O=\033[38;5;33mword→\033[0m"
  echo ""
  echo "\033[1;38;5;64mRAISE Layer (Right Thumb):\033[0m"
  echo "  \033[38;5;136mBT:\033[0m         1-5=device  §=clear"
  echo "  \033[38;5;136mOther:\033[0m      +/?=\033[38;5;33m~\033[0m  '=\033[38;5;33mDEL\033[0m  X=\033[38;5;33mCUT\033[0m  C=\033[38;5;33mCOPY\033[0m  V=\033[38;5;33mPASTE\033[0m"
  echo ""
  echo "\033[1;38;5;64mADJUST Layer (LOWER+RAISE):\033[0m"
  echo "  \033[38;5;136mBluetooth:\033[0m  1-5 = Select device, § = Clear"
  echo "  \033[38;5;136mRGB:\033[0m        Z=\033[38;5;33mTOG\033[0m  X=\033[38;5;33mEFF\033[0m  C=\033[38;5;33mHUE+\033[0m  V=\033[38;5;33mSAT+\033[0m  B=\033[38;5;33mBRI+\033[0m"
  echo ""
  echo "\033[1;38;5;64mSwedish Symbols (on Swedish OS):\033[0m"
  echo "  \033[38;5;136m@\033[0m = AltGr+2    \033[38;5;136m\$\033[0m = AltGr+4    \033[38;5;136m\\\033[0m = AltGr++"
  echo ""
  echo "\033[1;38;5;125m═══ Build & Flash Instructions ═══\033[0m"
  echo ""
  echo "  \033[38;5;136m1. Edit keymap:\033[0m"
  echo "     \033[38;5;33mcd ~/dotfiles/zmk-config\033[0m"
  echo "     \033[38;5;33m\$EDITOR config/sofle_choc_pro.keymap\033[0m"
  echo ""
  echo "  \033[38;5;136m2. Commit & push:\033[0m"
  echo "     \033[38;5;33mgit add -A && git commit -m \"feat: description\" && git push\033[0m"
  echo ""
  echo "  \033[38;5;136m3. Trigger build:\033[0m"
  echo "     \033[38;5;33mgh workflow run \"Build ZMK firmware\" --repo LinusOstlund/zmk-config\033[0m"
  echo ""
  echo "  \033[38;5;136m4. Watch build:\033[0m"
  echo "     \033[38;5;33mgh run list --repo LinusOstlund/zmk-config --limit 1\033[0m"
  echo "     \033[38;5;33mgh run watch <run-id> --repo LinusOstlund/zmk-config\033[0m"
  echo ""
  echo "  \033[38;5;136m5. Download firmware:\033[0m"
  echo "     \033[38;5;33mgh run download <run-id> --repo LinusOstlund/zmk-config --dir firmware\033[0m"
  echo ""
  echo "  \033[38;5;136m6. Flash (double-tap reset on both halves first):\033[0m"
  echo "     \033[38;5;33mcp firmware/firmware/*left*.uf2 /Volumes/KEEBART/\033[0m"
  echo "     \033[38;5;33mcp firmware/firmware/*right*.uf2 /Volumes/KEEBART\\ 1/\033[0m"
  echo ""
  echo "\033[38;5;240mRepo: https://github.com/LinusOstlund/zmk-config\033[0m"
  echo "\033[38;5;240mOS: Swedish keyboard layout required\033[0m"
}
