return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	keys = {
		{ "<A-n>", mode = { "i", "s" }, desc = "[Luasnip] expand/jump next" },
		{ "<A-p>", mode = { "i", "s" }, desc = "[Luasnip] jump prev" },
	},
	config = function()
		local ls = require("luasnip")
		local fmta = require("luasnip.extras.fmt").fmta
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		vim.keymap.set({ "i", "s" }, "<A-n>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<A-p>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		ls.add_snippets("python", {
			s("print", fmta('print("<>")', { i(1) })),
		})

		ls.add_snippets("rest", {
			s("template-rest-request", {
				t({
					"# Host",
					"https://httpbin.org:443",
					"",
					"# Curl options",
					"--silent",
					"--insecure",
					"--include",
					"",
					"# Headers",
					"Accept: application/json;",
					"Connection: keep-alive",
					"Content-Type: application/json; charset=utf-8",
					"User-Agent: VRC",
					"",
					"# Query",
					"POST /anything",
					"",
					"# Body",
					"{",
					'"test" : 1234',
					"}",
				}),
			}),
		})
	end,
}
