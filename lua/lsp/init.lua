-- $HOME/.config/nvim/lua/lsp/init.lua

local function load_lsp(lsp_name)
  local ok, _ = pcall(require, lsp_name)
  if not ok then
    vim.notify("Failed to load LSP config: " .. lsp_name, vim.log.levels.WARN)
  end
end

load_lsp("lsp.lua_ls")
load_lsp("lsp.jdtls")
load_lsp("lsp.pyright")
load_lsp("lsp.clangd")
load_lsp("lsp.bashls")
load_lsp("lsp.diagnostic")
load_lsp("lsp.bashls")
