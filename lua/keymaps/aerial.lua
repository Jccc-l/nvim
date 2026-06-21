-- $HOME/.config/nvim/lua/keymaps/aerial.lua
-- =============================================================================
-- Aerial Keymaps
-- =============================================================================
-- Toggle: Open/Close the code outline window
vim.keymap.set("n", "<leader>a", require("aerial").toggle, { desc = "Outline", noremap = true, silent = true })
