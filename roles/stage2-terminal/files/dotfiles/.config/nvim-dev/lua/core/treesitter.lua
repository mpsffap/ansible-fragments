return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			if vim.fn.executable("tree-sitter") == 0 then
				vim.notify(
					"tree-sitter-cli not found. Install with: cargo install tree-sitter-cli",
					vim.log.levels.WARN
				)
				return
			end
			vim.cmd(":TSUpdate")
		end,
		opts = {
			ensure_installed = { "python", "lua", "jsonc" },
			auto_install = true,
			highlight = { enable = true },
		},
	},
}
