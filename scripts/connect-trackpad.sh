#! /bin/bash

DEVICE_NAME="Apple Inc. Magic Trackpad 2"
DEVICE_IDS=$(xinput list --id-only "$DEVICE_NAME")

for ID in $DEVICE_IDS
do
  xinput set-prop $ID 345 0, 1
done

notify-send -t 10000 \
            "$DEVICE_NAME connected"
