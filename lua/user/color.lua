--vim.opt.background="dark"
-- vim.g.everforest_better_performance = 1
-- vim.g.everforest_background = "hard"
-- mycolor = "default"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. mycolor)
-- if not status_ok then
-- 	vim.notify("colorscheme failed")
-- 	return
-- end

vim.g.SnazzyTransparent = 1

--vim.cmd("hi Normal ctermfg=252 ctermbg=none stop={strikethrough}")
-- vim.cmd.hi("Normal ctermfg=252 ctermfg=none stop={strikethrough}")
vim.cmd("filetype plugin on")

-- Lua配置随机颜色
-- local random_color = {
-- 	-- "everblush" ,
-- 	"neodark",
-- 	"adwaita",
-- 	"dracula",
-- 	"dracula-soft",
-- 	"vscode",
-- 	"deus",
-- 	-- "vim-colors-solarized" ,
-- 	"solarized",
-- 	"snazzy",
-- 	"leaf",
-- 	"gruvbox",
-- 	"tokyonight",
-- 	"tokyonight-day",
-- 	"tokyonight-night",
-- 	"tokyonight-moon",
-- 	"tokyonight-storm",
-- 	"zephyr",
-- 	"onedark",
-- 	"substrata.nvim",
-- 	"darkplus.nvim",
-- 	"gruvbox",
-- 	"lualine.nvim",
-- 	"paramount",
-- 	"neon",
-- 	"aurora",
-- 	"kanagawa",
-- 	"everforest",
-- 	"sonokai",
-- 	"melange",
-- 	"nord",
	-- "monokai",
-- 	"monokai_pro",
-- 	"monokai_soda",
-- 	"monokai_ristretto",
-- 	"zephyrium",
-- 	"molokai",
-- 	"github-nvim-theme",
-- }

--math.randomseed(os.time())
-- local mycolor = random_color[math.random(36)]
local mycolor = "snazzy"

-- vim.cmd("set background=light")
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. mycolor)
if not status_ok then
	return
end
