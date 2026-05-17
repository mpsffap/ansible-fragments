return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "powerline",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { {
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			} },
			lualine_b = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = "", warn = "", info = "", hint = "" },
				},
				{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
				{ "branch" },
			},
			lualine_c = {
				{
					"filename",
					path = 3,
					symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]", newfile = "[New]" },
				},
			},
			lualine_x = {
				{ "encoding" },
				{ "fileformat", symbols = { unix = "", dos = "", mac = "" } },
				{ "filetype", icon = { align = "right" } },
				{ "searchcount", maxcount = 999, timeout = 500 },
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
