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
  # Colors using $'...' syntax for proper escape handling
  local g=$'\e[38;5;240m'   # Gray
  local n=$'\e[0m'          # Reset
  local o=$'\e[38;5;166m'   # Orange
  local b=$'\e[38;5;33m'    # Blue
  local y=$'\e[38;5;136m'   # Yellow
  local h=$'\e[1;38;5;64m'  # Green bold
  local t=$'\e[1;38;5;166m' # Orange bold

  cat <<EOF
${t}══════════════════════════ ZMK Sofle Choc Pro BT - Swedish Layout ══════════════════════════${n}

${h}BASE Layer:${n}  ${y}LW/NV: hold=LOWER, tap=toggle NAV${n}
${g}┌──────┬──────┬──────┬──────┬──────┬──────┐              ┌──────┬──────┬──────┬──────┬──────┬──────┐${n}
${g}│${n} ESC  ${g}│${n}  1   ${g}│${n}  2   ${g}│${n}  3   ${g}│${n}  4   ${g}│${n}  5   ${g}│              │${n}  6   ${g}│${n}  7   ${g}│${n}  8   ${g}│${n}  9   ${g}│${n}  0   ${g}│${o} BSPC ${n}${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n} TAB  ${g}│${n}  Q   ${g}│${n}  W   ${g}│${n}  E   ${g}│${n}  R   ${g}│${n}  T   ${g}│              │${n}  Y   ${g}│${n}  U   ${g}│${n}  I   ${g}│${n}  O   ${g}│${n}  P   ${g}│${b} ^/~  ${n}${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n} CAPS ${g}│${n}  A   ${g}│${n}  S   ${g}│${n}  D   ${g}│${n}  F   ${g}│${n}  G   ${g}│              │${n}  H   ${g}│${n}  J   ${g}│${n}  K   ${g}│${n}  L   ${g}│${o} +/?  ${n}${g}│${n}  '   ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n} SHFT ${g}│${n}  Z   ${g}│${n}  X   ${g}│${n}  C   ${g}│${n}  V   ${g}│${n}  B   ${g}│              │${n}  N   ${g}│${n}  M   ${g}│${y}  ,;  ${n}${g}│${y}  .:  ${n}${g}│${y}  -_  ${n}${g}│${n} SHFT ${g}│${n}
${g}└──────┴──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┴──────┘${n}
${g}              │${n} CTRL ${g}│${n} ALT  ${g}│${n} GUI  ${g}│${b}LW/NV ${n}${g}│${n} SPC  ${g}│    │${n} RET  ${g}│${b} RSE  ${n}${g}│${n} CTRL ${g}│${n} ALT  ${g}│${n} GUI  ${g}│${n}
${g}              └──────┴──────┴──────┴──────┘              └──────┴──────┴──────┴──────┴──────┘${n}

${h}LOWER Layer (Hold LW/NV):${n}  ${y}88 = double-tap${n}  ${y}hold U/O = line jump${n}
${g}┌──────┬──────┬──────┬──────┬──────┬──────┐              ┌──────┬──────┬──────┬──────┬──────┬──────┐${n}
${g}│${n}      ${g}│${y}  !   ${n}${g}│${y} "/@  ${n}${g}│${y}  #   ${n}${g}│${b}  \$   ${n}${g}│${y}  %   ${n}${g}│              │${y}  &   ${n}${g}│${b}  |   ${n}${g}│${b} [/{  ${n}${g}│${b} ]/}  ${n}${g}│${y}  ?   ${n}${g}│${o} DEL  ${n}${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${o}  ↑   ${n}${g}│${n}      ${g}│${n}      ${g}│              │${n} PGUP ${g}│${b} ←W/L ${n}${g}│${o}  ↑   ${n}${g}│${b} W/L→ ${n}${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${o}  ←   ${n}${g}│${o}  ↓   ${n}${g}│${o}  →   ${n}${g}│${n}      ${g}│              │${n} PGDN ${g}│${o}  ←   ${n}${g}│${o}  ↓   ${n}${g}│${o}  →   ${n}${g}│${b}  ´   ${n}${g}│${b}  *   ${n}${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${b}  <   ${n}${g}│${b}  >   ${n}${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${b}  \\   ${n}${g}│${n}      ${g}│${n}
${g}└──────┴──────┴──────┴──────┴──────┴──────┘              └──────┴──────┴──────┴──────┴──────┴──────┘${n}

${h}NAV Layer (Tap LW/NV):${n}  ${y}tap again or ESC to exit${n}
${g}┌──────┬──────┬──────┬──────┬──────┬──────┐              ┌──────┬──────┬──────┬──────┬──────┬──────┐${n}
${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${o} EXIT ${n}${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${o}  ↑   ${n}${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${o}  ←   ${n}${g}│${o}  ↓   ${n}${g}│${o}  →   ${n}${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}└──────┴──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┴──────┘${n}
${g}              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${o} EXIT ${n}${g}│${n}      ${g}│    │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}              └──────┴──────┴──────┴──────┘              └──────┴──────┴──────┴──────┴──────┘${n}

${h}RAISE Layer (Right Thumb):${n}
${g}┌──────┬──────┬──────┬──────┬──────┬──────┐              ┌──────┬──────┬──────┬──────┬──────┬──────┐${n}
${g}│${o}BTCLR ${n}${g}│${b} BT1  ${n}${g}│${b} BT2  ${n}${g}│${b} BT3  ${n}${g}│${b} BT4  ${n}${g}│${b} BT5  ${n}${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${o} DEL  ${n}${g}│${b}  ~   ${n}${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${n}      ${g}│${o} CUT  ${n}${g}│${o} COPY ${n}${g}│${o}PASTE ${n}${g}│${y} UNLK ${n}${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}└──────┴──────┴──────┴──────┴──────┴──────┘              └──────┴──────┴──────┴──────┴──────┴──────┘${n}

${h}ADJUST Layer (LOWER + RAISE):${n}
${g}┌──────┬──────┬──────┬──────┬──────┬──────┐              ┌──────┬──────┬──────┬──────┬──────┬──────┐${n}
${g}│${o}BTCLR ${n}${g}│${b} BT1  ${n}${g}│${b} BT2  ${n}${g}│${b} BT3  ${n}${g}│${b} BT4  ${n}${g}│${b} BT5  ${n}${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${o} EPWR ${n}${g}│${y} HUE- ${n}${g}│${y} HUE+ ${n}${g}│${y} SAT- ${n}${g}│${y} SAT+ ${n}${g}│${y} EFF  ${n}${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${y} BRI- ${n}${g}│${y} BRI+ ${n}${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}├──────┼──────┼──────┼──────┼──────┼──────┤              ├──────┼──────┼──────┼──────┼──────┼──────┤${n}
${g}│${n}      ${g}│${y} TOG  ${n}${g}│${y} EFF  ${n}${g}│${y} HUE+ ${n}${g}│${y} SAT+ ${n}${g}│${y} BRI+ ${n}${g}│              │${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}      ${g}│${n}
${g}└──────┴──────┴──────┴──────┴──────┴──────┘              └──────┴──────┴──────┴──────┴──────┴──────┘${n}

${h}Combos:${n}  ${y}å${n} = P+^   ${y}ö${n} = L++   ${y}ä${n} = ++'   ${b}Spotlight${n} = S+P

${h}Tap-Dance (125ms):${n}  ${b}^/~${n}=^/~ ${y}2${n}="/@ ${y}8${n}=[/{ ${y}9${n}=]/}

${h}Hold-Tap U/O:${n}  tap=word jump, hold=line jump

${t}═══════════════════════════════════ Build & Flash ═══════════════════════════════════════════${n}
  ${y}1.${n} Edit:    cd ~/dotfiles/zmk-config && \$EDITOR config/sofle_choc_pro.keymap
  ${y}2.${n} Push:    git add -A && git commit -m "feat: desc" && git push
  ${y}3.${n} Build:   gh workflow run "Build ZMK firmware" --repo LinusOstlund/zmk-config
  ${y}4.${n} Watch:   gh run watch \$(gh run list -R LinusOstlund/zmk-config -L1 --json databaseId -q '.[0].databaseId') -R LinusOstlund/zmk-config
  ${y}5.${n} Flash:   Double-tap reset → cp firmware/firmware/*left*.uf2 /Volumes/KEEBART/
${g}───────────────────────────────────────────────────────────────────────────────────────────────${n}
EOF
}
