#! /bin/zsh

TMP_FILE=$(dirname $0)/tmp
EMOJI_FILE=$(dirname $0)/emojis
VERSION=14.0

wget -O $TMP_FILE https://unicode.org/Public/emoji/$VERSION/emoji-test.txt

cat $TMP_FILE \
  | sed '0,/^# subgroup:.*$/d' `# remove everthing until the first line of emoji` \
  \
  | sed '/^#.*$/d' `# remove comment lines` \
  | sed '/^$/d' `# remove empty lines` \
  \
  | sed 's/.*# \(.*\)/\1/' `# remove everything until the emoji character` \
  | sed 's/^\(.\) \([A-Z0-9.]*\) \(.*\)/\1 \3/' `# keep the emoji and the description, but not the stuff in between` \
  \
  | sed '/^.[^ ]/d' `# remove lines without a space at position 2 because it is not parsed correctly (probably because it contains at least 2 emojis or some other stuff)` \
  > $EMOJI_FILE

rm $TMP_FILE
