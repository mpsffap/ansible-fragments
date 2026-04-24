return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"tree-sitter/tree-sitter-regex",
	},
	build = ":TSUpdate",
}
