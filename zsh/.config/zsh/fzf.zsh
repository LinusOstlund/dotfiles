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
