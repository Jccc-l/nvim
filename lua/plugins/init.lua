-- $HOME/.config/nvim/lua/plugins/init.lua
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim", name = "mason-lspconfig" },
  { src = "https://github.com/hrsh7th/nvim-cmp", name = "nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp", name = "cmp-nvim-lsp" },
  { src = "https://github.com/L3MON4D3/LuaSnip", name = "LuaSnip" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip", name = "cmp_luasnip" },
  { src = "https://github.com/hrsh7th/cmp-buffer", name = "cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path", name = "cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-cmdline", name = "cmp-cmdline" },
  { src = "https://github.com/rafamadriz/friendly-snippets", name = "friendly-snippets" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("plugins.mason")
require("plugins.mason-lspconfig")
require("plugins.nvim-cmp")
require("plugins.cmp-nvim-lsp")
require("plugins.LuaSnip")
require("plugins.cmp_luasnip")
require("plugins.cmp-buffer")
require("plugins.cmp-path")
require("plugins.cmp-cmdline")
require("plugins.friendly-snippets")
require("plugins.catppuccin")
