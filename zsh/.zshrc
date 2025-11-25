# Modular Zsh configuration
# Config files are organized in ~/.config/zsh/

# Source modular config files
ZSHCONFIG="$HOME/.config/zsh"

# Load in order: paths first, then core features, then interactive tools
[ -f "$ZSHCONFIG/paths.zsh" ]      && source "$ZSHCONFIG/paths.zsh"
[ -f "$ZSHCONFIG/history.zsh" ]    && source "$ZSHCONFIG/history.zsh"
[ -f "$ZSHCONFIG/completion.zsh" ] && source "$ZSHCONFIG/completion.zsh"
[ -f "$ZSHCONFIG/aliases.zsh" ]    && source "$ZSHCONFIG/aliases.zsh"
[ -f "$ZSHCONFIG/fzf.zsh" ]        && source "$ZSHCONFIG/fzf.zsh"
[ -f "$ZSHCONFIG/plugins.zsh" ]    && source "$ZSHCONFIG/plugins.zsh"
[ -f "$ZSHCONFIG/prompt.zsh" ]     && source "$ZSHCONFIG/prompt.zsh"

# Welcome message with Solarized colors
echo ""
echo "Hello, \033[1;38;5;166m$USER!\033[0m Your \033[38;5;64m.zshrc\033[0m is loaded."
echo "I know you are paranoid, so here's the date and time:"
echo "Today we're speaking at \033[38;5;136m$(date +"%T")\033[0m on \033[1;38;5;33m$(date +"%A, %B %d, %Y")\033[0m"

