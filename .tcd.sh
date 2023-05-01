#!/bin/sh

# Tmux Create Dashboard

path=${1:-$(pwd)}
basename=$(basename $path)

# Check if session exist
found=$(tmux list-session -F '#{session_name}' | grep -Fx $basename)

if [ -n "$found" ]
then
	tmux attach-session -d -t $basename -c $path
	exit 0
fi

# Create session
tmux new-session -d -s $basename 

# Create panes
tmux split-window -v -p 20 'git logor'
tmux split-window -h -p 20 'git brr'

# Finaly, attach to the session in the 1st pane in the 1st window
tmux attach-session -d -t $basename:1.1 -c $path
