return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"hx",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "[Harpoon] harpoon adx file",
		},
		{
			"hm",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "[Harpoon] harpoon menu",
		},
		{
			"hn",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "[Harpoon] harpoon next",
		},
		{
			"hp",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "[Harpoon] harpoon prev",
		},
		{
			"11",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "[Harpoon] harpoon file 1",
		},
		{
			"22",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "[Harpoon] harpoon file 2",
		},
		{
			"33",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "[Harpoon] harpoon file 3",
		},
		{
			"44",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "[Harpoon] harpoon file 4",
		},
		{
			"55",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			desc = "[Harpoon] harpoon file 5",
		},
	},
}
