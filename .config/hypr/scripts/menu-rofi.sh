#!/bin/bash
CHOICE=$(printf "Wallpapers\nBrightness\nSystem" | rofi -dmenu -p "Menu")
case $CHOICE in
Wallpapers)
  DIR=$HOME/.config/hypr/images/wallpapers

  WALLPAPER=$(
    for img in "$DIR"/*; do
      [ -e "$img" ] || continue
      name=$(basename "$img")
      echo -en "${name}\0icon\x1f${img}\n"
    done | rofi -dmenu -p "Wallpapers" -show-icons \
      -theme-str 'element-icon { size: 200px; }' \
      -theme-str 'listview { columns: 4; lines: 2; }' \
      -theme-str 'element { orientation: vertical; }'
  )

  [ -z "$WALLPAPER" ] && exit 0

  awww img --transition-type random "$DIR/$WALLPAPER"
  ;;
Brightness)
  DISPLAY=$(printf "AOC (Display 1)\nASUS (Display 2)\nBoth" | rofi -dmenu -p "Which monitor?")
  LEVEL=$(printf "10\n25\n50\n75\n100" | rofi -dmenu -p "Brightness")
  case $DISPLAY in
  "AOC (Display 1)") ddcutil setvcp 10 "$LEVEL" --display 1 ;;
  "ASUS (Display 2)") ddcutil setvcp 10 "$LEVEL" --display 2 ;;
  "Both")
    ddcutil setvcp 10 "$LEVEL" --display 1
    ddcutil setvcp 10 "$LEVEL" --display 2
    ;;
  esac
  ;;
System)
  ACTION=$(printf "Lock\nLogout\nReboot\nShutdown\nSuspend\nReload Hyprland" | rofi -dmenu -p "System")
  case $ACTION in
  Lock)
    hyprlock
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  Reboot)
    CONFIRM=$(printf "No\nYes" | rofi -dmenu -p "Reboot?")
    [ "$CONFIRM" = "Yes" ] && systemctl reboot
    ;;
  Shutdown)
    CONFIRM=$(printf "No\nYes" | rofi -dmenu -p "Shutdown?")
    [ "$CONFIRM" = "Yes" ] && systemctl poweroff
    ;;
  Suspend)
    hyprlock &
    systemctl suspend
    ;;
  "Reload Hyprland")
    hyprctl reload
    ;;
  esac
  ;;
esac
