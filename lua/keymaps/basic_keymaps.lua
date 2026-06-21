-- $HOME/.config/nvim/lua/keymaps/basic_keymaps.lua
vim.g.mapleader = " "

local opts = { silent = true }
local expr_opts = { expr = true, silent = true }

vim.keymap.set({ "n", "x" }, "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, vim.tbl_extend("force", expr_opts, { desc = "Down" }))

vim.keymap.set({ "n", "x" }, "<Down>", function()
  return vim.v.count == 0 and "gj" or "j"
end, vim.tbl_extend("force", expr_opts, { desc = "Down" }))

vim.keymap.set({ "n", "x" }, "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, vim.tbl_extend("force", expr_opts, { desc = "Up" }))

vim.keymap.set({ "n", "x" }, "<Up>", function()
  return vim.v.count == 0 and "gk" or "k"
end, vim.tbl_extend("force", expr_opts, { desc = "Up" }))

vim.keymap.set(
  { "n" },
  "<A-j>",
  "<cmd>execute 'move .+' . v:count1<cr>==",
  vim.tbl_extend("force", opts, { desc = "Move Down", silent = true })
)

vim.keymap.set(
  { "n" },
  "<A-k>",
  "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
  vim.tbl_extend("force", opts, { desc = "Move Up", silent = true })
)

vim.keymap.set({ "i" }, "<A-j>", "<esc><cmd>m .+1<cr>==gi", vim.tbl_extend("force", opts, { desc = "Move Down" }))

vim.keymap.set({ "i" }, "<A-k>", "<esc><cmd>m .-2<cr>==gi", vim.tbl_extend("force", opts, { desc = "Move Up" }))

vim.keymap.set(
  { "v" },
  "<A-k>",
  ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  vim.tbl_extend("force", opts, { desc = "Move Up", silent = true })
)

vim.keymap.set(
  { "v" },
  "<A-j>",
  ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
  vim.tbl_extend("force", opts, { desc = "Move Down", silent = true })
)

vim.keymap.set({ "n", "i" }, "<esc>", function()
  vim.cmd.nohlsearch()
  return "<Esc>"
end, vim.tbl_extend("force", expr_opts, { desc = "Disable hlsearch" }))
