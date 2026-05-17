return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "[Neo-tree] toggle explorer",
		},
	},
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		filesystem = {
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		window = {
			position = "left",
			width = 30,
		},
		default_component_configs = {
			indent = { with_markers = true },
		},
	},
}
