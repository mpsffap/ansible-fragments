local opt = vim.opt

-- Disable built-in plugins (we use alternatives)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logipat = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Display
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.showtabline = 2
opt.pumheight = 10
opt.fillchars = { eob = " " }
opt.list = true

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	command = "colorscheme tokyonight",
})

-- Editor behavior
opt.breakindent = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "1"

-- Files
opt.swapfile = false
opt.undofile = true
pcall(vim.fn.mkdir, vim.fn.expand("$HOME/.config/nvim-undodir"), "p")
opt.undodir = vim.fn.expand("$HOME/.config/nvim-undodir")
opt.backup = false
opt.writebackup = false
opt.autochdir = false

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Grep
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Spell
opt.spelllang = { "de", "en" }

-- Timing
opt.timeout = true
opt.timeoutlen = 1000

-- System clipboard
opt.clipboard = "unnamedplus"
