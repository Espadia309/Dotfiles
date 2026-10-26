-- Locks certain apps on certain workspaces by default
hl.window_rule({ name = "ws-zen", match = { class = "zen-browser" }, workspace = "2 silent" })
hl.window_rule({ name = "ws-steam", match = { class = "steam" }, workspace = "3 silent" })
hl.window_rule({ name = "ws-vesktop", match = { class = "vesktop" }, workspace = "5 silent" })
hl.window_rule({ name = "ws-discord", match = { class = "discord" }, workspace = "5 silent" })
-- stops slurp's selection box from fading into screenshots
hl.layer_rule({
	name = "no-anim-selection",
	match = { namespace = "selection" },
	no_anim = true,
})
hl.layer_rule({
	name = "mako-blur",
	match = { namespace = "notifications" },
	blur = true,
	ignore_alpha = 0.3,
})
hl.window_rule({ name = "guide-float", match = { class = "guide" }, float = true, size = { 900, 650 } })
