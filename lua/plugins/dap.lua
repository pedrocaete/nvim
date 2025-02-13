return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
		"nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
	},
	opts = {
		controls = {
			element = "repl",
			enabled = false,
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
					{
						id = "scopes",
						size = 0.50,
					},
					{
						id = "stacks",
						size = 0.30,
					},
					{
						id = "watches",
						size = 0.10,
					},
					{
						id = "breakpoints",
						size = 0.10,
					},
				},
				size = 40,
				position = "left", -- Can be "left" or "right"
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 10,
				position = "bottom", -- Can be "bottom" or "top"
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
	},
	config = function(_, opts)
		local dap = require("dap")
		require("dapui").setup(opts)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			-- Commented to prevent DAP UI from closing when unit tests finish
			-- require('dapui').close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			-- Commented to prevent DAP UI from closing when unit tests finish
			-- require('dapui').close()
		end

		-- Add dap configurations based on your language/adapter settings
		-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		dap.configurations.java = {
			{
				name = "Debug Launch (2GB)",
				type = "java",
				request = "launch",
				vmArgs = "" .. "-Xmx2g ",
			},
			{
				name = "Debug Attach (8000)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 8000,
			},
			{
				name = "Debug Attach (5005)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 5005,
			},
			{
				name = "My Custom Java Run Configuration",
				type = "java",
				request = "launch",
				-- You need to extend the classPath to list your dependencies.
				-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
				-- classPaths = {},

				-- If using multi-module projects, remove otherwise.
				-- projectName = "yourProjectName",

				-- javaExec = "java",
				mainClass = "replace.with.your.fully.qualified.MainClass",

				-- If using the JDK9+ module system, this needs to be extended
				-- `nvim-jdtls` would automatically populate this property
				-- modulePaths = {},
				vmArgs = "" .. "-Xmx2g ",
			},
		}

		vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
		vim.keymap.set(
			"n",
			"<leader>bc",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
		)
		vim.keymap.set(
			"n",
			"<leader>bl",
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
		)
		vim.keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
		vim.keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
		vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
		vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
		vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
		vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
		vim.keymap.set("n", "<leader>dd", function()
			require("dap").disconnect()
			require("dapui").close()
		end)
		vim.keymap.set("n", "<leader>dt", function()
			require("dap").terminate()
			require("dapui").close()
		end)
		vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
		vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
		vim.keymap.set("n", "<leader>di", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set("n", "<leader>d?", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
		vim.keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
		vim.keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
		vim.keymap.set("n", "<leader>de", function()
			require("telescope.builtin").diagnostics({ default_text = ":E:" })
		end)
	end,
}
