-- $HOME/.config/nvim/lua/config/options.lua
vim.opt.number = true                                                                              -- [default: false ] line number
vim.opt.relativenumber = true                                                                      -- [default: false ] relative line number
vim.opt.cursorline = true                                                                          -- [default: false ] highlight current line
vim.opt.cursorlineopt = "screenline,number"                                                        -- [default: "both"] optimize cursorline display
vim.opt.termguicolors = true                                                                       -- [default  false ] Enables 24-bit RGB color in the TUI.

vim.opt.wrap = false                                                                               -- [default: true  ]wrap lines
vim.opt.scrolloff = 5                                                                              -- [default: 0     ]keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10                                                                         -- [default: 0     ]keep 10 columns to left/right of cursor

vim.opt.smartindent = false                                                                        -- [default: false ] Do smart autoindenting when starting a new line.
vim.opt.autoindent = true                                                                          -- [default: true  ] Copy indent from current line when starting a new line.

-- Define indentation policies as a data table for "Configuration as Documentation"
local indent_policies = {
  -- 2 Spaces: Web/Scripting languages
  two_spaces = {
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "html",
      "css",
      "scss",
      "json",
      "yaml",
      "lua",
      "ruby",
      "swift",
      "dart",
    },
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,
  },
  -- 4 Spaces: Modern compiled/interpreted languages
  four_spaces = {
    ft = { "python", "java", "cpp", "csharp" },
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
  -- Tabs: Traditional systems languages (C, Makefiles, Headers)
  hard_tabs = {
    ft = { "c", "make", "h" },
    tabstop = 8,
    shiftwidth = 8,
    softtabstop = 8,
    expandtab = false,
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    local applied = false

-- Apply policies based on the filetype
    for _, policy in pairs(indent_policies) do
      if vim.tbl_contains(policy.ft, ft) then
        vim.opt_local.tabstop = policy.tabstop
        vim.opt_local.shiftwidth = policy.shiftwidth
        vim.opt_local.softtabstop = policy.softtabstop
        vim.opt_local.expandtab = policy.expandtab
        applied = true
        break
      end
    end

-- Default fallback: 4 spaces
    if not applied then
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
    end
  end,
})

vim.opt.ignorecase = true                                                                          -- [default: false ] Ignore case in search patterns.
vim.opt.smartcase = true                                                                           -- [default: false ] Override the 'ignorecase' option if the search pattern contains upper case characters.
vim.opt.hlsearch = true                                                                            -- [default: true  ] Highlight search matches
vim.opt.incsearch = true                                                                           -- [default: true  ] Show matches as you type

vim.opt.signcolumn = "yes:2"                                                                       -- [default: "auto"] Always show signcolumn with 2-column width.

vim.opt.colorcolumn = "100"                                                                        -- [default: ""    ] Vertical line to mark line length limit.
vim.opt.showmatch = false                                                                          -- [default: false ] When a bracket is inserted, briefly jump to the matching one.
vim.opt.cmdheight = 1                                                                              -- [default: 1     ] Number of screen lines to use for the command-line.
vim.opt.completeopt = "menuone,noinsert,noselect"                                                  -- [default: "menu,popup"] A list of options for Insert mode completion.
vim.opt.showmode = false                                                                           -- [default: true  ] Display current mode on the last line.
vim.opt.pumheight = 10                                                                             -- [default: 0     ] Limit number of items to show in the popup menu. 0 means no limit.
vim.opt.pumblend = 20                                                                              -- [default: 0     ] Enable pseudo-transparency for the popup menu.
vim.opt.winblend = 0                                                                               -- [default: 0     ] Enable pseudo-transparency for a floating window.
vim.opt.conceallevel = 0                                                                           -- [default: 0     ] Conceal syntax level.
vim.opt.concealcursor = ""                                                                         -- [default: ""    ] Keep concealing even when cursor is on the line.
vim.opt.synmaxcol = 300                                                                            -- [default: 3000  ] Maximum column in which to search for syntax items.

local undodir = vim.fn.expand("~/.vim/undodir")
if
  vim.fn.isdirectory(undodir) == 0                                                                 -- create undodir if nonexistent
then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false                                                                             -- [default: false ] Create a backup file before overwriting.
vim.opt.writebackup = false                                                                        -- [default: true  ] Make a backup before writing the file.
vim.opt.swapfile = true                                                                            -- [default: true  ] Create a swap file for crash recovery.
vim.opt.undofile = true                                                                            -- [default: false ] Save undo history to an undo file.
vim.opt.undodir = undodir                                                                          -- [default: "~/.local/state/nvim/undo//" ]

vim.opt.updatetime = 300                                                                           -- [default: 4000  ] Faster update time for plugins (e.g., CursorHold).
vim.opt.timeoutlen = 500                                                                           -- [default: 1000  ] Time to wait for mapped sequence.
vim.opt.ttimeoutlen = 50                                                                           -- [default: 50    ] Time to wait for key codes.
vim.opt.autoread = true                                                                            -- [default: true  ] Automatically read file changes.
vim.opt.autowrite = false                                                                          -- [default: false ] Do not write files automatically.

vim.opt.hidden = true                                                                              -- [default: true  ] Allow hidden buffers.
vim.opt.errorbells = false                                                                         -- [default: false ] Disable error beeps.
vim.opt.backspace = "indent,eol,start"                                                             -- [default: "indent,eol,start" ] Allow backspacing over everything.
vim.opt.autochdir = false                                                                          -- [default: false ] Do not change directory automatically.
vim.opt.iskeyword:append("-")                                                                      -- [default: "@,48-57,_,192-255"] Treat hyphens as word characters.
vim.opt.path:append("**")                                                                          -- [default: ".,," ] A list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands,
vim.opt.selection = "inclusive"                                                                    -- [default: "inclusive"] Define behavior of visual selection. (Include last char in selection)
vim.opt.mouse = "nvic"                                                                             -- [default: "nvi" ] Enable mouse
-- vim.opt.clipboard:append("unnamedplus")                                                         -- [default: ""    ] Use system clipboard
vim.opt.modifiable = true                                                                          -- [default: true  ] Enable buffer modification

vim.opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- [default: "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"] cursor blinking and settings

                                                                                                   -- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr"                                                                        -- [default: "manual"] The kind of folding used for the current window.
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"                                               -- [default: "0"   ]
vim.opt.foldlevel = 99                                                                             -- [default: 0     ] start with all folds open

vim.opt.splitbelow = true                                                                          -- [defualt: false ]Put the new window below the current one when splitting a window.
vim.opt.splitright = true                                                                          -- [default: false ]Put the new window right of the current one when splitting a window.

vim.opt.wildmenu = true                                                                            -- [default: true  ]Enhanced command-line completion menu
vim.opt.wildmode = "longest:full,full"                                                             -- [default: "full"] Complete longest match first, then cycle through full matches
vim.opt.diffopt:append("linematch:60")                                                             -- [default:"internal,filler,closeoff,indent-heuristic,inline:char,linematch:40"] Optimize diff algorithm to match lines with up to 60 similarity
vim.opt.redrawtime = 10000                                                                         -- [default: 2000  ] time limit for redrawing screen (ms)
vim.opt.maxmempattern = 20000                                                                      -- [default: 1000  ] Maximum amount of memory (in Kbyte) to use for pattern matching.

vim.opt.list = true                                                                                -- [default: false ] Enable list mode to see invisible chars.

vim.opt.inccommand = "split"                                                                       -- [default: "nosplit" ] Enable real-time preview for commands.

vim.opt.listchars = {
  eol = "↲",                                                                                       -- End of line character
  tab = "«-»",                                                                                     -- Tab character (x is used once, then y repeated)
  space = "·",                                                                                     -- Space character
  multispace = "·",                                                                                -- Character(s) for multiple consecutive spaces
  lead = "·",                                                                                      -- Character for leading spaces
  leadmultispace = "·",                                                                            -- Character(s) for leading multiple spaces
  leadtab = "»-",                                                                                  -- Tab character specifically for leading tabs
  trail = "·",                                                                                     -- Trailing whitespace character
  extends = ">",                                                                                   -- Character shown when line continues off-screen (right)
  precedes = "<",                                                                                  -- Character shown when line starts off-screen (left)
  conceal = "…",                                                                                   -- Character shown for concealed text
  nbsp = "␣",                                                                                      -- Non-breaking space character
}

vim.opt.fillchars = {
  vert = "│",                                                                                      -- Character for vertical window separators
  horiz = "─",                                                                                     -- Character for horizontal window separators
  horizup = "┴",                                                                                   -- Connector for horizontal-up separators
  horizdown = "┬",                                                                                 -- Connector for horizontal-down separators
  vertleft = "┤",                                                                                  -- Connector for vertical-left separators
  vertright = "├",                                                                                 -- Connector for vertical-right separators
  verthoriz = "┼",                                                                                 -- Intersection connector for separators
  eob = " ",                                                                                       -- Character at end of buffer (hides tildes)
  fold = "·",                                                                                      -- Filler character for closed folds
  foldopen = "▾",                                                                                  -- Indicator for open folds
  foldclose = "▸",                                                                                 -- Indicator for closed folds
  foldsep = "│",                                                                                   -- Separator for vertical fold lines
  diff = "╱",                                                                                      -- Filler character for diff mode
  msgsep = "─",                                                                                    -- Separator for message area
}

vim.opt.virtualedit = "block"                                                                      -- [default: ""    ] Allow moving cursor into empty space in block mode.

vim.opt.encoding = "utf-8"                                                                         -- [default: ""    ] Set character encoding to UTF-8.
vim.opt.fileencoding = "utf-8"                                                                     -- [default: ""    ] Set file encoding to UTF-8.

vim.cmd.colorscheme("catppuccin-macchiato")
