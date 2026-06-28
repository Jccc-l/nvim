# Neovim Configuration

A clean, modular Neovim configuration using native APIs (no wrapper layers).

## Requirements

- **Neovim >= 0.11** (uses `vim.lsp.config`, `vim.lsp.enable`, `vim.pack.add`)
- **Nerd Font** (for icons in statusline, completion, diagnostics)
- **ripgrep** (for Telescope live grep)
- **Mason** auto-installs LSP servers and tools on first launch

## Directory Structure

```
.
├── init.lua                          # Entry point
├── lua/
│   ├── config/
│   │   └── options.lua               # Vim options + indentation policies
│   ├── keymaps/
│   │   ├── enhanced_keymaps.lua      # Core keybindings (j/k, line move, esc)
│   │   ├── telescope.lua             # Telescope pickers
│   │   ├── aerial.lua                # Code outline toggle
│   │   ├── dap.lua                   # Debug keybindings
│   │   └── lsp.lua                   # LSP + native commenting
│   ├── lsp/
│   │   ├── lua_ls.lua                # Lua language server
│   │   ├── pyright.lua               # Python language server
│   │   ├── clangd.lua                # C/C++ language server
│   │   ├── jdtls.lua                 # Java language server
│   │   ├── bashls.lua                # Bash language server
│   │   ├── texlab.lua                # LaTeX language server
│   │   ├── vimls.lua                 # VimScript language server
│   │   ├── stylua.lua                # Lua formatter (LSP mode)
│   │   └── diagnostic.lua            # Global diagnostic config
│   ├── plugins/
│   │   ├── init.lua                  # Plugin registry (vim.pack.add)
│   │   ├── nvim-cmp.lua              # Completion engine
│   │   ├── telescope.lua             # Fuzzy finder config
│   │   ├── conform.lua               # Formatting on save
│   │   ├── catppuccin.lua            # Colorscheme
│   │   ├── lualine.lua               # Statusline
│   │   ├── aerial.lua                # Code outline
│   │   ├── which-key.lua             # Keybinding hints
│   │   ├── obsidian.lua              # Obsidian vault integration
│   │   ├── nvim-dap-ui.lua           # Debug UI
│   │   ├── nvim-dap-virtual-text.lua # Inline debug variables
│   │   ├── nvim-notify.lua           # Notification UI
│   │   └── ...                       # Other plugin configs
│   ├── dap_conf/
│   │   └── cpptools.lua              # C/C++ debug adapter
│   └── utils/
│       └── init.lua                  # (placeholder)
├── stylua.toml                       # Lua formatter rules
└── nvim-pack-lock.json               # Plugin lockfile
```

## Plugin Manager

Uses Neovim's **native** `vim.pack.add()` API -- no lazy.nvim, packer, or other wrapper. Plugins are declared in `lua/plugins/init.lua` and loaded via `pcall(require, ...)`.

## LSP Servers

Configured via native `vim.lsp.config()` + `vim.lsp.enable()` (no nvim-lspconfig dependency).

| Server | Language | Custom Commands |
|--------|----------|-----------------|
| lua_ls | Lua | CodeLens, Inlay hints |
| pyright | Python | `:LspPyrightOrganizeImports`, `:LspPyrightSetPythonPath` |
| clangd | C/C++/ObjC/CUDA | `:LspClangdSwitchSourceHeader`, `:LspClangdShowSymbolInfo` |
| jdtls | Java | Dynamic workspace per project |
| bashls | Shell | -- |
| texlab | LaTeX | `:LspTexlabBuild`, `:LspTexlabForward`, `:LspTexlabDependencyGraph`, etc. |

> Note: `vimls` and `stylua` configs exist in `lua/lsp/` but are not loaded by `lsp/init.lua`.

Install servers via `:Mason` or they auto-install on startup.

## Formatting

Powered by [conform.nvim](https://github.com/stevearc/conform.nvim) with **format-on-save** enabled (500ms timeout).

| Language | Formatter |
|----------|-----------|
| Lua | stylua |
| Go | goimports, gofmt |
| Rust | rustfmt |
| Python | ruff_format (fallback: isort + black) |
| C/C++ | clangd |
| Markdown | prettier |
| Java | google-java-format |
| All files | codespell |
| Fallback | trim_whitespace |

## Completion

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with:

- **Sources**: LSP > LuaSnip > Path (Buffer only in search cmdline)
- **Snippet engine**: LuaSnip + friendly-snippets
- **Icons**: lspkind (codicons preset)
- **Ghost text**: enabled

## Keymaps

Leader key: `Space`

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `j` / `k` | n, x | Smart movement (visual line without count, logical with count) |
| `<A-j>` / `<A-k>` | n, i, v | Move line/selection up/down |
| `<Esc>` | n, i | Clear search highlight + escape |

### Telescope (`<leader>f`)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fc` | Colorscheme switcher |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |

### LSP (`gr` prefix, follows Neovim defaults)

| Key | Action |
|-----|--------|
| `grt` | Type definition |
| `gri` | Implementation |
| `grr` | References |
| `grx` | Run CodeLens |
| `gra` | Code action |
| `grn` | Rename symbol |

### Editing

| Key | Action |
|-----|--------|
| `gc` | Comment operator (with motions) |
| `gcc` | Toggle line comment |
| `<leader>a` | Toggle code outline (Aerial) |

### Debug (`<leader>d`)

| Key | Action |
|-----|--------|
| `<leader>du` | Toggle DAP UI |
| `<leader>dc` | Continue |
| `<leader>dsi` | Step into |
| `<leader>dso` | Step over |
| `<leader>dr` | Open REPL |
| `<leader>db` | Toggle breakpoint |

### Obsidian

Configure your vault path in `lua/plugins/obsidian.lua`:

```lua
workspaces = {
  {
    name = "Your Vault",
    path = "/path/to/your/vault",
  },
},
```

## Indentation

Data-driven via `FileType` autocmd in `config/options.lua`:

| Policy | Languages | Style |
|--------|-----------|-------|
| 2 spaces | JS/TS, HTML/CSS, JSON/YAML, Lua, Ruby, Swift, Dart | Soft tabs |
| 4 spaces | Python, C++, C# | Soft tabs |
| C/Makefile/H/Java | C, Make, Headers, Java | Soft tabs (2) |
| Default | Everything else | 4 spaces |

## Colorscheme

**Catppuccin Macchiato** with italic comments, LSP inlay hint backgrounds, and integrations for cmp, gitsigns, mini.

## License

MIT
