#!/usr/bin/env bash

player_status=$(playerctl status 2>/dev/null)

if [ -z "$player_status" ]; then
  echo '{"text": "", "class": "", "alt": ""}'
  exit 0
fi

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -n "$artist" ]; then
  text="$artist - $title"
else
  text="$title"
fi

# escape for JSON
text=$(echo "$text" | sed 's/"/\\"/g')

echo "{\"text\": \"$text\", \"class\": \"$player_status\", \"alt\": \"$player_status\"}"
