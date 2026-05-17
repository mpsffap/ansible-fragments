return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			exclude = { "notify", "cmp_menu", "noice", "flash_prompt" },
		},
		modes = {
			char = {
				keys = { "f", "F", "t", "T", ";", "," },
				jump_labels = false,
				label = { exclude = "hjkliardc" },
				multi_line = true,
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "[Flash] flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "[Flash] Flash treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "[Flash] remote flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "[Flash] treesitter search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "[Flash] toggle flash search",
		},
	},
}
