return {
	"diepm/vim-rest-console",
	init = function()
		vim.g.vrc_response_default_content_type = "application/json"
		vim.g.vrc_output_buffer_name = "_OUTPUT.json"
		vim.g.vrc_auto_format_response_patterns = { json = "jq" }
	end,
	keys = {
		{ "<A-r>", ":call VrcQuery()<CR>", desc = "[Rest] rest query" },
	},
}
