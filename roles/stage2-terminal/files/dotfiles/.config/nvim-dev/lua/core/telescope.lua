return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>T", "<cmd>Telescope<CR>", desc = "[Telescope] telescope" },
		{ "<leader>tk", "<cmd>Telescope keymaps<CR>", desc = "[Telescope] telescope keymaps" },
		{ "<leader>th", "<cmd>Telescope help_tags<CR>", desc = "[Telescope] telescope help" },
		{ "<leader>tb", "<cmd>Telescope buffers<CR>", desc = "[Telescope] telescope buffers" },
		{ "<leader>tr", "<cmd>Telescope registers<CR>", desc = "[Telescope] telescope registers" },
		{ "<leader>tj", "<cmd>Telescope jumplist<CR>", desc = "[Telescope] telescope jumplist" },
		{ "<leader>td", "<cmd>Telescope diagnostics<CR>", desc = "[Telescope] telescope diagnostics" },
		{ "<leader>tc", "<cmd>Telescope colorscheme<CR>", desc = "[Telescope] telescope colorschemes" },
		{ "<leader>tgf", "<cmd>Telescope git_files<CR>", desc = "[Telescope] telescope git files" },
		{ "<leader>tof", "<cmd>Telescope oldfiles<CR>", desc = "[Telescope] telescope old files" },
		{ "<leader>tff", "<cmd>Telescope find_files<CR>", desc = "[Telescope] telescope find files" },
		{ "<leader>tfz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "[Telescope] telescope fuzzy" },
		{ "<leader>tgs", "<cmd>Telescope grep_string<CR>", desc = "[Telescope] telescope grep string" },
		{ "<leader>tgl", "<cmd>Telescope live_grep<CR>", desc = "[Telescope] telescope grep live" },
		{ "<leader>/", "<cmd>Telescope buffers<CR>", desc = "[Telescope] telescope buffers" },
		{ "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "[Telescope] telescope fuzzy buffer" },
		{ "<leader><leader>", "<cmd>Telescope oldfiles<CR>", desc = "[Telescope] telescope recent files" },
		{
			"<leader>tcs/",
			function()
				require("core.telescope-custom").find_files_slash()
			end,
			desc = "[Telescope] search /",
		},
		{
			"<leader>tcso",
			function()
				require("core.telescope-custom").find_files_root()
			end,
			desc = "[Telescope] search root",
		},
		{
			"<leader>tcsh",
			function()
				require("core.telescope-custom").find_files_home()
			end,
			desc = "[Telescope] search home",
		},
		{
			"<leader>tcse",
			function()
				require("core.telescope-custom").find_files_etc()
			end,
			desc = "[Telescope] search etc",
		},
		{
			"<leader>tcsv",
			function()
				require("core.telescope-custom").find_files_var()
			end,
			desc = "[Telescope] search var",
		},
		{
			"<leader>tcsl",
			function()
				require("core.telescope-custom").find_files_log()
			end,
			desc = "[Telescope] search log",
		},
		{
			"<leader>tcsm",
			function()
				require("core.telescope-custom").find_files_mps()
			end,
			desc = "[Telescope] search mps",
		},
		{
			"<leader>tcsr",
			function()
				require("core.telescope-custom").find_files_repo()
			end,
			desc = "[Telescope] search repo",
		},
		{
			"<leader>tcss",
			function()
				require("core.telescope-custom").find_files_scratch()
			end,
			desc = "[Telescope] search scratch",
		},
		{ "glr", "<cmd>Telescope lsp_references<CR>", desc = "[LSP] lsp references" },
		{ "gld", "<cmd>Telescope lsp_definitions<CR>", desc = "[LSP] lsp definitions" },
		{ "glt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "[LSP] lsp type definitions" },
		{ "glsd", "<cmd>Telescope lsp_document_symbols<CR>", desc = "[LSP] lsp document symbols" },
		{ "glsw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "[LSP] lsp workspace symbols" },
		{ "glg", "<cmd>Telescope diagnostics<CR>", desc = "[LSP] lsp diagnostics" },
		{ "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "[LSP] lsp definitions (alt)" },
		{ "gr", "<cmd>Telescope lsp_references<CR>", desc = "[LSP] lsp references (alt)", nowait = true },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = { "smart" },
				layout_config = {
					prompt_position = "bottom",
				},
				selection_caret = "  ",
				winblend = 10,
				border = true,
			},
		})
		pcall(require("telescope").load_extension, "fzf")

		-- Clean up old gr* prefix mappings that conflict with gr
		for _, lhs in ipairs({ "grr", "gra", "gri", "grn", "grt", "grx" }) do
			pcall(vim.api.nvim_del_keymap, "n", lhs)
		end
	end,
}
