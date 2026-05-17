return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{
			"]t",
			function()
				require("todo-comments").next({ priority = 2 })
			end,
			desc = "[Todo] next todo",
		},
		{
			"[t",
			function()
				require("todo-comments").prev({ priority = 2 })
			end,
			desc = "[Todo] prev todo",
		},
		{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "[Todo] search todos" },
	},
}
