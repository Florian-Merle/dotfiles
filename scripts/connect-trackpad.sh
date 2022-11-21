#! /bin/bash

DEVICE_NAME="Apple Inc. Magic Trackpad 2"
PROPERTY_NAME="libinput Click Method Enabled ("

DEVICE_IDS=$(xinput list --id-only "$DEVICE_NAME")

for DEVICE_ID in $DEVICE_IDS
do
  PROPERTY_IDS=$(xinput list-props $DEVICE_ID | grep "$PROPERTY_NAME" | sed 's/.*(\(.*\)).*/\1/')

  for PROPERTY_ID in $PROPERTY_IDS
  do
    xinput set-prop $DEVICE_ID $PROPERTY_ID 0, 1
  done
done

notify-send -t 10000 "$DEVICE_NAME connected"
