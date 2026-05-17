return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil<CR>", desc = "[Oil] oil parent directory" },
	},
	opts = {
		default_file_explorer = true,
	},
}
