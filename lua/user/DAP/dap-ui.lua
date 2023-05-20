local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	vim.notify("DAP UI failed")
	return
end
local status_ok, vir = pcall(require, "nvim-dap-virtual-text")
if not status_ok then
	vim.notify("nvim-dap-virtual-text failed")
	return
end
vir.setup {
	enabled = true,                  -- enable this plugin (the default)
	enabled_commands = true,         -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true,         -- show stop reason when stopped for exceptions
	commented = false,               -- prefix virtual text with comment string
	-- experimental features:
	virt_text_pos = 'eol',           -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false,              -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false,              -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil          -- position the virtual text at a fixed window column (starting from the first text column) ,
}                                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
dapui.setup
{
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
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = ""
	},
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.25
		}, {
			id = "breakpoints",
			size = 0.25
		}, {
			id = "stacks",
			size = 0.25
		}, {
			id = "watches",
			size = 0.25
		} },
		position = "left",
		size = 40
	}, {
		elements = { {
			id = "repl",
			size = 0.5
		}, {
			id = "console",
			size = 0.5
		} },
		position = "bottom",
		size = 10
	} },
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
}
