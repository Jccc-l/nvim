-- $HOME/.config/nvim/lua/plugins/mason-lspconfig.lua
require("mason-lspconfig").setup({
  automatic_enable = {
    "lua_ls",
  },
  ensure_installed = {
    "pyright",
    "lua_ls",
    "stylua",
    "jdtls",
    "vimls",
    "bashls",
    "clangd",
    "texlab",
  },
})
