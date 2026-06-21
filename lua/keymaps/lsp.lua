-- $HOME/.config/nvim/lua/keymaps/lsp.lua
-- =============================================================================
-- LSP Keybindings
-- Optimized for readability and self-documentation.
-- =============================================================================

-- Base options for keymaps
-- 'noremap' prevents recursive mapping, 'silent' avoids command line noise
local opts = { noremap = true, silent = true }

-- Type Definition: Jumps to the definition of the type of the symbol
vim.keymap.set(
  "n",
  "grt",
  vim.lsp.buf.type_definition,
  vim.tbl_extend("force", opts, { desc = "LSP: Go to type definition" })
)

-- Implementation: Jumps to the implementation of the interface/symbol
vim.keymap.set(
  "n",
  "gri",
  vim.lsp.buf.implementation,
  vim.tbl_extend("force", opts, { desc = "LSP: Go to implementation" })
)

-- References: Lists all references to the symbol under cursor
vim.keymap.set("n", "grr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: Show references" }))

-- CodeLens: Runs the code lens action at the current cursor position
vim.keymap.set("n", "grx", vim.lsp.codelens.run, vim.tbl_extend("force", opts, { desc = "LSP: Run code lens" }))

-- Code Action: Displays available actions for the code at cursor (e.g., refactor, fix)
vim.keymap.set(
  { "n", "x" },
  "gra",
  vim.lsp.buf.code_action,
  vim.tbl_extend("force", opts, { desc = "LSP: Code action" })
)

-- Rename: Renames the symbol under the cursor across the project
vim.keymap.set("n", "grn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename symbol" }))

-- =============================================================================
-- Built-in Commenting (Native Neovim API)
-- Directly using the internal vim._comment module for maximum performance.
-- =============================================================================

local comment_api = require("vim._comment")

-- Toggle comment (Operator)
-- Used with motions like 'gcip' (comment paragraph) or 'gcj' (comment down)
vim.keymap.set({ "n", "x" }, "gc", function()
  return comment_api.operator()
end, { expr = true, desc = "Comment: Toggle operator" })

-- Toggle comment (Line)
-- 'gcc' acts on the current line
vim.keymap.set("n", "gcc", function()
  return comment_api.operator() .. "_"
end, { expr = true, desc = "Comment: Toggle line" })

-- Comment Textobject
-- Allows selecting comments as a block (e.g., 'dgc' to delete a comment block)
vim.keymap.set("o", "gc", function()
  comment_api.textobject()
end, { desc = "Comment: Textobject" })
