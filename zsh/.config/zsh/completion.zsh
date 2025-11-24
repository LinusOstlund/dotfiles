# Zsh completion configuration

# Load completion system
zmodload zsh/complist
autoload -U compinit; compinit
_comp_options+=(globdots)   # include hidden files

# Completion behavior
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion

# Use select menu for completions
zstyle ':completion:*' menu select

# Autocomplete options when completing a '-'
zstyle ':completion:*' complete-options true

# Style group names a little nicer
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}↓ %d %f'

# Group completion results by type
zstyle ':completion:*' group-name ''
