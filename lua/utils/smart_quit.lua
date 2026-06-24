-- $HOME/.config/nvim/lua/utils/smart_quit.lua
local M = {}
-- Configuration: Define the filetypes that are allowed to be ignored
-- If all other windows have these filetypes, we consider it safe to quit.
M.ignore_filetypes = {
  "NvimTree",
  "neo-tree",
  "toggleterm",
  "help",
  "qf",
  "aerial",
  "dapui_scopes",
  "dapui_breakpoints",
  "dapui_stacks",
  "dapui_watches",
  "dap-repl",
  "dapui_console",
}

-- Helper function to check if a filetype is in the ignore list
function M.is_ignored(bufnr)
  local ft = vim.bo[bufnr].filetype
  for _, allowed_ft in ipairs(M.ignore_filetypes) do
    if ft == allowed_ft then
      return true
    end
  end
  return false
end

-- Main function to handle quit logic
function M.smart_quit()
  local windows = vim.api.nvim_list_wins()
  local current_win = vim.api.nvim_get_current_win()
  local other_windows_exist = false

  -- Check other windows
  for _, win in ipairs(windows) do
    if win ~= current_win then
      local bufnr = vim.api.nvim_win_get_buf(win)
      if not M.is_ignored(bufnr) then
        other_windows_exist = true
        break
      end
    end
  end

  if other_windows_exist then
    -- If meaningful windows exist, just close the current one
    vim.cmd("quit")
  else
    -- Prepare to quit: Check if current buffer is modified
    if vim.bo.modified then
      vim.ui.select(
        { "Save and Quit", "Discard and Quit", "Cancel" },
        { prompt = "File is modified. What do you want to do?" },
        function(choice)
          if choice == "Save and Quit" then
            vim.cmd("wq")
          elseif choice == "Discard and Quit" then
            vim.cmd("q!")
          end
        end
      )
    else
      -- If not modified, just quit
      vim.cmd("quitall")
    end
  end
end

return M
