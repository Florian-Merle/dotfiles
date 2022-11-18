#! /bin/zsh

# Note that xclip does not work when this script is invoked through a gnome-terminal process

# todo: cleanup this a bit
EMOJI_FILE=$(dirname $0)/emojis

EMOJI=$(cat $EMOJI_FILE | fzf --layout=reverse --no-info --header='Emoji Picker 🚀

' --header-first  --margin=1,2,1,2 --cycle | awk '{ print $1 }')

if [ -z "$EMOJI" ]
then
  exit 0
fi

echo $EMOJI | tr -d \\n | xsel --input --clipboard

exit 0
