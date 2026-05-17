return {
	"stevearc/overseer.nvim",
	opts = {
		dap = false,
	},
	keys = {
		{ "<A-v>", "<Cmd>OverseerToggle<CR>", desc = "[Overseer] overseer view" },
		{ "<A-t>", "<Cmd>OverseerTaskAction<CR>", desc = "[Overseer] overseer task action" },
		{ "<A-T>", "<Cmd>OverseerQuickAction<CR>", desc = "[Overseer] overseer quick task" },
		{ "<leader>ovv", "<Cmd>OverseerToggle<CR>", desc = "[Overseer] overseer toggle" },
		{ "<leader>ovo", "<Cmd>OverseerOpen<CR>", desc = "[Overseer] overseer open" },
		{ "<leader>ovc", "<Cmd>OverseerClose<CR>", desc = "[Overseer] overseer close" },
		{ "<leader>ovr", "<Cmd>OverseerRun<CR>", desc = "[Overseer] overseer run" },
		{ "<leader>ovi", "<Cmd>OverseerInfo<CR>", desc = "[Overseer] overseer info" },
		{ "<leader>ovb", "<Cmd>OverseerBuild<CR>", desc = "[Overseer] overseer build" },
		{ "<leader>ovl", "<Cmd>OverseerLoadBundle!<CR>", desc = "[Overseer] overseer load bundle" },
		{ "<leader>ovs", "<Cmd>OverseerSaveBundle<CR>", desc = "[Overseer] overseer save bundle" },
	},
}
