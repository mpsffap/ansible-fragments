vim.opt.termguicolors = true
return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-highlight-colors").setup({})
	end,
}
