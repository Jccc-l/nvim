keymap = vim.keymap.set
opts = { noremap = true, silent = true }
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("user.keymap.LSP")
require("user.keymap.DAP")
require("user.keymap.floaterm")
require("user.keymap.trouble")
require("user.keymap.aerial")
require("user.keymap.keymap")
require("user.keymap.nvimtree")
require("user.keymap.telescope")
require("user.keymap.translator")
