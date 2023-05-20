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
	"nvim-tree/nvim-web-devicons",
	-- ColorScheme
	"lukas-reineke/indent-blankline.nvim",
	"akinsho/bufferline.nvim",
	"tjdevries/colorbuddy.nvim",
	"nvim-lualine/lualine.nvim",

	--	-- colorscheme
	"sainnhe/everforest",
	"ajmwagar/vim-deus",
	"connorholyday/vim-snazzy",
	"tomasr/molokai",
	"folke/tokyonight.nvim",
	"ghifarit53/tokyonight-vim",
	"Mofiqul/dracula.nvim",
	"altercation/vim-colors-solarized",
	"KeitaNakamura/neodark.vim",
	"morhetz/gruvbox",
	"ellisonleao/gruvbox.nvim",
	"sainnhe/sonokai",
	"ray-x/aurora",
	"joshdick/onedark.vim",
	"Everblush/everblush.vim",
	"rebelot/kanagawa.nvim",
	"titanzero/zephyrium",
	"daschw/leaf.nvim",
	"Mofiqul/adwaita.nvim",
	"glepnir/zephyr-nvim",
	"shaunsingh/nord.nvim",
	"savq/melange",
	--  "shaunsingh/solarized.nvim",
	"kvrohit/substrata.nvim",
	"rafamadriz/neon",
	"Mofiqul/vscode.nvim",
	"tanvirtin/monokai.nvim",
	"owickstrom/vim-colors-paramount",
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
	"lunarvim/darkplus.nvim", --, commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" })






	"mhinz/vim-startify",  -- Start Screen



	"folke/which-key.nvim",
	"junegunn/vim-easy-align", -- easy align
	"ethanholz/nvim-lastplace", -- Go back to the position changed last time
	"tpope/vim-surround",
	"voldikss/vim-translator", -- Translator
	"stevearc/aerial.nvim",  --outline
	"folke/trouble.nvim",    --show trouble

	"numToStr/Comment.nvim", -- Comment
	"rcarriga/nvim-notify",

	--------------
	--------------
	--multimedia--
	--------------
	--------------
	--"voldikss/vim-floaterm", -- to run mpv
	--use({ "ashisha/image.vim" })

	"lambdalisue/suda.vim", -- read or write files with sudo command
	{
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
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"lervag/vimtex",
	"vim-scripts/wildfire.vim",


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
	"tamago324/cmp-zsh",
	"Shougo/deol.nvim", --zsh搭配使用
	"kdheepak/cmp-latex-symbols",
})
