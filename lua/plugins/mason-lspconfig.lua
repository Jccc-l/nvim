-- $HOME/.config/nvim/lua/plugins/mason-lspconfig.lua
vim.pack.add({"https://github.com/mason-org/mason-lspconfig.nvim"})

require("mason-lspconfig").setup ({
    automatic_enable = true,
    automatic_enable={
      "lua_ls",
    }
})
