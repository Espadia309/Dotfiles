# milk-chan mascot widget (Quickshell)

A minimal starting point for a "Milk Outside A Bag Of Milk"-style mascot:
a sprite that sits on your screen, changes pose on a timer, and swaps
based on which Hyprland workspace you're on. This is intentionally the
smallest useful piece of that whole rice — get this working first, then
grow it (dialogue box, skybox backgrounds, Spicetify theme, etc.).

## 1. Install Quickshell

Arch (AUR):
```
yay -S quickshell-git
```
NixOS: add the Quickshell flake input, or `pkgs.quickshell` if it's in
your channel — see https://quickshell.org for current instructions,
since packaging changes over time.

Other distros: check the Quickshell docs for build-from-source steps.
It needs Qt6 + QtQuick + Qt Wayland.

## 2. Where these files go

Quickshell looks for named configs under `~/.config/quickshell/<name>/`.
Copy this whole folder there and rename it, e.g.:

```
mkdir -p ~/.config/quickshell
cp -r milk-chan-quickshell ~/.config/quickshell/milk-chan
```

So you should end up with:
```
~/.config/quickshell/milk-chan/shell.qml
~/.config/quickshell/milk-chan/Mascot.qml
~/.config/quickshell/milk-chan/assets/bedroom/...
~/.config/quickshell/milk-chan/assets/kitchen/...
~/.config/quickshell/milk-chan/assets/hallway/...
~/.config/quickshell/milk-chan/assets/outside/...
```

## 3. Get sprites into `assets/`

The widget just loads PNG files — it doesn't know or care where they
came from. For an accurate Milk-chan, the usual approach (same one the
original rice's author mentions using) is to pull the sprites out of
your own legally-owned copy of "Milk inside a bag of milk inside a bag
of milk," since Ren'Py games ship their art as loose or archived image
files:

- If the game's `game/images/` folder already has loose `.png`/`.webp`
  files, you can use those directly (convert `.webp` to `.png` with
  `magick file.webp file.png` if needed).
- If assets are packed into `.rpa` archives, Ren'Py archive extractors
  (e.g. `unrpa`, installable via `pip install unrpa`) unpack a `.rpa`
  file you own into loose images you can then sort into the folders
  above.

Name each file after an emotion (`neutral.png`, `happy.png`,
`confused.png`, `sleepy.png`, `surprised.png`) inside whichever room
folder it belongs to. Keep the art at a consistent resolution per
room so she doesn't jump around in size.

If you'd rather not deal with any of that, this same code works fine
with any character art of your own — just point the folders at
whatever you've got.

## 4. Test it

```
qs -c milk-chan
```

If you see a console log like `[milk-chan] missing sprite: ...`,
that's the widget telling you which file it expected but couldn't
find — check the path against what's in `assets/`.

Kill it with Ctrl+C, or `qs ipc -c milk-chan call ...` once you build
out an IPC handler (not included yet, this starter doesn't need one).

## 5. Autostart with Hyprland

Add to `~/.config/hypr/hyprland.conf`:
```
exec-once = qs -c milk-chan
```

## 6. How it works (so you can extend it)

- `shell.qml` — entry point, just loads `Mascot.qml`.
- `Mascot.qml`:
  - `roomForWorkspace` maps a Hyprland workspace id to a folder name
    under `assets/`. Edit this object to match how you actually use
    your workspaces.
  - `Hyprland.focusedMonitor.activeWorkspace.id` (from the
    `Quickshell.Hyprland` module) is what tracks your current
    workspace live.
  - A `Timer` re-rolls `currentEmotion` every 15-30s for idle
    "animation" without needing real animation frames.
  - `PanelWindow` is Quickshell's way of drawing a layer-shell window
    (like a bar or an overlay) instead of a normal app window.
    `mask: Region {}` makes it click-through, so she doesn't block
    your desktop.

## Where to go from here

Once this feels solid, the pieces from the original rice are each
their own small addition:
- **Dialogue box**: another `PanelWindow` with a `Text` element,
  driven by a JSON file of lines keyed by room/emotion.
- **Skybox switching**: swap `hyprpaper`/`swww` wallpaper alongside
  `currentRoom` using Quickshell's `Process` type to shell out.
- **Music player**: Quickshell has an MPRIS module for hooking into
  `playerctl`-controllable players (Spotify, mpv, etc.).

Happy to help build any of those next — just ask.

## Troubleshooting

- **`onRawEvent` errors on launch**: Quickshell's Hyprland event
  signal name has shifted slightly between versions. Run
  `qs -c milk-chan` in a terminal to see the actual error, and check
  https://quickshell.org/docs/types/Quickshell.Hyprland/Hyprland/ for
  the current signal name in your installed version — swap it in if
  it differs.
- **Sprite doesn't update on workspace switch**: try calling
  `Hyprland.refreshMonitors()` more aggressively, or bind directly to
  `Hyprland.workspaces` and filter for the active one instead of
  going through `focusedMonitor`.
