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

# Welcome message
echo "Hello, $USER! Your .zshrc is loaded."
echo "I know you are paranoid, so here's the date and time:"
echo "Today is $(date +"%A, %B %d, %Y")."
echo "Current time: $(date +"%T")."
