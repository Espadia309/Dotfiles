local function is_plugin_loaded(name)
	for _, v in pairs(hl.get_loaded_plugins()) do
		if v.name == name then
			return true
		end
	end
	return false
end

if is_plugin_loaded("imgborders") then
	hl.config({
		general = { border_size = 0 },
		decoration = { rounding = 0, shadow = { enabled = false } },
		plugin = {
			imgborders = {
				image = "~/.config/hypr/images/assets/frame_final.png",
				sizes = { top = 10, right = 10, bottom = 12, left = 8 },
				insets = 2,
				scale = 2,
				smooth = false,
				blur = false,
			},
		},
	})
end
