vim.keymap.set("n", "=", "<cmd>ColorizerToggle<CR>", { desc = "Attach colorizer to buffer" })
vim.keymap.set(
	"n",
	"<leader>rh",
	"<cmd>write | edit | TSBufEnable highlight<CR>",
	{ desc = "Restore highlight if not working fine." }
)
