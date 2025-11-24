# Environment variables and PATH configurations

# Source environment setup from local bin
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# SDKMAN configuration
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
