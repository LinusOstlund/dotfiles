# Environment variables and PATH configurations

# Source environment setup from local bin
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# SDKMAN configuration
# Note: SDKMAN may cause [:lower:]/[:upper:] errors on some systems
# If you see those errors, comment out the lines below
# NOTE: 1) SDK-man måste laddas sist av allt pga grandios självbild
#       2) den här skiten är buggad och säger att [:lower:] och [:upper:] inte finns på vissa system
#       3) Det här löser jag en annan dag, en regning dotfilesfixardag
# export SDKMAN_DIR="$HOME/.sdkman"
# if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
#   # Suppress glob errors from SDKMAN by disabling nomatch temporarily
#   setopt localoptions no_nomatch
#   source "$HOME/.sdkman/bin/sdkman-init.sh"
# fi
