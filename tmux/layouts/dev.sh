#!/bin/bash
# Tmux layout: One large pane left, three stacked panes right

SESSION_NAME="dev"

# Check if session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # Create new session in detached mode
  tmux new-session -d -s $SESSION_NAME

  # Split horizontally (left | right)
  tmux split-window -h -t $SESSION_NAME

  # Select right pane and split it vertically twice
  tmux select-pane -t 1
  tmux split-window -v -t $SESSION_NAME
  tmux split-window -v -t $SESSION_NAME

  # Optional: adjust pane sizes
  # Make left pane 60% width
  tmux select-pane -t 0
  tmux resize-pane -x 60%

  # Select the main (left) pane
  tmux select-pane -t 0
fi

# Attach to session
tmux attach -t $SESSION_NAME
