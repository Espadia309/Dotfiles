-- DESKTOP PC (also the fallback for unknown hostnames)
hypridle_conf = "~/.config/hypr/hypridle.conf"

-- The one and only FIRST MONITOOOOOOOOR
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@240",
	position = "0x0",
	scale = 1,
})
-- Second Monitor
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@144",
	position = "1920x0",
	scale = 1,
})

-- locks certain workspaces on certain monitors
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1" })
