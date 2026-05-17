return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"debugpy",
				"bash-debug-adapter",
				"lldb",
				"delve",
				"pyright",
				"ruff",
				"lua-language-server",
			},
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "◌",
					package_uninstalled = "✗",
				},
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
}
