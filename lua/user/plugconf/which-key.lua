local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("which-key not found")
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>SymbolsOutline<cr>", "Outline" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- ["w"] = { "<cmd>w<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["L"] = { "<cmd>Lazy<CR>", "Lazy" },
	["T"] = { "<cmd>TroubleToggle<CR>", "Trouble" },
	["j"] = { "<cmd>bnext<CR>", "Next Buffer"},
	["k"] = { "<cmd>bprevious<CR>", "Previous Buffer"},

	f = {
		name = "Find",
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Files",
		},
	},
	-- p = {
	-- 	name = "Packer",
	-- 	c = { "<cmd>PackerCompile<cr>", "Compile" },
	-- 	i = { "<cmd>PackerInstall<cr>", "Install" },
	-- 	s = { "<cmd>PackerSync<cr>", "Sync" },
	-- 	S = { "<cmd>PackerStatus<cr>", "Status" },
	-- 	u = { "<cmd>PackerUpdate<cr>", "Update" },
	-- },

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Open changed file" },
		b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Checkout branch" },
		c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>lua require('telescope.builtin').diagnostics({bufnr=0}) <cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>lua require('telescope.builtin').diagnostics({bufnr=nil}) <cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>Format<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	s = {
		name = "Search",
		b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Checkout branch" },
		c = { "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Colorscheme" },
		g = { "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>", "Text" },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
		M = { "<cmd>lua require('telescope.builtin').man_pages()<cr>", "Man Pages" },
		n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notify" },
		r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Open Recent File" },
		R = { "<cmd>lua require('telescope.builtin').registers()<cr>", "Registers" },
		k = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "Keymaps" },
		C = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	d = {
		name = "DAP",
		b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Breakpoint" },
		u = {"<cmd>lua require('dapui').toggle()<cr>", "DAP-UI"}
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
