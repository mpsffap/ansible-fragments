return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
	},
	keys = {
		{ "<C-w>z", "<cmd>WindowsMaximize<CR>", desc = "[Window] maximize" },
		{ "<C-w>_", "<cmd>WindowsEqualize<CR>", desc = "[Window] equalize" },
	},
	opts = {
		animation = { enable = false },
	},
}
