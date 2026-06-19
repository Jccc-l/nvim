-- $HOME/.config/nvim/lua/plugins/init.lua
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-cmdline" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
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
