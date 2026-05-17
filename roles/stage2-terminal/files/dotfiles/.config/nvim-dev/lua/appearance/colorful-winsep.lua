return {
	"nvim-zh/colorful-winsep.nvim",
	event = { "WinLeave" },
	opts = {
		hi = { bg = "#16161E", fg = "#1F3442" },
		no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
		symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
		only_line_seq = true,
		smooth = true,
		exponential_smoothing = true,
	},
}
