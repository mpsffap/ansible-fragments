local leader = "SPC"

return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠋⠉⠉⠻⢦⣄⠀⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠾⠉⠉⠉⠛⢷⣄⠀⠀⠀⠀⠈⡻⣆⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠶⠞⠛⠻⣧⡀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⣀⣀⣹⢹⡇⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⣀⣠⠞⠋⠀⠀⠀⠀⠀⠈⢻⠀⠀⢈⣩⣤⣼⣧⡤⠶⠛⠉⠉⠙⠻⣥⡀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⣠⢞⡿⠿⠗⠶⣦⠀⠀⠀⢀⣴⠆⢸⠇⣾⣏⠉⠉⠹⠏⢳⠳⠄⠀⠀⠀⢸⠜⣇⠀⠀⠀⠀                  ",
			"                  ⠀⠀⣾⢃⠀⠀⠀⠀⠀⢸⡄⠀⠀⠻⠋⠀⢸⡀⢿⡈⠳⠤⠤⠴⠚⠀⠀⠀⠀⢀⡾⠀⢻⠀⠀⠀⠀                  ",
			"                  ⠀⢠⣯⡸⡄⠀⠀⠀⠀⠀⣷⡀⠀⠀⠀⠀⣿⡇⠈⠳⣦⣄⡀⠀⠀⠀⠀⠀⣠⡾⣡⠀⠸⣇⠀⠀⠀                  ",
			"                  ⠀⣿⣃⠻⣧⠀⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⢸⡇⠀⠀⠀⢸⠇⠀⢀⣿⣿⣉⣁⣴⠞⠃⠀⠀⠹⣧⠀                  ",
			"                  ⠀⣿⡌⠙⢻⣧⠀⠀⠀⠀⣠⣽⠀⠀⠀⠀⢸⡇⠀⠀⠀⢸⡇⠀⢸⣿⣿⣉⣁⣴⠞⠃⠀⠀⢹⣧⠀                  ",
			"                  ⠀⢹⡷⢀⠀⠻⣷⣀⣰⠯⣽⡏⠀⣀⣴⢶⣾⡷⠚⠋⢻⣾⠿⠿⠛⠻⠦⣄⡀⠀⠀⠀⢀⠔⢸⣿⠀                  ",
			"                  ⠀⢸⡇⣼⡄⠀⠙⠿⠷⠿⠿⣷⣿⣤⣤⣴⣿⣧⣄⣤⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠀⣾⡏⠀                  ",
			"                  ⠀⠘⣿⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠏⣿⡏⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡟⠀⠀                  ",
			"                  ⠀⠀⠹⣧⣇⠀⠀⠀⠀⠀⠀⠀⠀⡜⠁⠀⢯⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡜⢡⣿⠏⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⢻⡞⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣄⠀⠀⠀⠀⠀⠀⠀⢀⡴⠃⣰⣿⠋⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⢿⡜⢦⡀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠘⢮⡢⣄⠀⠀⠀⠀⣰⢏⣀⣾⡟⠁⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠸⣧⠈⣇⠀⠀⠀⠀⠀⠉⠙⠒⠢⠤⣄⡙⠢⣼⠲⠤⣾⠇⢠⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⢻⣆⡈⠣⠤⠴⠶⠒⠒⠒⠒⠲⠶⠤⣄⣀⣀⣀⣤⠖⢲⣼⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⠘⣿⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠒⠒⠒⠂⠛⢚⠛⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀                  ",
			"                  ⠀⠀⠀⠀⠀⠀⠸⣧⢱⡀⠀⠀⠐⠲⣄⠀⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀⠘⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀                  ",
		}

		local if_nil = vim.F.if_nil
		dashboard.button = function(sc, txt, keybind, keybind_opts)
			local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 5,
				width = 73,
				align_shortcut = "right",
				hl_shortcut = "Keyword",
			}
			if keybind then
				keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_, keybind, keybind_opts }
			end
			local function on_press()
				local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end
			return { type = "button", val = txt, on_press = on_press, opts = opts }
		end

		dashboard.section.buttons.val = {
			dashboard.button("n", "  >                         New file", ":ene <BAR> startinsert <CR>", {}),
			dashboard.button("r", "  >                         Recent", ":Telescope oldfiles<CR>", {}),
			dashboard.button("t", "  >                         Terminal", ":ToggleTerm<CR>", {}),
			dashboard.button("l", "😴 >                         Lazy", ":Lazy! sync<CR>", {}),
			dashboard.button("m", "󱌣  >                         Mason", ":Mason<CR>", {}),
			dashboard.button("q", "󰩈  >                         Quit", ":qa<CR>", {}),
		}
		dashboard.section.buttons.opts = { spacing = 0 }

		local section = {
			header = dashboard.section.header,
			hi_top_section = {
				type = "text",
				val = "┌───────────────────────────────────────────────────────────────────────┐",
				opts = { position = "center", hl = "Type" },
			},
			hi_middle_section = {
				type = "text",
				val = " ",
				opts = { position = "center", hl = "Label" },
			},
			buttons = dashboard.section.buttons,
			footer = {
				type = "text",
				val = "└───────────────────────────────────────────────────────────────────────┘",
				opts = { position = "center", hl = "Type" },
			},
		}

		alpha.setup({
			layout = {
				{ type = "padding", val = 0 },
				section.header,
				{ type = "padding", val = 1 },
				section.hi_top_section,
				section.hi_middle_section,
				{ type = "padding", val = 0 },
				section.buttons,
				{ type = "padding", val = 0 },
				section.footer,
			},
			opts = { margin = 0 },
		})

		vim.api.nvim_create_augroup("alpha_tabline", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = "alpha_tabline",
			pattern = "alpha",
			callback = function()
				vim.opt.showtabline = 0
				vim.opt.laststatus = 0
				vim.opt.ruler = false
				vim.api.nvim_create_autocmd("BufUnload", {
					group = "alpha_tabline",
					buffer = 0,
					callback = function()
						vim.opt.showtabline = 2
						vim.opt.ruler = true
						vim.opt.laststatus = 3
					end,
				})
			end,
		})
	end,
}
