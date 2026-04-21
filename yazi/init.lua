require("full-border"):setup()

-- git.yazi theme overrides must come before require("git"):setup()
th.git = th.git or {}

-- styles
th.git.unknown = ui.Style():fg("darkgray")
th.git.modified = ui.Style():fg("yellow"):bold()
th.git.added = ui.Style():fg("green"):bold()
th.git.untracked = ui.Style():fg("cyan"):bold()
th.git.ignored = ui.Style():fg("darkgray")
th.git.deleted = ui.Style():fg("red"):bold()
th.git.updated = ui.Style():fg("blue"):bold()
th.git.clean = ui.Style():fg("darkgray")

-- signs
th.git.unknown_sign = "?"
th.git.modified_sign = "M"
th.git.added_sign = "A"
th.git.untracked_sign = "U"
th.git.ignored_sign = "I"
th.git.deleted_sign = "D"
th.git.updated_sign = "󰁔"
th.git.clean_sign = "·"

require("git"):setup({
	order = 1500,
})

local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")

require("yatline"):setup({
	theme = catppuccin_theme,

	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	padding = { inner = 1, outer = 1 },

	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "white",

	tab_width = 20,

	selected = { icon = "󰻭", fg = "yellow" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },

	files = { icon = "", fg = "blue" },
	filtereds = { icon = "", fg = "magenta" },

	total = { icon = "󰮍", fg = "yellow" },
	success = { icon = "", fg = "green" },
	failed = { icon = "", fg = "red" },

	show_background = true,

	display_header_line = true,
	display_status_line = true,

	component_positions = { "header", "tab", "status" },

	header_line = {
		left = {
			section_a = {
				{ type = "line", name = "tabs" },
			},
			section_b = {
				{ type = "coloreds", custom = false, name = "githead" },
			},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", name = "date", params = { "%A, %d %B %Y" } },
			},
			section_b = {
				{ type = "string", name = "date", params = { "%X" } },
			},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", name = "tab_mode" },
			},
			section_b = {
				{ type = "string", name = "hovered_size" },
			},
			section_c = {
				{ type = "string", name = "hovered_path" },
				{ type = "coloreds", name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", name = "cursor_position" },
			},
			section_b = {
				{ type = "string", name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", name = "permissions" },
			},
		},
	},
})

require("yatline-githead"):setup({
	order = {
		"branch",
		"remote",
		"behind_ahead_remote",
		"stashes",
		"state",
		"staged",
		"unstaged",
		"untracked",
	},

	show_numbers = true,

	show_branch = true,
	branch_prefix = "",
	branch_color = "blue",
	branch_symbol = " ",
	branch_borders = "",

	show_remote_branch = true,
	always_show_remote_branch = false,
	always_show_remote_repo = false,
	remote_branch_prefix = " → ",
	remote_branch_color = "bright magenta",

	show_tag = false,
	always_show_tag = false,
	tag_color = "magenta",
	tag_symbol = "# ",

	show_commit = false,
	always_show_commit = false,
	commit_color = "bright magenta",
	commit_symbol = "@ ",

	show_behind_ahead_remote = true,
	behind_remote_color = "bright magenta",
	behind_remote_symbol = "⇣",
	ahead_remote_color = "bright magenta",
	ahead_remote_symbol = "⇡",

	show_stashes = true,
	stashes_color = "bright magenta",
	stashes_symbol = "󰞋 ",

	show_state = true,
	show_state_prefix = true,
	state_color = "red",
	state_symbol = "~ ",

	show_staged = true,
	staged_color = "bright yellow",
	staged_symbol = "+",

	show_unstaged = true,
	unstaged_color = "bright yellow",
	unstaged_symbol = "!",

	show_untracked = true,
	untracked_color = "blue",
	untracked_symbol = "?",
})
