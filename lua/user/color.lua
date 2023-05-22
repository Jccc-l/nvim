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
-- 	"deus",
-- 	"snazzy",
-- 	"tokyonight",
-- 	-- "tokyonight-day",
-- 	"tokyonight-moon",
-- 	-- "tokyonight-night",
-- 	"tokyonight-storm",
-- 	"dracula",
-- 	-- "everforest",
-- 	-- "everblush",--有bug
-- 	-- "neodark",
-- 	"sonokai",
-- 	"aurora",
-- 	"kanagawa",
-- 	"gruvbox",
-- 	-- "nord",
-- 	"solarized",
-- 	"vscode",
-- 	-- "substrata",
-- 	"tokyodark",
-- 	-- "neon",
-- 	-- "leaf",
-- 	"adwaita",
-- 	"melange",
-- 	-- "onedark",
-- 	"monokai",
-- 	-- "monokai_ristretto",--错误提示显示问题
-- 	-- "monokai_pro",--错误提示显示问题
-- 	"monokai_soda",
-- 	"darkplus",
-- 	"zephyr",
-- 	"habamax",
-- }

local random_color = {
	"everforest",
	"deus",
	"snazzy",
	"molokai",
	"tokyonight",
	"tokyonight-moon",
	-- "tokyonight-day",
	"tokyonight-night",
	"tokyonight-storm",
	"dracula",
	"dracula-soft",
	"solarized",
	"neodark",
	"gruvbox",
	"sonokai",
	"aurora",
	"onedark",
	--"everblush",--ERR
	"kanagawa",
	"kanagawa-wave",
	"kanagawa-lotus",
	"kanagawa-dragon",
	"zephyrium",
	"leaf",
	"adwaita",
	"zephyr",
	"nord",
	"melange",
	"substrata",
	"neon",
	"vscode",
	"monokai",
	"monokai_pro",
	"monokai_ristretto",
	"monokai_soda",
	"paramount",
	"github_light",
	"github_dark",
	"github_light_colorblind",
	"github_dark_colorblind",
	"github_light_default",
	"github_dark_default",
	"github_dimmed",
	"darkplus",
}

--math.randomseed(os.time())
local mycolor = random_color[math.random(10)]
--local mycolor = "everblush"

-- vim.cmd("set background=light")
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. mycolor)
if not status_ok then
	return
end
