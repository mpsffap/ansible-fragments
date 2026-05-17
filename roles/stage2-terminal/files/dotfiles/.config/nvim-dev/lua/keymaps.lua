local map = vim.keymap.set
local smart_delete = require("helpers.smart_delete")
local quickfix = require("helpers.quickfix")

-- ── [E]scape / [m]ode switching ──────────────────────────────────────
map("i", "jk", "<Esc>", { desc = "[Default] Exit insert mode" })
map("i", "<C-c>", "<Esc>", { desc = "[Default] Escape via <C-c>" })

-- ── [W]indow navigation ─────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "[Default] Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "[Default] Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "[Default] Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "[Default] Window right" })

-- ── [S]ave / [s]ource / [q]uit ──────────────────────────────────────
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "[Default] save" })
map({ "i", "v", "n", "s" }, "<A-S>", "<cmd>source %<CR><Esc>", { desc = "[Default] Source" })
map("n", "<C-q>", "<cmd>wqa<CR>", { desc = "[Default] Write all and quit" })

-- ── [S]earch clearing ───────────────────────────────────────────────
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "[Default] Clear search highlight" })
map({ "n", "x" }, "g.", "*N", { desc = "[Default] Search word under cursor" })

-- ── [N]umber / [U]I toggles ────────────────────────────────────────
map("n", "<leader>#", "<cmd>set rnu!<CR>", { desc = "[Default] Toggle relativenumber" })

-- ── Split management ─────────────────────────────────────────────────
map("n", "<leader>vs", "<cmd>split %<CR>", { desc = "[Default] vertical split" })
map("n", "<leader>vv", "<cmd>vsplit %<CR>", { desc = "[Default] vertical vsplit" })
map("n", "<A-,>", "<cmd>q<CR>", { desc = "[Default] Close window" })
map("n", "<A-.>", "<cmd>bd<CR>", { desc = "[Default] Close buffer" })

-- ── Resize splits ────────────────────────────────────────────────────
map("n", "<", ":vertical resize+5<CR>", { desc = "[Default] Wider" })
map("n", ">", ":vertical resize-5<CR>", { desc = "[Default] Narrower" })

-- ── Buffer navigation ────────────────────────────────────────────────
map("n", "<S-x>", "<cmd>bnext<CR>", { desc = "[Default] Next buffer" })
map("n", "<S-y>", "<cmd>bprevious<CR>", { desc = "[Default] Prev buffer" })

-- ── Quickfix list ────────────────────────────────────────────────────
map("n", "<A-q>", function()
	quickfix.toggle()
end, { desc = "[Default] quickfix toggle" })
map("n", "<A-n>", "<cmd>cnext<CR>", { desc = "[Default] cnext" })
map("n", "<A-N>", "<cmd>cprev<CR>", { desc = "[Default] Prev quickfix" })
map("n", "<A-l>", "<cmd>cfirst<CR>", { desc = "[Default] First quickfix" })
map("n", "<A-L>", "<cmd>clast<CR>", { desc = "[Default] Last quickfix" })

-- ── Line / selection movement ────────────────────────────────────────
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "[Default] Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "[Default] Move line up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "[Default] Move line down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "[Default] Move line up" })
map("v", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "[Default] Move selection down" })
map("v", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "[Default] Move selection up" })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "[Default] Move selection down" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "[Default] Move selection up" })

-- ── Indentation (stay selected) ──────────────────────────────────────
map("v", "<", "<gv", { desc = "[Default] Indent left (keep selection)" })
map("v", ">", ">gv", { desc = "[Default] Indent right (keep selection)" })

-- ── Blackhole registers (d/c to nirvana) ─────────────────────────────
-- Prevents deleted/changed text from overwriting named registers
map({ "n", "x" }, "d", '"_d', { silent = true, desc = "[Default] delete (blackhole)" })
map({ "n", "x" }, "D", '"_D', { silent = true, desc = "[Default] Delete line (blackhole)" })
map({ "n", "x" }, "c", '"_c', { silent = true, desc = "[Default] change (blackhole)" })
map({ "n", "x" }, "C", '"_C', { silent = true, desc = "[Default] Change line (blackhole)" })

-- ── Shell commands ───────────────────────────────────────────────────
map("n", "<leader>bss", "<cmd>15sp term://bash<CR>i", { desc = "[Default] bash split shell" })
map("n", "<leader>bs+x", "<cmd>!chmod +x %:p<CR><CR>", { desc = "[Default] bash chmod +x" })
map("n", "<leader>bs-x", "<cmd>!chmod -x %:p<CR><CR>", { desc = "[Default] bash chmod -x" })
map("n", "<leader>bsrb", "<cmd>!bash %:p<CR>", { desc = "[Default] bash run bash" })
map("n", "<leader>bsrp", "<cmd>!python3 %:p<CR>", { desc = "[Default] Run python" })
map("n", "<leader>bscp", ":!cp %:p<space>", { desc = "[Default] bash cp" })
map("n", "<leader>bsmv", ":!mv %:p", { desc = "[Default] bash mv" })

-- ── Plugin managers ──────────────────────────────────────────────────
map("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "[Default] lazy" })

-- ── Sessions ─────────────────────────────────────────────────────────
pcall(vim.fn.mkdir, vim.fn.expand("$HOME/.config/nvim-session"), "p")
map(
	"n",
	"<leader>ss",
	"<cmd>mksession! ~/.config/nvim-session/last_session.vim<CR>",
	{ desc = "[Default] save session" }
)
map(
	"n",
	"<leader>sr",
	"<cmd>source ~/.config/nvim-session/last_session.vim<CR>",
	{ desc = "[Default] session restore" }
)

-- ── Snipe (buffer picker) ────────────────────────────────────────────
map("n", "<A-s>", function()
	require("snipe").open_buffer_menu()
end, { desc = "[Default] snipe buffers" })

-- ── Neo-tree (file explorer) ─────────────────────────────────────────
map("n", "<A-e>", "<cmd>Neotree toggle<CR>", { desc = "[Default] neo-tree toggle" })
map("n", "<A-E>", "<cmd>Neotree reveal<CR>", { desc = "[Default] neo-tree find" })
-- map('n', '<leader>eb', '<cmd>BookmarksTree<CR>', { desc = '[Default] bookmarks tree — TODO' })

-- ── Smart delete (conditional Backspace / Delete) ─────────────────────
map("n", "<S-BS>", function()
	smart_delete.left()
end, { desc = "[Default] Smart delete left" })
map("i", "<S-BS>", '<C-o><cmd>lua require("helpers.smart_delete").left()<CR>', { desc = "[Default] Smart delete left" })
map("n", "<S-Del>", function()
	smart_delete.right()
end, { desc = "[Default] Smart delete right" })
map(
	"i",
	"<S-Del>",
	'<C-o><cmd>lua require("helpers.smart_delete").right()<CR>',
	{ desc = "[Default] Smart delete right" }
)

-- ── Debugging ────────────────────────────────────────────────────────
map("n", "<F9>", function()
	require("dap").continue()
end, { desc = "[Default] Start/Continue" })
map("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "[Default] Step Over" })
map("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "[Default] Step Into" })
map("n", "<F12>", "<cmd>DapTerminate<CR>", { desc = "[Default] Terminate" })
map("n", "mm", function()
	require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "[Default] Toggle breakpoint" })
map("n", "<leader><F12>", function()
	require("dapui").toggle()
end, { desc = "[Default] Toggle DAP UI" })
map("n", "<leader>br", function()
	require("dap").run_last()
end, { desc = "[Default] Run last config" })
map("n", "<leader>bb", function()
	require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "[Default] Toggle breakpoint" })
map("n", "<leader>bc", function()
	require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
end, { desc = "[Default] Conditional breakpoint" })
map("n", "<leader>bl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("[Message] > "))
end, { desc = "[Default] Log point breakpoint" })
map("n", "<leader>b0", function()
	require("persistent-breakpoints.api").clear_all_breakpoints()
end, { desc = "[Default] Clear all breakpoints" })
map("n", "<leader>dr", function()
	require("dap").repl.open({}, "vsplit")
end, { desc = "[Default] Open REPL" })
map("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "[Default] Hover" })
map("n", "<leader>dp", function()
	require("dap.ui.widgets").framespreview()
end, { desc = "[Default] Frames preview" })
map("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end, { desc = "[Default] Frames float" })
map("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "[Default] Scopes float" })
