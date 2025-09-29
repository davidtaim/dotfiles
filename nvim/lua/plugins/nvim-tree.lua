return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	keys = {
		{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" },
	},
}
