return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			virt_text_delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		on_attach = function(buffer)
			local gs = require("gitsigns")
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end
			map("n", "]c", function()
				gs.next_hunk()
			end, "[Git] next hunk")
			map("n", "[c", function()
				gs.prev_hunk()
			end, "[Git] prev hunk")
			map({ "n", "v" }, "<leader>ghs", function()
				gs.stage_hunk()
			end, "[Git] stage hunk")
			map({ "n", "v" }, "<leader>ghr", function()
				gs.reset_hunk()
			end, "[Git] reset hunk")
			map("n", "<leader>ghS", function()
				gs.stage_buffer()
			end, "[Git] stage buffer")
			map("n", "<leader>ghu", function()
				gs.undo_stage_hunk()
			end, "[Git] undo stage hunk")
			map("n", "<leader>ghR", function()
				gs.reset_buffer()
			end, "[Git] reset buffer")
			map("n", "<leader>ghp", function()
				gs.preview_hunk()
			end, "[Git] preview hunk")
			map("n", "<leader>ghb", function()
				gs.blame_line({ full = true })
			end, "[Git] blame line")
			map("n", "<leader>ghd", function()
				gs.diffthis()
			end, "[Git] diff this")
			map("n", "<leader>ghD", function()
				gs.diffthis("~")
			end, "[Git] diff this ~")
			map("n", "<leader>ghw", function()
				gs.toggle_words()
			end, "[Git] toggle words")
		end,
	},
}
