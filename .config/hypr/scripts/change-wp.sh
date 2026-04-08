#!/bin/bash

CHOICE=$(printf "Themes\nWallpapers\nBrightness\nSystem" | rofi -dmenu -p "Menu")

case $CHOICE in
Themes)
  #trucs
  ;;
Wallpapers)
  DIR=$HOME/.config/hypr/images/wallpapers
  WALLPAPER=$(ls "$DIR" | rofi -dmenu -p "Wallpapers")
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
;;
