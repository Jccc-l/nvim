-- $HOME/.config/nvim/lua/keymaps/telescope.lua
local function ivy_opts(opts)
  return require("telescope.themes").get_ivy(vim.tbl_extend("force", {
    border = true,
    layout_config = {
      height = 0.4,
      preview_width = 0.5,
    },
  }, opts or {}))
end

local function dropdown_opts(opts)
  return require("telescope.themes").get_dropdown(vim.tbl_extend("force", {
    border = true,
    layout_config = {
      width = 0.6,
      height = 0.4,
    },
  }, opts or {}))
end

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files(ivy_opts({ previewer = true }))
end, { desc = "Telescope find files" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep(ivy_opts({ previewer = true }))
end, { desc = "Telescope live grep" })

vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers(dropdown_opts({ previewer = false }))
end, { desc = "Telescope buffers" })

vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags(dropdown_opts({ previewer = true }))
end, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>fk", function()
  require("telescope.builtin").keymaps(ivy_opts())
end, { desc = "Telescope keymaps" })

vim.keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").colorscheme(ivy_opts({
    previewer = false,
    enable_preview = true,
    layout_config = { height = 0.2 },
  }))
end, { desc = "Telescope colorscheme" })

vim.keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols)
vim.keymap.set("n", "<leader>fS", require("telescope.builtin").lsp_dynamic_workspace_symbols)
