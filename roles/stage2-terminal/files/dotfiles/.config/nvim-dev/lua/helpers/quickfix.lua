local M = {}

function M.toggle()
	for _, winid in ipairs(vim.api.nvim_list_wins()) do
		local bufnr = vim.api.nvim_win_get_buf(winid)
		if vim.api.nvim_buf_get_option(bufnr, "buftype") == "quickfix" then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end

return M
