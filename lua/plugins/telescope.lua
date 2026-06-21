-- $HOME/.config/nvim/lua/plugins/telescope.lua
require("telescope").setup({
  defaults = {
    -- Sorting strategy: "descending" or "ascending"
    sorting_strategy = "descending",
    -- Selection strategy: "reset", "follow", "row", "closest", "none"
    selection_strategy = "reset",
    -- Scroll strategy: "cycle", "limit"
    scroll_strategy = "cycle",
    -- Layout strategy: "horizontal" (default), "vertical", etc.
    layout_strategy = "horizontal",
    -- Configuration for different layouts
    layout_config = {
      bottom_pane = { height = 25, preview_cutoff = 120, prompt_position = "top" },
      center = { height = 0.4, preview_cutoff = 40, prompt_position = "top", width = 0.5 },
      cursor = { height = 0.9, preview_cutoff = 40, width = 0.8 },
      horizontal = { height = 0.9, preview_cutoff = 120, prompt_position = "bottom", width = 0.8 },
      vertical = { height = 0.9, preview_cutoff = 40, prompt_position = "bottom", width = 0.8 },
    },
    -- Layouts to cycle through
    cycle_layout_list = { "horizontal", "vertical" },
    -- Window blend level
    winblend = function()
      return vim.o.winblend
    end,
    -- Wrap search results
    wrap_results = false,
    -- Prompt prefix
    prompt_prefix = "> ",
    -- Selection caret
    selection_caret = "> ",
    -- Entry prefix
    entry_prefix = "  ",
    -- Multi-selection icon
    multi_icon = "+",
    -- Initial mode: "insert" or "normal"
    initial_mode = "insert",
    -- Show border
    border = true,
    -- Path display settings
    path_display = {},
    -- Border characters
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- Status text function
    get_status_text = nil,
    -- Highlight end of line in results
    hl_result_eol = true,
    -- Dynamically update preview title
    dynamic_preview_title = false,
    -- Result window title
    results_title = "Results",
    -- Prompt window title
    prompt_title = "Prompt",
    -- Mappings
    mappings = {
      i = {
        ["<LeftMouse>"] = {
          require("telescope.actions").mouse_click,
          type = "action",
          opts = { expr = true },
        },
        ["<2-LeftMouse>"] = {
          require("telescope.actions").double_mouse_click,
          type = "action",
          opts = { expr = true },
        },

        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,

        ["<C-c>"] = require("telescope.actions").close,

        ["<Down>"] = require("telescope.actions").move_selection_next,
        ["<Up>"] = require("telescope.actions").move_selection_previous,

        ["<CR>"] = require("telescope.actions").select_default,
        ["<C-x>"] = require("telescope.actions").select_horizontal,
        ["<C-v>"] = require("telescope.actions").select_vertical,
        ["<C-t>"] = require("telescope.actions").select_tab,

        ["<C-S-k>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-S-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-S-h>"] = require("telescope.actions").preview_scrolling_left,
        ["<C-S-l>"] = require("telescope.actions").preview_scrolling_right,

        ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
        ["<PageDown>"] = require("telescope.actions").results_scrolling_down,
        ["<M-f>"] = require("telescope.actions").results_scrolling_left,
        ["<M-k>"] = require("telescope.actions").results_scrolling_right,

        ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
        ["<S-Tab>"] = require("telescope.actions").toggle_selection
          + require("telescope.actions").move_selection_better,
        ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
        ["<C-l>"] = require("telescope.actions").complete_tag,
        ["<C-/>"] = require("telescope.actions").which_key,
        ["<C-_>"] = require("telescope.actions").which_key, -- keys from pressing <C-/>
        ["<C-w>"] = { "<c-s-w>", type = "command" },
        ["<C-r><C-w>"] = require("telescope.actions").insert_original_cword,
        ["<C-r><C-a>"] = require("telescope.actions").insert_original_cWORD,
        ["<C-r><C-f>"] = require("telescope.actions").insert_original_cfile,
        ["<C-r><C-l>"] = require("telescope.actions").insert_original_cline,
      },
      n = {
        ["<LeftMouse>"] = {
          require("telescope.actions").mouse_click,
          type = "action",
          opts = { expr = true },
        },
        ["<2-LeftMouse>"] = {
          require("telescope.actions").double_mouse_click,
          type = "action",
          opts = { expr = true },
        },

        ["<esc>"] = require("telescope.actions").close,
        ["<CR>"] = require("telescope.actions").select_default,
        ["<C-x>"] = require("telescope.actions").select_horizontal,
        ["<C-v>"] = require("telescope.actions").select_vertical,
        ["<C-t>"] = require("telescope.actions").select_tab,

        ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
        ["<S-Tab>"] = require("telescope.actions").toggle_selection
          + require("telescope.actions").move_selection_better,
        ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,

        ["j"] = require("telescope.actions").move_selection_next,
        ["k"] = require("telescope.actions").move_selection_previous,
        ["H"] = require("telescope.actions").move_to_top,
        ["M"] = require("telescope.actions").move_to_middle,
        ["L"] = require("telescope.actions").move_to_bottom,

        ["<Down>"] = require("telescope.actions").move_selection_next,
        ["<Up>"] = require("telescope.actions").move_selection_previous,
        ["gg"] = require("telescope.actions").move_to_top,
        ["G"] = require("telescope.actions").move_to_bottom,

        ["<C-S-k>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-S-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-S-h>"] = require("telescope.actions").preview_scrolling_left,
        ["<C-S-l>"] = require("telescope.actions").preview_scrolling_right,

        ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
        ["<PageDown>"] = require("telescope.actions").results_scrolling_down,
        ["<M-f>"] = require("telescope.actions").results_scrolling_left,
        ["<M-k>"] = require("telescope.actions").results_scrolling_right,

        ["?"] = require("telescope.actions").which_key,
      },
    },
    -- Default mappings
    default_mappings = nil,
    -- History configuration
    history = {
      path = vim.fn.stdpath("data") .. "/telescope_history",
      limit = 100,
      cycle_wrap = false,
    },
    -- Cache configuration
    cache_picker = {
      num_pickers = 1,
      limit_entries = 1000,
      ignore_empty_prompt = false,
    },
    -- Previewer configuration
    preview = {
      check_mime_type = true,
      filesize_limit = 25,
      highlight_limit = 1,
      timeout = 250,
      treesitter = true,
      msg_bg_fillchar = "╱",
      hide_on_startup = false,
      ls_short = false,
    },
    -- Default grep arguments
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    use_less = true,
    set_env = nil,
    color_devicons = true,
    -- Sorter configurations
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
    prefilter_sorter = require("telescope.sorters").prefilter,
    -- Default previewers
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
  pickers = {
    -- Specific picker configurations go here
  },
  extensions = {
    -- Extension configurations go here
  },
})
