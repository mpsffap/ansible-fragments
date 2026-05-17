return {
	"mikavilpas/yazi.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim", lazy = true },
	keys = {
		{ "<A-y>", "<cmd>Yazi<CR>", desc = "[Yazi] yazi file manager" },
	},
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
