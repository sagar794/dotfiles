local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.color_scheme = "iceberg-dark"
config.font = wezterm.font("Iosevka Term")
config.font_size = 17
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 10000
config.window_decorations = "RESIZE"
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

-- Leader key (Ctrl+F, then press second key within 1 second)
config.leader = { key = "f", mods = "CTRL", timeout_milliseconds = 1000 }

local act = wezterm.action
config.keys = {
	-- Pane splitting
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Pane navigation (vim-style)
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- Enter resize mode
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- Pane management
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- Tab management
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

return config
