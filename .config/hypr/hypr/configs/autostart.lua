-- App on start (zen and vesktop) and awww daemon/waypaper
hl.on("hyprland.start", function()
	-- Needed stuff
	hl.exec_cmd("awww-daemon")
	hL.exec_cmd("sleep 1 awww restore")
	hl.exec_cmd("hypridle")
end)
