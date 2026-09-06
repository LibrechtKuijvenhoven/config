#!/usr/bin/env sh


options="Performance\nBalanced\nPowerSaver\n"
MAX_LEN=$(echo "$networks" | wc -L)
WIDTH=$((MAX_LEN + 4))
theme="window { width: ${WIDTH}ch; }"
chosen=$(echo -e "$options" | rofi -dmenu -i -p 'Select a Power profile' -theme-str "$theme" -dynamic -no-fixed-num-lines)

[ -z "$chosen" ] && exit 0

case "$chosen" in
  "Performance") next=performance ;;
  "Balanced") next=balanced ;;
  "PowerSaver") next=power-saver ;;
esac
powerprofilesctl set "$next"
notify-send "Power profile" "$next"
