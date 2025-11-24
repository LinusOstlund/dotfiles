# FZF (Homebrew integration)
# This file is symlinked to ~/.fzf.zsh by GNU Stow
# It provides FZF keybindings and completions

if command -v fzf >/dev/null 2>&1; then
  # Source FZF keybindings if available
  [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

  # Source FZF completions if available
  [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# Make FZF previews nicer using bat if installed
if command -v bat >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--height=70% --preview 'bat --style=numbers --color=always {} 2>/dev/null | head -200' --bind='ctrl-/:toggle-preview'"
fi