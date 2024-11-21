local wezterm = require("wezterm")
return {
	enable_wayland = false,
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 12.0,
	font = wezterm.font("JetBrains Mono Nerd Font"),
	macos_window_background_blur = 30,
	window_background_opacity = 0.95,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "'",
			mods = "CTRL",
			action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
