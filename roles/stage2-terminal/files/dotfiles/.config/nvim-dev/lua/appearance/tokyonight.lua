return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("helpers.themes").setColorScheme("tokyonight")
	end,
}
