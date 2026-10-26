#!/usr/bin/env bash
# Event-driven: playerctl --follow prints a line on every change, so the bar
# updates instantly. Use this WITHOUT "interval" in the waybar module.

SEP='‖'
empty='{"text": "", "class": "", "alt": ""}'

esc() {
  local s=${1//\\/\\\\}
  s=${s//\"/\\\"}
  printf '%s' "$s"
}

while true; do
  echo "$empty"
  playerctl --follow metadata --format "{{status}}${SEP}{{artist}}${SEP}{{title}}" 2>/dev/null |
    while IFS= read -r line; do
      status=${line%%"$SEP"*}
      rest=${line#*"$SEP"}
      artist=${rest%%"$SEP"*}
      title=${rest#*"$SEP"}

      if [ -z "$status" ] || { [ -z "$artist" ] && [ -z "$title" ]; }; then
        echo "$empty"
        continue
      fi

      if [ -n "$artist" ]; then
        text="$artist - $title"
      else
        text="$title"
      fi

      echo "{\"text\": \"$(esc "$text")\", \"class\": \"$status\", \"alt\": \"$status\"}"
    done
  # playerctl exited (no players): wait a bit and start over
  sleep 2
done
