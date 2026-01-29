local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.color_scheme = "iceberg-dark"
config.font = wezterm.font("Iosevka Term")
config.font_size = 17
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 10000
config.window_decorations = "RESIZE"
config.window_padding = { left = 64, right = 64, top = 64, bottom = 64 }
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }

-- Terminal pet: black cat chilling in the bottom right
config.background = {
	{
		source = { Color = "#161821" }, -- iceberg-dark background
		width = "100%",
		height = "100%",
	},
	{
		source = { File = wezterm.config_dir .. "/cat.gif" },
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		vertical_align = "Bottom",
		horizontal_align = "Right",
		width = "64px",
		height = "64px",
		hsb = { brightness = 0.5 },
	},
}

-- Leader key (Ctrl+F, then press second key within 1 second)
config.leader = { key = "f", mods = "CTRL", timeout_milliseconds = 1000 }

local act = wezterm.action

-- Mouse: select to copy, middle-click to paste
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "NONE",
		action = act.PasteFrom("PrimarySelection"),
	},
}
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
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

	-- Claude Code (opens in pane, zoomed)
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local wrapper = wezterm.config_dir .. "/claude-wrapper.sh"
			local new_pane = pane:split({ direction = "Right", args = { wrapper, "--continue" } })
			new_pane:activate()
			window:perform_action(act.SetPaneZoomState(true), new_pane)
		end),
	},
	{
		key = "C",
		mods = "LEADER|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local wrapper = wezterm.config_dir .. "/claude-wrapper.sh"
			local new_pane = pane:split({ direction = "Right", args = { wrapper } })
			new_pane:activate()
			window:perform_action(act.SetPaneZoomState(true), new_pane)
		end),
	},

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
