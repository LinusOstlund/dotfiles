# Solarized Zsh Git Prompt
# Original concept from bash version by @necolas / @paulirish
# In case the starshipthingie prompt goes broke, this prompt was rälly nice.

# --- IMPORTANT FOR ZSH PROMPT SUBSTITUTION ---
setopt PROMPT_SUBST

# --- Terminal Color Support ---
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color'
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color'
fi

# --- Git Status Prompt ---
prompt_git() {
  local s="" branchName="" repoUrl=""

  # Not a git repo → exit
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Determine branch / tag / HEAD / SHA
  branchName="$(
    git symbolic-ref --quiet --short HEAD 2>/dev/null || \
    git describe --all --exact-match HEAD 2>/dev/null || \
    git rev-parse --short HEAD 2>/dev/null || \
    echo '(unknown)'
  )"

  # Chromium repo special case
  repoUrl="$(git config --get remote.origin.url)"
  if grep -q 'chromium/src.git' <<< "${repoUrl}"; then
    s+='*'
  else
    # Staged changes
    if ! git diff --quiet --ignore-submodules --cached; then
      s+='+'
    fi
    # Unstaged changes
    if ! git diff-files --quiet --ignore-submodules --; then
      s+='!'
    fi
    # Untracked files
    if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
      s+='?'
    fi
    # Stashed files
    if git rev-parse --verify refs/stash &>/dev/null; then
      s+='$'
    fi
  fi

  [[ -n "$s" ]] && s=" [$s]"

  echo "${1}${branchName}${2}${s}"
}

# --- Colors ---
if tput setaf 1 &>/dev/null; then
  tput sgr0
  bold=$(tput bold)
  reset=$(tput sgr0)
  black=$(tput setaf 0)
  blue=$(tput setaf 33)
  cyan=$(tput setaf 37)
  green=$(tput setaf 64)
  orange=$(tput setaf 166)
  purple=$(tput setaf 125)
  red=$(tput setaf 124)
  violet=$(tput setaf 61)
  white=$(tput setaf 15)
  yellow=$(tput setaf 136)
else
  bold=""
  reset="\e[0m"
  black="\e[1;30m"
  blue="\e[1;34m"
  cyan="\e[1;36m"
  green="\e[1;32m"
  orange="\e[1;33m"
  purple="\e[1;35m"
  red="\e[1;31m"
  violet="\e[1;35m"
  white="\e[1;37m"
  yellow="\e[1;33m"
fi

# --- Username Color ---
if [[ "$USER" == "root" ]]; then
  userStyle="${red}"
else
  userStyle="${orange}"
fi

# --- Host Color (SSH detection) ---
if [[ -n "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}"
else
  hostStyle="${yellow}"
fi

# --- FINAL PROMPT (PS1) ---
PROMPT="%{$bold%}
%{$userStyle%}%n%{$white%} at %{$hostStyle%}%m%{$white%} in %{$green%}%~
\$(prompt_git \"%{$white%} on %{$violet%}\" \"%{$blue%}\")
%{$white%}\$ %{$reset%}"

# --- Secondary Prompt (PS2) ---
export PS2="%{$yellow%}→ %{$reset%}"
