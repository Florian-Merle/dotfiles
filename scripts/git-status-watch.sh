#! /bin/bash

# Not sure why, by if the following is defined as a git alias, cut will make it not work
# Also, not sure why, but to make it cut at the right place, we should add 8 to the number of cols
watch -t -n 0.1 --color "git -c color.status=always status --short --untracked-files=all | cut -c-$(expr $(tput cols)  + 8)"
