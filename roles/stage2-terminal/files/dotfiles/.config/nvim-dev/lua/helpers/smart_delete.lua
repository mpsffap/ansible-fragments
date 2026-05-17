local M = {}

function M.left()
	local col = vim.fn.col(".")
	local line = vim.fn.getline(".")
	local cur_line = vim.fn.line(".")

	if col == 1 and cur_line > 1 then
		vim.cmd("normal! k$J")
		return
	end
	if col == 1 then
		return
	end

	if line:sub(col - 1, col - 1):match("%s") then
		vim.cmd("normal! hx")
	else
		vim.cmd("normal! dB")
	end
end

function M.right()
	local col = vim.fn.col(".")
	local line = vim.fn.getline(".")
	local line_len = #line

	-- Cursor on last byte of the line → join with next line
	if col == line_len then
		vim.cmd("normal! J")
		return
	end

	local char_after = line:sub(col + 1, col + 1)
	if char_after:match("%s") then
		vim.cmd("normal! lx")
	else
		vim.cmd("normal! dW")
	end
end

return M
