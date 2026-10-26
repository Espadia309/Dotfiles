#!/bin/bash
CHOICE=$(printf "Wallpapers\nBrightness\nSystem" | rofi -dmenu -p "Menu")
case $CHOICE in
Wallpapers)
  wall_dir="${HOME}/.config/hypr/images/wallpapers"
  cacheDir="${HOME}/.cache/wallpaper-thumbs"
  icon_size=250
  rofi_override="element-icon{size:${icon_size}px;border-radius:0px;}"
  rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/wallSelect.rasi -theme-str ${rofi_override}"

  mkdir -p "${cacheDir}"

  # Make thumbnails (needs imagemagick)
  for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
    if [ -f "$imagen" ]; then
      nombre_archivo=$(basename "$imagen")
      if [ ! -f "${cacheDir}/${nombre_archivo}" ]; then
        magick "$imagen" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
      fi
    fi
  done

  wall_selection=$(find "${wall_dir}" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do echo -en "$A\x00icon\x1f${cacheDir}/$A\n"; done | $rofi_command)

  [[ -n "$wall_selection" ]] || exit 1
  awww img --transition-type random "${wall_dir}/${wall_selection}"
  ;;
Brightness)
  LEVEL=$(printf "10\n25\n50\n75\n100" | rofi -dmenu -p "Brightness %")
  [[ -z "$LEVEL" ]] && exit 0
  if ls /sys/class/backlight/* >/dev/null 2>&1; then
    # laptop panel
    brightnessctl set "${LEVEL}%"
  else
    # desktop monitors over DDC/CI
    ddcutil setvcp 10 "$LEVEL" --display 1
    ddcutil setvcp 10 "$LEVEL" --display 2
  fi
  ;;
System)
  ACTION=$(printf "Lock\nLogout\nReboot\nShutdown\nSuspend\nReload Hyprland" | rofi -dmenu -p "System")
  case $ACTION in
  Lock) hyprlock ;;
  Logout) hyprctl dispatch exit ;;
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
  "Reload Hyprland") hyprctl reload ;;
  esac
  ;;
esac
