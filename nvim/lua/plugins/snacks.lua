return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
        /$$$$$$$$ /$$   /$$  /$$$$$$  /$$   /$$       /$$$$$$ /$$$$$$$$
        | $$_____/| $$  | $$ /$$__  $$| $$  /$$/      |_  $$_/|__  $$__/
        | $$      | $$  | $$| $$  \__/| $$ /$$/         | $$     | $$   
        | $$$$$   | $$  | $$| $$      | $$$$$/          | $$     | $$   
        | $$__/   | $$  | $$| $$      | $$  $$          | $$     | $$   
        | $$      | $$  | $$| $$    $$| $$\  $$         | $$     | $$   
        | $$      |  $$$$$$/|  $$$$$$/| $$ \  $$       /$$$$$$   | $$   
    |__/       \______/  \______/ |__/  \__/      |______/   |__/
        ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
				{
					section = "terminal",
					cmd = "pokeget 0 --hide-name; sleep .1",
					random = 10,
					pane = 2,
					indent = 4,
					height = 30,
				},
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
