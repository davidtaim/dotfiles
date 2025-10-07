return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "auto",
		background = {
			ligth = "latte",
			dark = "mocha",
		},
		custom_highlights = function(colors)
			return {
				LineNr = { fg = colors.subtext1 },
				CursorLineNr = { fg = colors.red, style = { "bold" } },
				EndOfBuffer = { fg = colors.overlay0 },
			}
		end,
		transparent_background = true,
	},
}
