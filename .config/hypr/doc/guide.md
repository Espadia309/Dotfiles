# Hyprland Rice Guide

`SUPER` is the main key. Keyboard layout is French AZERTY.
Close this guide with `q`. Scroll with `j` / `k` or the arrow keys.

---

## 1. Apps

| Keys | Action |
|---|---|
| `SUPER + RETURN` | Terminal (kitty) |
| `SUPER + SPACE` | App launcher (rofi) |
| `SUPER + E` | File manager (dolphin) |
| `SUPER + B` | Browser (zen) |
| `SUPER + D` | Discord (vesktop) |
| `SUPER + O` | Notes (obsidian) |
| `SUPER + T` | Neovim in kitty |
| `SUPER + W` | Rofi menu: Wallpapers / Brightness / System |
| `SUPER + P` | Lock screen (hyprlock) |
| `SUPER + F1` | This guide |

---

## 2. Windows

| Keys | Action |
|---|---|
| `SUPER + SHIFT + Q` | Close window |
| `SUPER + F` | Fullscreen |
| `SUPER + SHIFT + SPACE` | Toggle floating |
| `SUPER + H / J / K / L` | Focus left / down / up / right |
| `SUPER + SHIFT + H / J / K / L` | Move window left / down / up / right |
| `SUPER + left mouse drag` | Move floating window |
| `SUPER + right mouse drag` | Resize floating window |

---

## 3. Workspaces

Switch with `SUPER + key`. Send the focused window with `SUPER + SHIFT + key`.

| Workspace | Key | | Workspace | Key |
|---|---|---|---|---|
| 1 | `&` | | 6 | `-` |
| 2 | `é` | | 7 | `è` |
| 3 | `"` | | 8 | `_` |
| 4 | `'` | | 9 | `ç` |
| 5 | `(` | | 10 | `R` |

(These are the number-row keys of an AZERTY keyboard, without Shift.)

### Apps that open on a fixed workspace

They open there silently, so your view doesn't jump.

| App | Workspace |
|---|---|
| Zen browser | 2 |
| Steam | 3 |
| Vesktop | 5 |
| Discord | 5 |

### Workspaces per machine

| Machine | Screen | Workspaces |
|---|---|---|
| Desktop | DP-1 | 1, 2, 3, 4 |
| Desktop | HDMI-A-1 | 5, 6 |
| Laptop | eDP-1 (only screen) | all, no pinning |

The scratchpad (`special:scratchpad`) opens `foot` on the desktop and `kitty`
on the laptop. There is no keybind to toggle it yet.

---

## 4. Screenshots (hyprshot)

| Keys | Action |
|---|---|
| `SHIFT + PRINT` | Select a region |
| `SUPER + PRINT` | Whole screen |
| `SUPER + SHIFT + PRINT` | A window |

Files go to `~/Pictures` unless you changed `-o` or `HYPRSHOT_DIR`.
Add `--clipboard-only` to a command to copy instead of saving.

---

## 5. Notifications (mako)

| Keys | Action |
|---|---|
| `SUPER + N` | Dismiss the latest notification |
| `SUPER + SHIFT + N` | Dismiss all |
| `SUPER + CTRL + N` | Bring back the last dismissed |

Config: `~/.config/mako/config`. Reload with `makoctl reload`.
Test with `notify-send "Hello" "Test"`.

---

## 6. Laptop only (Framework 16)

| Keys / gesture | Action |
|---|---|
| Brightness keys | Screen brightness +5% / -5% (brightnessctl) |
| Volume keys | Volume +5% / -5% / mute (wpctl) |
| 3-finger swipe left / right | Switch workspace |
| 2-finger click | Right click |
| 3-finger click | Middle click |
| 2-finger tap | Right click |
| 3-finger tap | Middle click |

Idle behaviour (hypridle, laptop):

| After | What happens |
|---|---|
| 2.5 min | Screen dims to 10% |
| 5 min | Lock screen |
| 5.5 min | Screen off |
| 15 min | Suspend |

On the desktop there is no dimming or suspend: lock after 10 min, screen off after 15.

---

## 7. Screens

| Machine | Screen | Mode | Scale |
|---|---|---|---|
| Desktop | DP-1 | 1920x1080 @ 240 Hz | 1 |
| Desktop | HDMI-A-1 | 1920x1080 @ 144 Hz (right of DP-1) | 1 |
| Laptop | eDP-1 | 2560x1600 @ 165 Hz | 1.6 |
| Laptop | any external | preferred mode, placed to the right | 1 |

The right file is chosen from the hostname (see section 9).

---

## 8. Autostart

When Hyprland starts:

- `awww-daemon`, then `awww restore` (wallpaper)
- `hypridle` (with the config for this machine)
- `vesktop`
- `zen-browser`
- waybar and mako, if they are in `autostart.lua`

---

## 9. Where things are

```
~/.config/hypr/
├── hyprland.lua           loads everything, picks the host file from /etc/hostname
├── hyprlock.conf          lock screen
├── hypridle.conf          idle rules for the desktop
├── hypridle-laptop.conf   idle rules for the laptop
├── doc/guide.md           this file
├── scripts/menu-rofi.sh   the SUPER+W menu
└── configs/
    ├── hosts/desktop.lua      desktop screens and workspaces
    ├── hosts/framework.lua    laptop screen
    ├── key-bindings.lua       all keybinds
    ├── autostart.lua          startup programs
    ├── windows-rules.lua      app workspaces, layer rules
    ├── heart.lua              look and feel, input, touchpad, gestures
    ├── environment.lua        environment variables
    └── variables.lua          app names (terminal, browser, ...)

~/.config/waybar/   config.jsonc, modules.jsonc, style.css, scripts/
~/.config/mako/     config
```

Hostname to config: `espadiacachyos` loads the laptop file; any other hostname
loads the desktop file.

---

## 10. Everyday commands

Reload Hyprland config:
```
hyprctl reload
```

Restart the bar:
```
pkill waybar; waybar &
```

Sync dotfiles (always name the paths, never `git add .`):
```
cd ~
git add .config/hypr .config/waybar .config/mako
git commit -m "message"
git push
```

Install the usual packages (laptop and desktop):
```
sudo pacman -S --needed hyprlock hypridle hyprshot brightnessctl imagemagick \
  dolphin qt5ct kitty waybar mako libnotify playerctl pavucontrol glow
paru -S awww
```

Notes for later:
- Fish has no `<< EOF` heredocs. Use `nvim file` or type `bash` first.
- If a screenshot shows a rectangle, check the `selection` layer rule in `windows-rules.lua`.
