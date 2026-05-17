return {
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = {
			keymap = {
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-y>"] = { "select_and_accept" },
				["<C-space>"] = { "show", "hide" },
				["<C-@>"] = { "show", "hide" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			snippets = { preset = "luasnip" },
		},
	},
}
