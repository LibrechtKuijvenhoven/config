#!/usr/bin/env sh

current=$(powerprofilesctl get)
case "$current" in
  performance) printf '󰓅' ;;
  balanced) printf '󰾅' ;;
  power-saver) printf '󰾆' ;;
esac
