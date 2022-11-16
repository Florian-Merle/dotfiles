#! /bin/zsh

# Note that neither xc nor xclip work when this script is invoked through gnome-terminal command

# Also, the emoji list comes from here https://gist.github.com/keidarcy/128141ff30a8c3f9ddc0d6c3ecb5b334
# but I have removed some from the list because they were missing from my system

# todo: cleanup this a bit
emoji=$(cat /home/florian/dotfiles/scripts/emojis | fzf --layout=reverse --no-info --header='Emoji Picker 🚀

' --header-first  --margin=1,2,1,2 | awk '{ print $1 }')

if [ -z "$emoji" ]
then
  exit 0
fi

echo $emoji | xsel --input --clipboard

exit 0
