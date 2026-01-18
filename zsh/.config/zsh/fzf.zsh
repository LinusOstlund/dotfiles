# FZF configuration

# Source FZF keybindings and completions from Homebrew
if command -v fzf >/dev/null 2>&1; then
  # Source FZF keybindings (Ctrl+R for history, Ctrl+T for files, Alt+C for cd)
  [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

  # Source FZF completions
  [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# FZF default options (no preview for history search)
export FZF_DEFAULT_OPTS="--height=70%"

# FZF Ctrl+T options (file search with preview using bat)
if command -v bat >/dev/null 2>&1; then
  export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} 2>/dev/null | head -200'"
fi

# Custom FZF completion command
# cd ** [tab] uses tree preview
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

# File open function - opens file in vscode
fo() {
  local file
  file=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')
  [[ -n "$file" ]] && code "$file"
}

# File preview alias
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Source fzf-git.sh for git keybindings
# Provides: Ctrl-G Ctrl-F (files), Ctrl-G Ctrl-B (branches),
#           Ctrl-G Ctrl-H (hashes), Ctrl-G Ctrl-S (stashes), etc.
[ -f "${0:A:h}/fzf-git.sh" ] && source "${0:A:h}/fzf-git.sh"

# Claude file selector - select files, output as @filepath for Claude
# Usage: cf → opens fzf in tmux popup, multi-select with TAB, copies to clipboard
cf() {
  local files
  files=$(fd --type f --hidden --exclude .git --exclude node_modules --exclude .venv \
    | fzf --tmux 80%,60% \
          --multi \
          --preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}' \
          --preview-window 'right:50%' \
          --bind 'ctrl-/:toggle-preview')

  if [[ -n "$files" ]]; then
    local output
    output=$(echo "$files" | sed 's/^/@/')
    echo "$output"
    echo "$output" | pbcopy
  fi
}

# Claude git - select commits, output changed files as @filepath for Claude
# Usage: cg → opens fzf with recent commits, select with TAB, copies changed files to clipboard
cg() {
  local commits
  commits=$(git log --oneline --color=always -50 \
    | fzf --tmux 80%,60% \
          --ansi \
          --multi \
          --preview 'git show --stat --color=always {1}' \
          --preview-window 'right:50%')

  if [[ -n "$commits" ]]; then
    local hashes
    hashes=$(echo "$commits" | awk '{print $1}')

    local files
    files=$(echo "$hashes" | xargs -I{} git show --name-only --format="" {} | sort -u | grep -v '^$')

    local output
    output=$(echo "$files" | sed 's/^/@/')
    echo "$output"
    echo "$output" | pbcopy
  fi
}
