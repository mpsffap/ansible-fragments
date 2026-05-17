require("lazy").setup({
	spec = {
		require("core"),
		require("appearance"),
		require("navigation"),
		require("tools"),
		require("debugging"),
	},
	change_detection = { notify = false },
})