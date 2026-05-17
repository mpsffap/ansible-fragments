return {
	"petertriho/nvim-scrollbar",
	config = function()
		local ok, colors = pcall(function()
			return require("tokyonight.colors").setup()
		end)
		if not ok then
			require("scrollbar").setup()
			return
		end

		require("scrollbar").setup({
			handle = {
				text = " ",
				blend = 90,
				highlight = "Normal",
				hide_if_all_visible = false,
			},
			marks = {
				Cursor = { text = "", priority = 0, highlight = "Normal", color = colors.hint },
				Search = { text = { "-", "=" }, priority = 1, highlight = "Search" },
				Error = { text = { "-", "=" }, priority = 2, highlight = "DiagnosticVirtualTextError" },
				Warn = { text = { "-", "=" }, priority = 3, highlight = "DiagnosticVirtualTextWarn" },
				Info = { text = { "-", "=" }, priority = 4, highlight = "DiagnosticVirtualTextInfo" },
				Hint = { text = { "-", "=" }, priority = 5, highlight = "DiagnosticVirtualTextHint" },
				Misc = { text = { "-", "=" }, priority = 6, highlight = "Normal" },
				GitAdd = { text = "┆", priority = 7, highlight = "GitSignsAdd" },
				GitChange = { text = "┆", priority = 7, highlight = "GitSignsChange" },
				GitDelete = { text = "▁", priority = 7, highlight = "GitSignsDelete" },
			},
		})
		local ok_hlslens = pcall(require, "hlslens")
		if ok_hlslens then
			require("scrollbar.handlers.search").setup({})
		end
	end,
}
