return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			indicator = { icon = "▎", style = "underline" },
			buffer_close_icon = "󰅖",
			modified_icon = "● ",
			close_icon = " ",
			left_trunc_marker = " ",
			right_trunc_marker = " ",
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 18,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
			separator_style = "slope",
			always_show_bufferline = true,
		},
	},
}
