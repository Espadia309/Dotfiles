-- App on start (zen and vesktop) and awww daemon
hl.on("hyprland.start", function()
	-- Needed stuff
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("waybar")
	hl.exec_cmd("sleep 1 && awww restore")
	hl.exec_cmd("hypridle -c " .. hypridle_conf)
end)
