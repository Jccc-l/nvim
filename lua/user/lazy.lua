local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	-------------
	-------------
	--Apperance--
	-------------
	-------------

	{ "mhinz/vim-startify" }, -- Start Screen

	-- Icon
	{ "nvim-tree/nvim-web-devicons", lazy = false },
	-- Indent
	{ "lukas-reineke/indent-blankline.nvim", lazy = false },
	-- Buffer
	{ "akinsho/bufferline.nvim" },
	-- Bottom Line
	{ "nvim-lualine/lualine.nvim" },
	-- Show LSP progress
	{
		"linrongbin16/lsp-progress.nvim",
		event = { "VimEnter" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lsp-progress").setup()
		end,
	},

	-- Theme Maker
	{ "tjdevries/colorbuddy.nvim" },
	-- ColorScheme
	{ "Everblush/everblush.vim" },
	{ "KeitaNakamura/neodark.vim" },
	{ "Mofiqul/adwaita.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "Mofiqul/vscode.nvim" },
	{ "ajmwagar/vim-deus" },
	-- { "altercation/vim-colors-solarized" },
	{ "connorholyday/vim-snazzy" },
	{ "daschw/leaf.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "ghifarit53/tokyonight-vim" },
	{ "glepnir/zephyr-nvim" },
	{ "joshdick/onedark.vim" },
	{ "kvrohit/substrata.nvim" },
	{ "lunarvim/darkplus.nvim" },
	{ "morhetz/gruvbox" },
	{ "owickstrom/vim-colors-paramount" },
	{ "rafamadriz/neon" },
	{ "ray-x/aurora" },
	{ "rebelot/kanagawa.nvim" },
	{ "sainnhe/everforest" },
	{ "sainnhe/sonokai" },
	{ "savq/melange" },
	{ "shaunsingh/nord.nvim" },
	{ "tanvirtin/monokai.nvim" },
	{ "titanzero/zephyrium" },
	{ "tomasr/molokai" },
	{ "projekt0n/github-nvim-theme" },
	{ "shaunsingh/solarized.nvim" },
	-- use({ "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" })

	------------------------
	------------------------
	--treesitter highlight--
	------------------------
	------------------------
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	------------------------
	------------------------
	--Function enhancement--
	------------------------
	------------------------
	-- Easy Align
	{ "junegunn/vim-easy-align" },

	-- Go back to the position changed last time
	{ "ethanholz/nvim-lastplace" },

	{ "tpope/vim-surround" },

	{ "voldikss/vim-translator" }, -- Translator

	-- Show Trouble
	{ "folke/trouble.nvim" },

	-- Comment
	{ "numToStr/Comment.nvim" },

	-- Notify
	{ "rcarriga/nvim-notify" },

	-- Quick select
	{ "vim-scripts/wildfire.vim" },

	-- read or write files with sudo command
	{ "lambdalisue/suda.vim" },

	{
		"voldikss/vim-floaterm",
		--		config = function()
		--			require("pack.floaterm").setup()
		--		end,
	},

	--use({ "ashisha/image.vim" })

	{ "makerj/vim-pdf" }, -- make vim a pdf viewer

	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
	-- Color Highlight, such as #FFFFFF
	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "Saverio976/music.nvim", lazy = false, cmd = "MusicInstall" }, -- play music and video in neovim

	---------------
	---------------
	--File Explore--
	---------------
	---------------
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{ "junegunn/fzf" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	----------------
	----------------
	--text editing--
	----------------
	----------------
	{ "lervag/vimtex" },
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "dhruvasagar/vim-table-mode" },
	{
		"vimwiki/vimwiki",
		priority = 1000,
		branch = "master",
		lazy = false,
		-- dependencies = {'michal-h21/vim-zettel'},
	},

	-------
	-------
	--LSP--
	-------
	-------
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- LSP Symbols, Tags
	{ "stevearc/aerial.nvim" }, --outline
	{ "j-hui/fidget.nvim", version = "legacy" },

	-------
	-------
	--DAP--
	-------
	-------
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("~/myvenv/bin/python")
		end,
	},
	--use({ "puremourning/vimspector" })

	-------------
	-------------
	--Formatter--
	-------------
	-------------
	{ "mhartington/formatter.nvim" },

	-------
	-------
	--CMP--
	-------
	-------
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-path" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "tamago324/cmp-zsh" },
	{ "Shougo/deol.nvim" }, --zsh搭配使用
	{ "kdheepak/cmp-latex-symbols" },
})
