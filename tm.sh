#!/bin/bash

SESSION_NAME="quattro"

# Start a new tmux session with a named window
tmux new-session -d -s "$SESSION_NAME" -n "four_panes"

# Split the window into two vertical panes
tmux split-window -v

# Split the top pane horizontally
tmux select-pane -t 0
tmux split-window -h

# Split the bottom pane horizontally
tmux select-pane -t 2
tmux split-window -h

tmux select-pane -t 0

tmux set -g mouse on
#tmux bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe "xsel -i -p && xsel -o -p | xsel -i -b"

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
