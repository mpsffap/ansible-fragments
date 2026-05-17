return {
	"DeamonDev/yank-highlighter.nvim",
	event = { "TextYankPost" },
	opts = {
		highlight = {
			higroup = "Search",
			timeout = 400,
		},
		highlight_visual = {
			enabled = true,
			higroup = "Search",
			timeout = 400,
		},
	},
}
