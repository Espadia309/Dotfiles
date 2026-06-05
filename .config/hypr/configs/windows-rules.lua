-- Locks certain apps on certain workspaces by default
hl.window_rule({ name = "ws-zen", match = { class = "zen-browser"}, workspace = "2 silent"})
hl.window_rule({ name = "ws-steam", match = { class = "steam"}, workspace = "3 silent"})
hl.window_rule({ name = "ws-vesktop", match = { class = "vesktop"}, workspace = "5 silent"})
hl.window_rule({ name = "ws-discord", match = { class = "discord"}, workspace = "5 silent"})