-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
local light_scheme = "Catppuccin Latte"
local dark_scheme = "Tokyo Night Storm (Gogh)"
local default_color_scheme = dark_scheme

wezterm.on("dark-mode", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.color_scheme = dark_scheme
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-dark-mode", function(window, pane)
	local overrides = window:get_config_overrides() or {}

	if overrides.color_scheme == light_scheme then
		overrides.color_scheme = dark_scheme
	else
		overrides.color_scheme = light_scheme
	end

	window:set_config_overrides(overrides)
end)

-- set the font size to 12.5
config.font_size = 15

-- For example, changing the color scheme:
config.color_scheme = default_color_scheme
config.keys = {
	{
		key = "F1",
		action = wezterm.action.EmitEvent("toggle-dark-mode"),
	},
	{
		key = "F2",
		action = wezterm.action.EmitEvent("dark-mode"),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- make line_height bigger
config.line_height = 1.2

-- use jet brains mono nerd font
config.font = wezterm.font("JetBrains Mono")

-- and finally, return the configuration to wezterm
return config
