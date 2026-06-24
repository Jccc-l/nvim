-- $HOME/.config/nvim/lua/lsp/stylua.lua
vim.lsp.config("stylua", {
  cmd = { "stylua", "--lsp" },
  filetypes = { "lua" },
  root_markers = { ".stylua.toml", "stylua.toml", ".editorconfig" },
})

vim.lsp.enable("stylua")
