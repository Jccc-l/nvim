-- $HOME/.config/nvim/lua/lsp/diagnostic.lua
vim.diagnostic.config({
  float = {
    show_header = true,
    border = "none",
    focusable = false,
  },
  jump = {
    wrap = true,
    float = true,
  },
  severity_sort = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    linehl = {},
    numhl = {},
    priority = 10,
  },
  underline = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity_sort = false,
  },
})
