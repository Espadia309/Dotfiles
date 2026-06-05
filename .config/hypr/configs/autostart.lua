-- App on start (zen and vesktop) and awww daemon/waypaper
hl.on("hyprland.start", function()
	-- Needed stuff
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")

	--apps
	hl.exec_cmd("vesktop")
	hl.exec_cmd("zen-browser")
end)

