return {
	{ "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Gedit" } },
	{ "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" } },
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "[Git] open lazygit" },
			{ "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", desc = "[Git] lazygit current file" },
		},
		opts = {
			config = function()
				require("telescope").load_extension("lazygit")
			end,
		},
	},
}
