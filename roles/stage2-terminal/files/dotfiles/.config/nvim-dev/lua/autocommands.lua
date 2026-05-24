-- Set default theme -----------------------------------------------------------
-- vim.api.nvim_create_autocmd("VimEnter", {
--   once = true,
--   command = "colorscheme tokyonight",
-- })

-- Makefile Noexpand -----------------------------------------------------------
local makegroup = vim.api.nvim_create_augroup("MakefileSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = makegroup,
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "Makefile", "make", "*.mk" },
  callback = function()
    vim.b.sleuth_automatic = false

    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
  end,
})
