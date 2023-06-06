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
	--icon
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
	},
	-- ColorScheme
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
	},
	{
		"tjdevries/colorbuddy.nvim",
		lazy = false,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
	},
	{
		"sainnhe/everforest",
		lazy = false,
	},
	{
		"ajmwagar/vim-deus",
		lazy = false,
	},
	{
		"connorholyday/vim-snazzy",
		lazy = false,
	},
	{
		"tomasr/molokai",
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
	},
	{
		"ghifarit53/tokyonight-vim",
		lazy = false,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
	},
	{
		"altercation/vim-colors-solarized",
		lazy = false,
	},
	{
		"KeitaNakamura/neodark.vim",
		lazy = false,
	},
	{
		"morhetz/gruvbox",
		lazy = false,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
	},
	{
		"sainnhe/sonokai",
		lazy = false,
	},
	{
		"ray-x/aurora",
		lazy = false,
	},
	{
		"joshdick/onedark.vim",
		lazy = false,
	},
	{
		"Everblush/everblush.vim",
		lazy = false,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
	},
	{
		"titanzero/zephyrium",
		lazy = false,
	},
	{
		"daschw/leaf.nvim",
		lazy = false,
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
	},
	{
		"glepnir/zephyr-nvim",
		lazy = false,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
	},
	{
		"savq/melange",
		lazy = false,
	},
	--  "shaunsingh/solarized.nvim",
	{
		"kvrohit/substrata.nvim",
		lazy = false,
	},
	{
		"rafamadriz/neon",
		lazy = false,
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
	},
	{
		"tanvirtin/monokai.nvim",
		lazy = false,
	},
	{
		"owickstrom/vim-colors-paramount",
		lazy = false,
	},
	{
		"projekt0n/github-nvim-theme",
		tag = "v0.0.7",
		-- or                            branch = '0.0.x'
		config = function()
			require("github-theme").setup({
				-- ...
			})
		end,
	},
	-- use({ "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" })
	{
		"lunarvim/darkplus.nvim", --, commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" })
		lazy = false,
	},

	------------------------
	------------------------
	--treesitter highlight--
	------------------------
	------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},



	"mhinz/vim-startify", -- Start Screen



	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end
	},
	"junegunn/vim-easy-align", -- easy align
	"ethanholz/nvim-lastplace", -- Go back to the position changed last time
	"tpope/vim-surround",
	"voldikss/vim-translator", -- Translator
	"stevearc/aerial.nvim",  --outline
	"folke/trouble.nvim",    --show trouble

	"numToStr/Comment.nvim", -- Comment
	"rcarriga/nvim-notify",
	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require 'colorizer'.setup()
		end
	},

	--------------
	--------------
	--multimedia--
	--------------
	--------------
	--"voldikss/vim-floaterm", -- to run mpv
	--use({ "ashisha/image.vim" })

	"lambdalisue/suda.vim", -- read or write files with sudo command
	{
		lazy = false,
		'Saverio976/music.nvim',
		cmd          = 'MusicInstall',
		dependencies = { 'voldikss/vim-floaterm' }
	},             -- play music and video in neovim

	"makerj/vim-pdf", -- make vim a pdf viewer

	---------------
	---------------
	--File Explore--
	---------------
	---------------
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup {}
		end
	},

	----------------
	----------------
	--text editing--
	----------------
	----------------
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"lervag/vimtex",
	-- Quick select
	"vim-scripts/wildfire.vim",
	"dhruvasagar/vim-table-mode",
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
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-------
	-------
	--DAP--
	-------
	-------
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	--use({ "puremourning/vimspector" })

	-------------
	-------------
	--Formatter--
	-------------
	-------------
	"mhartington/formatter.nvim",

	-------
	-------
	--CMP--
	-------
	-------
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"tamago324/cmp-zsh",
	"Shougo/deol.nvim", --zsh搭配使用
	"kdheepak/cmp-latex-symbols",
})
