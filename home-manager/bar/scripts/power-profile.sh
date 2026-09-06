#!/usr/bin/env sh

current=$(powerprofilesctl get)
case "$current" in
  performance) icon='󰓅' ;;
  balanced) icon='󰾅' ;;
  power-saver) icon='󰾆' ;;
esac
printf '<span size="x-large">%s</span>' "$icon"
