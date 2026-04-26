local K = require("mps-core.helpers")
local dap = require("dap")
local dapui = require("dapui")
local function run_config(name, filetype)
	filetype = filetype or vim.bo.filetype
	print("DAP config : " .. name)

	for _, c in ipairs(dap.configurations[filetype] or {}) do
		if c.name == name then
			dap.run(c)
			return
		end
	end

	print("DAP config not found: " .. name)
end

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set("n", "<leader><F9>", function()
	run_config("UMI-Debug", "python")
end, { desc = "Run UMI-Debug" })
K.map("n", "<F9>", dap.continue, { desc = "DAP: Start/Continue" })
K.map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
K.map("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
K.map("n", "<F12>", "<cmd>DapTerminate<CR>", { desc = "DAP: Terminate" })
K.map("n", "mm", function()
	require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
K.map("n", "<leader><F12>", dapui.toggle, { desc = "DAP: Toggle UI" })
K.map("n", "<Leader>br", dap.run_last, { desc = "DAP: Run last" })
K.map("n", "<leader>bb", function()
	require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })

-- Conditional
K.map("n", "<leader>bc", function()
	require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
end, { desc = "DAP: Set conditional Breakpoint" })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
K.map("n", "<Leader>bl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("[Message] > "))
end)
-- Clear
K.map("n", "<Leader>b0", function()
	require("persistent-breakpoints.api").clear_all_breakpoints()
end, { desc = "DAP: Delete all breakpoints" })
-- DAP control
K.map("n", "<Leader>dr", function()
	require("dap").repl.open({}, "vsplit")
end)
K.map({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
K.map({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").framespreview()
end)
K.map("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
K.map("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
