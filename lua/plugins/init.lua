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
  { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
  { src = "https://github.com/obsidian-nvim/obsidian.nvim", name = "obsidian" },
  { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope" },
})

local function load_plugin(plugin_name)
  local ok, _ = pcall(require, plugin_name)
  if not ok then
    vim.notify("Failed to load plugin: " .. plugin_name, vim.log.levels.WARN)
  end
end

load_plugin("plugins.mason")
load_plugin("plugins.mason-lspconfig")
load_plugin("plugins.nvim-cmp")
load_plugin("plugins.cmp-nvim-lsp")
load_plugin("plugins.LuaSnip")
load_plugin("plugins.cmp_luasnip")
load_plugin("plugins.cmp-buffer")
load_plugin("plugins.cmp-path")
load_plugin("plugins.cmp-cmdline")
load_plugin("plugins.friendly-snippets")
load_plugin("plugins.catppuccin")
load_plugin("plugins.lualine")
load_plugin("plugins.obsidian")
load_plugin("plugins.plenary")
