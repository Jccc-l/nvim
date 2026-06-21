-- $HOME/.config/nvim/lua/keymaps/aerial.lua
vim.keymap.set("n", "<leader>a", require("aerial").toggle, { desc = "Outline" })
