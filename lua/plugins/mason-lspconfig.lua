-- $HOME/.config/nvim/lua/plugins/mason-lspconfig.lua
require('mason-lspconfig').setup({
  automatic_enable = {
    'lua_ls',
  },
})
