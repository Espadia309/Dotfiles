--  Basically the CORE of my config there is everything here (looks and feel etc)
hl.config({
	input = {
		kb_layout = "fr",
		kb_options = "grp:alt_shift_toggle",
		kb_model = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
			tap_button_map = "lmr",
		},
	},
	general = {
		gaps_in = 4,
		gaps_out = 5,
		border_size = 4,
		col = {
			active_border = "rgb(AC3332)",
			inactive_border = "rgb(52263E)",
		},
		resize_on_border = true,
		layout = dwindle,
	},
	decoration = {
		rounding = 6,
		active_opacity = 0.999,
		inactive_opacity = 0.87,
		shadow = {
			enabled = true,
			range = 25,
			render_power = 5,
			color = "rgba(172, 51, 50, 0.49)",
		},
		blur = {
			enabled = true,
			new_optimizations = true,
			size = 2,
			passes = 3,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
	master = {
		new_status = master,
	},
})
-- Curves
hl.curve("fluent_decel", { type = "bezier", points = { { 0, 0.2 }, { 0.4, 1 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeinoutsine", { type = "bezier", points = { { 0.37, 0 }, { 0.63, 1 } } })
-- Windows
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1.5, bezier = "easeinoutsine", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "easeOutCubic", style = "popin 60%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.5, bezier = "easeinoutsine", style = "slide" })
-- Fading
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "fluent_decel" })
hl.animation({ leaf = "fadeLayersIn", enabled = false })
hl.animation({ leaf = "border", enabled = false })
-- Layers
hl.animation({ leaf = "layers", enabled = true, speed = 1.5, bezier = "easeinoutsine", style = "popin" })
-- Workspaces
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	bezier = "fluent_decel",
	style = "slidefadevert 30%",
})
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "fluent_decel", style = "slidefade 10%" })
