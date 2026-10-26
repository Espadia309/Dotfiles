-- FRAMEWORK 16 LAPTOP (hostname: espadiacachyos)
hypridle_conf = "~/.config/hypr/hypridle-laptop.conf"

-- Internal panel. Scale 1.6 = 1600x1000 layout (try 1.25 or 2 if you prefer)
hl.monitor({
	output = "eDP-1",
	mode = "2560x1600@165",
	position = "0x0",
	scale = 1.6,
})
-- Any external monitor: auto-detect, placed to the right
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "kitty" })
