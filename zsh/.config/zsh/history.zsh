# Better History configuration
# Inspired by https://github.com/hamvocke/dotfiles

setopt SHARE_HISTORY        # share history between all sessions
setopt HIST_IGNORE_SPACE    # don't record commands that start with a space
setopt INC_APPEND_HISTORY   # write to $HISTFILE immediately, not just when exiting the shell
setopt HIST_IGNORE_ALL_DUPS # remove old duplicates from history
setopt HIST_VERIFY          # don't execute immediately when picking from history
HISTSIZE=50000              # store more than the default 10_000 entries
SAVEHIST=$HISTSIZE          # and also store all these entries in our $HISTFILE
