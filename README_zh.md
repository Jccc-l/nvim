# Neovim 配置

一套简洁、模块化的 Neovim 配置，全部使用原生 API，不依赖第三方封装层。

## 环境要求

- **Neovim >= 0.11**（使用 `vim.lsp.config`、`vim.lsp.enable`、`vim.pack.add`）
- **Nerd Font**（用于状态栏、补全菜单、诊断符号等图标显示）
- **ripgrep**（Telescope 全局搜索依赖）
- **Mason**（首次启动自动安装 LSP 服务器和格式化工具）

## 目录结构

```
.
├── init.lua                          # 入口文件
├── lua/
│   ├── config/
│   │   └── options.lua               # 编辑器选项 + 缩进策略
│   ├── keymaps/
│   │   ├── enhanced_keymaps.lua      # 核心快捷键（j/k 智能移动、行移动、Esc）
│   │   ├── telescope.lua             # Telescope 各功能快捷键
│   │   ├── aerial.lua                # 代码大纲开关
│   │   ├── dap.lua                   # 调试快捷键
│   │   └── lsp.lua                   # LSP 快捷键 + 原生注释
│   ├── lsp/
│   │   ├── lua_ls.lua                # Lua 语言服务器
│   │   ├── pyright.lua               # Python 语言服务器
│   │   ├── clangd.lua                # C/C++ 语言服务器
│   │   ├── jdtls.lua                 # Java 语言服务器
│   │   ├── bashls.lua                # Bash 语言服务器
│   │   ├── texlab.lua                # LaTeX 语言服务器
│   │   ├── vimls.lua                 # VimScript 语言服务器（未加载）
│   │   ├── stylua.lua                # Lua 格式化器（LSP 模式，未加载）
│   │   └── diagnostic.lua            # 全局诊断配置
│   ├── plugins/
│   │   ├── init.lua                  # 插件注册（vim.pack.add）
│   │   ├── nvim-cmp.lua              # 自动补全引擎
│   │   ├── telescope.lua             # 模糊搜索配置
│   │   ├── conform.lua               # 保存时格式化
│   │   ├── catppuccin.lua            # 配色方案
│   │   ├── lualine.lua               # 状态栏
│   │   ├── aerial.lua                # 代码大纲
│   │   ├── which-key.lua             # 按键提示
│   │   ├── obsidian.lua              # Obsidian 笔记集成
│   │   ├── nvim-dap-ui.lua           # 调试 UI
│   │   ├── nvim-dap-virtual-text.lua # 调试虚拟文本
│   │   ├── nvim-notify.lua           # 通知弹窗
│   │   └── ...                       # 其他插件配置
│   ├── dap_conf/
│   │   └── cpptools.lua              # C/C++ 调试适配器
│   └── utils/
│       └── init.lua                  # （占位）
├── stylua.toml                       # Lua 格式化规则
└── nvim-pack-lock.json               # 插件锁定文件
```

## 插件管理

使用 Neovim **原生** `vim.pack.add()` API，不依赖 lazy.nvim、packer 或其他第三方插件管理器。插件在 `lua/plugins/init.lua` 中声明，通过 `pcall(require, ...)` 逐一加载。

## LSP 服务器

通过原生 `vim.lsp.config()` + `vim.lsp.enable()` 配置，不依赖 nvim-lspconfig。

| 服务器 | 语言 | 自定义命令 |
|--------|------|-----------|
| lua_ls | Lua | CodeLens、Inlay hints |
| pyright | Python | `:LspPyrightOrganizeImports`、`:LspPyrightSetPythonPath` |
| clangd | C/C++/ObjC/CUDA | `:LspClangdSwitchSourceHeader`、`:LspClangdShowSymbolInfo` |
| jdtls | Java | 动态工作区目录，支持自定义 JVM 参数 |
| bashls | Shell | — |
| texlab | LaTeX | `:LspTexlabBuild`、`:LspTexlabForward`、`:LspTexlabDependencyGraph` 等 |

> 注意：`vimls` 和 `stylua` 的配置文件存在于 `lua/lsp/` 中，但未被 `lsp/init.lua` 加载。

通过 `:Mason` 安装服务器，或在首次启动时自动安装。

## 代码格式化

基于 [conform.nvim](https://github.com/stevearc/conform.nvim)，**保存时自动格式化**，超时 500ms。

| 语言 | 格式化器 |
|------|---------|
| Lua | stylua |
| Go | goimports、gofmt |
| Rust | rustfmt |
| Python | ruff_format（优先）；否则 isort + black |
| C/C++ | clangd |
| Markdown | prettier |
| Java | google-java-format |
| 所有文件 | codespell（拼写检查） |
| 默认回退 | trim_whitespace |

## 自动补全

基于 [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)：

- **补全源**：LSP > LuaSnip > Path（Buffer 仅在搜索命令行中启用）
- **代码片段引擎**：LuaSnip + friendly-snippets
- **图标**：lspkind（codicons 预设）
- **Ghost text**：已开启（输入时显示灰色预览文本）

## 快捷键

Leader 键：`空格`

### 导航

| 按键 | 模式 | 功能 |
|------|------|------|
| `j` / `k` | n, x | 智能移动：无计数时按可视行移动，有计数时按逻辑行移动 |
| `<A-j>` / `<A-k>` | n, i, v | 上下移动当前行或选区 |
| `<Esc>` | n, i | 清除搜索高亮并退出 |

### Telescope（`<leader>f` 系列）

| 按键 | 功能 |
|------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全局内容搜索 |
| `<leader>fb` | 已打开缓冲区 |
| `<leader>fh` | 帮助标签 |
| `<leader>fk` | 快捷键列表 |
| `<leader>fc` | 配色方案切换 |
| `<leader>fs` | 当前文档 LSP 符号 |
| `<leader>fS` | 工作区 LSP 符号 |

### LSP（`gr` 前缀，遵循 Neovim 原生约定）

| 按键 | 功能 |
|------|------|
| `grt` | 跳转到类型定义 |
| `gri` | 跳转到实现 |
| `grr` | 查看引用 |
| `grx` | 运行 CodeLens |
| `gra` | 代码操作（重构、修复等） |
| `grn` | 重命名符号 |

### 编辑

| 按键 | 功能 |
|------|------|
| `gc` | 注释操作符（配合动作使用，如 `gcip`） |
| `gcc` | 注释/取消注释当前行 |
| `<leader>a` | 切换代码大纲（Aerial） |

### 调试（`<leader>d` 系列）

| 按键 | 功能 |
|------|------|
| `<leader>du` | 切换 DAP UI |
| `<leader>dc` | 继续执行 |
| `<leader>dsi` | 步入 |
| `<leader>dso` | 步过 |
| `<leader>dr` | 打开 REPL |
| `<leader>db` | 切换断点 |

### Obsidian 笔记

在 `lua/plugins/obsidian.lua` 中配置你的 Vault 路径：

```lua
workspaces = {
  {
    name = "你的知识库",
    path = "/path/to/your/vault",
  },
},
```

## 缩进策略

通过 `FileType` autocmd 实现数据驱动的缩进管理，定义在 `config/options.lua`：

| 策略 | 语言 | 样式 |
|------|------|------|
| 2 空格 | JS/TS、HTML/CSS、JSON/YAML、Lua、Ruby、Swift、Dart | 空格缩进 |
| 4 空格 | Python、C++、C# | 空格缩进 |
| C/Makefile/H/Java | C、Make、头文件、Java | 空格缩进（2 空格） |
| 默认 | 其他所有语言 | 4 空格 |

## 配色方案

**Catppuccin Macchiato**（暗色），注释斜体，LSP Inlay hints 背景高亮，集成 cmp、gitsigns、mini。

## 许可证

MIT
