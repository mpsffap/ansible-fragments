return {
	"mfussenegger/nvim-dap",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
		"Weissle/persistent-breakpoints.nvim",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{
			"<F9>",
			function()
				require("dap").continue()
			end,
			desc = "[Debug] Start/Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "[Debug] Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "[Debug] Step Into",
		},
		{ "<F12>", "<cmd>DapTerminate<CR>", desc = "[Debug] Terminate" },
		{
			"mm",
			function()
				require("persistent-breakpoints.api").toggle_breakpoint()
			end,
			desc = "[Debug] Toggle breakpoint",
		},
		{
			"<leader><F12>",
			function()
				require("dapui").toggle()
			end,
			desc = "[Debug] Toggle DAP UI",
		},
		{
			"<leader>br",
			function()
				require("dap").run_last()
			end,
			desc = "[Debug] Run last config",
		},
		{
			"<leader>bb",
			function()
				require("persistent-breakpoints.api").toggle_breakpoint()
			end,
			desc = "[Debug] Toggle breakpoint",
		},
		{
			"<leader>bc",
			function()
				require("persistent-breakpoints.api").set_conditional_breakpoint()
			end,
			desc = "[Debug] Conditional breakpoint",
		},
		{
			"<leader>bl",
			function()
				require("persistent-breakpoints.api").set_log_point()
			end,
			desc = "[Debug] Log point breakpoint",
		},
		{
			"<leader>b0",
			function()
				require("persistent-breakpoints.api").clear_all_breakpoints()
			end,
			desc = "[Debug] Clear all breakpoints",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open({}, "vsplit")
			end,
			desc = "[Debug] Open REPL",
		},
		{
			"<leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			mode = { "n", "v" },
			desc = "[Debug] Hover",
		},
		{
			"<leader>dp",
			function()
				require("dap.ui.widgets").framespreview()
			end,
			mode = { "n", "v" },
			desc = "[Debug] Frames preview",
		},
		{
			"<leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			desc = "[Debug] Frames float",
		},
		{
			"<leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
			desc = "[Debug] Scopes float",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Delay setup to ensure mason is loaded
		vim.defer_fn(function()
			local ok, mason_dap = pcall(require, "mason-nvim-dap")
			if ok then
				mason_dap.setup({
					automatic_setup = true,
					automatic_installation = true,
					handlers = {},
					ensure_installed = { "delve", "debugpy", "bash-debug-adapter" },
				})
			end
		end, 1000)

		require("dapui").setup({
			controls = {
				element = "repl",
				enabled = true,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.45 },
						{ id = "breakpoints", size = 0.1 },
						{ id = "stacks", size = 0.2 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{ id = "repl", size = 0.75 },
						{ id = "console", size = 0.25 },
					},
					position = "bottom",
					size = 10,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		})

		require("nvim-dap-virtual-text").setup({
			enabled_commands = true,
			highlight_changed_variables = true,
			show_stop_reason = true,
			commented = true,
			display_callback = function(variable, buf, stackframe, node, options)
				if options.virt_text_pos == "inline" then
					return " = " .. variable.value
				else
					return variable.name .. " = " .. variable.value
				end
			end,
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
			virt_text_win_col = 81,
		})

		local pb_utils = require("persistent-breakpoints.utils")
		local checkpoint_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints"
		local global_checkpoint_file = checkpoint_dir .. "/global.json"

		-- Upstream plugin scopes checkpoints by cwd; use a single file so
		-- breakpoints persist even when Neovim starts from different directories.
		pb_utils.get_bps_path = function()
			return global_checkpoint_file
		end

		require("persistent-breakpoints").setup({
			save_dir = checkpoint_dir,
			-- when to load the breakpoints? "BufReadPost" is recommanded.
			load_breakpoints_event = { "BufReadPost", "BufNewFile" },
			-- record performance of different function.
			-- run :lua require('persistent-breakpoints.api').print_perf_data() to see result.
			perf_record = false,
			-- perform callback when loading a persisted breakpoint
			--- @param opts DAPBreakpointOptions options used to create the breakpoint ({condition, logMessage, hitCondition})
			--- @param buf_id integer the buffer the breakpoint was set on
			--- @param line integer the line the breakpoint was set on
			on_load_breakpoint = nil,
			-- set this to true if the breakpoints are not loaded when you are using a session-like plugin.
			always_reload = true,
		})

		-- Load persisted breakpoints for the current buffer immediately.
		-- nvim-dap is lazy-loaded, so BufReadPost may have already fired.
		pcall(function()
			require("persistent-breakpoints.api").reload_breakpoints()
		end)

		-- Ensure breakpoints are saved when DAP events occur (if needed)
		vim.api.nvim_create_autocmd("User", {
			pattern = "DapBreakpointSet",
			callback = function()
				-- Try to save breakpoints when DAP sets one
				pcall(function()
					require("persistent-breakpoints.api").save_breakpoints()
				end)
			end,
		})

		-- Also save breakpoints on DapBreakpointUnset
		vim.api.nvim_create_autocmd("User", {
			pattern = "DapBreakpointUnset",
			callback = function()
				pcall(function()
					require("persistent-breakpoints.api").save_breakpoints()
				end)
			end,
		})

		-- Dynamic adapter resolution (fallback if mason-nvim-dap not available)
		local function get_mason_adapter(name)
			local path = vim.fn.stdpath("data") .. "/mason/packages/" .. name
			if vim.fn.isdirectory(path) == 0 then
				return nil
			end
			local adapter_path = path .. "/" .. name .. "-adapter"
			if vim.fn.executable(adapter_path) == 1 then
				return adapter_path
			end
			for _, file in ipairs(vim.fn.readdir(path)) do
				if file:match("%-adapter$") or file:match("adapter$") then
					local full_path = path .. "/" .. file
					if vim.fn.executable(full_path) == 1 then
						return full_path
					end
				end
			end
			return nil
		end

		-- Only set custom adapters if not already defined by mason-nvim-dap
		if not dap.adapters.python then
			local debugpy_adapter = get_mason_adapter("debugpy")
			if debugpy_adapter then
				dap.adapters.python = {
					type = "executable",
					command = debugpy_adapter,
					options = { initialize_timeout_sec = 30 },
				}
			end
		end

		dap.configurations.python = {
			{
				justMyCode = true,
				type = "python",
				request = "launch",
				name = "Launch python file",
				program = "${file}",
				console = "integratedTerminal",
			},
		}

		if not dap.adapters.bashdb then
			local bashdb_adapter = get_mason_adapter("bash-debug-adapter")
			if bashdb_adapter then
				dap.adapters.bashdb = {
					type = "executable",
					command = bashdb_adapter,
					name = "bashdb",
				}
				dap.configurations.sh = {
					{
						type = "bashdb",
						request = "launch",
						name = "Launch file",
						showDebugOutput = true,
						pathBashdb = vim.fn.stdpath("data")
							.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
						pathBashdbLib = vim.fn.stdpath("data")
							.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
						trace = true,
						file = "${file}",
						program = "${file}",
						cwd = "${workspaceFolder}",
						pathCat = "cat",
						pathBash = "/bin/bash",
						pathMkfifo = "mkfifo",
						pathPkill = "pkill",
						args = {},
						env = {},
						terminalKind = "integrated",
					},
				}
			end
		end

		-- Try to find lldb-vscode, fallback to system lldb
		local lldb_path = "/usr/bin/lldb-vscode-14"
		if vim.fn.executable(lldb_path) == 0 then
			lldb_path = "/usr/bin/lldb-vscode-13"
		end
		if vim.fn.executable(lldb_path) == 0 then
			lldb_path = "/usr/bin/lldb-vscode"
		end
		if vim.fn.executable(lldb_path) == 0 then
			lldb_path = "/usr/bin/lldb"
		end

		dap.adapters.lldb = {
			type = "executable",
			command = lldb_path,
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/file ")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		vim.api.nvim_set_hl(0, "NvimDapVirtualText", { fg = "#ff0000" })
		vim.api.nvim_set_hl(0, "DapBpLine", { fg = "#1abc9c", bg = "#233745", bold = true })
		vim.api.nvim_set_hl(0, "DapCurrentLine", { fg = "#db4b4b", bg = "#362c3d", bold = true })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBpLine", linehl = "DapBpLine", numhl = "DapBpLine" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "DapBpLine", linehl = "DapBpLine", numhl = "DapBpLine" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "", texthl = "DapBpLine", linehl = "DapBpLine", numhl = "DapBpLine" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapCurrentLine", linehl = "DapCurrentLine", numhl = "DapCurrentLine" }
		)
	end,
}
