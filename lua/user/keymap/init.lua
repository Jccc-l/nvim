keymap = vim.keymap.set
opts = { noremap = true, silent = true }
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("user.keymap.DAP")
require("user.keymap.keymap")
require("user.keymap.translator")
require("user.keymap.md-snippets")
