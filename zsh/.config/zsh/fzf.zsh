# FZF configuration

# Source FZF script if it exists
FZF_CONFIG=~/.fzf.sh
if [[ -x "$(command -v fzf)" ]] && [[ -f "$FZF_CONFIG" ]]; then
  source "$FZF_CONFIG"
fi

# Make FZF previews nicer using bat if installed
if command -v bat >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--height=70% --preview 'bat --style=numbers --color=always {} 2>/dev/null | head -200' --bind='ctrl-/:toggle-preview'"
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
