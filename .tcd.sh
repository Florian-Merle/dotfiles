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
tmux split-window -v -p 25 'git logor'
tmux split-window -h -p 35 'git brr'
tmux split-window -h -p 50 '~/dotfiles/scripts/git-status-watch.sh'

# Finaly, attach to the session
tmux attach-session -d -t $basename -c $path
