return {
	"kevinhwang91/nvim-hlslens",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		calm_down = true,
		enable_incsearch = true,
		enable_lens = true,
		lens_priority = 1,
	},
	keys = {
		{ "n", "n", desc = "[Search] next match", opt = { noremap = true } },
		{ "N", "N", desc = "[Search] prev match", opt = { noremap = true } },
		{ "*", '*<Cmd>lua require("hlslens").start()<CR>', desc = "[Search] search word" },
	},
}
