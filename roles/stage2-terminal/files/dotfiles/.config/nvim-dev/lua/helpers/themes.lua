local M = {}

function M.setColorScheme(name)
	local status, _ = pcall(vim.cmd, "colorscheme " .. name)
	if not status then
		print('Colorscheme "' .. name .. '" not found!')
	end
end

return M
