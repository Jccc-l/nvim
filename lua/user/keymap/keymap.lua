-- Cancel s default function(取消s的默认功能)
keymap("n", "s", "", opt)
-- Windows split screen shortcuts(分屏)
keymap("n", "sl", "<cmd>set splitright<CR><cmd>vsplit<CR>", opt)
keymap("n", "sh", "<cmd>set nosplitright<CR><cmd>vsplit<CR>", opt)
keymap("n", "sj", "<cmd>set splitbelow<CR><cmd>split<CR>", opt)
keymap("n", "sk", "<cmd>set nosplitbelow<CR><cmd>split<CR>", opt)
-- Close current
keymap("n", "sc", "<C-w>c", opt)
-- Close other
keymap("n", "so", "<C-w>o", opt)
-- Ctrl + hjkl jump between windows(在不同窗口之间跳转)
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-j>", "<C-w>j", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-l>", "<C-w>l", opt)

-- Exit insert mode
keymap("i", "jk", "<ESC>", opt)
keymap("i", "kj", "<ESC>", opt)

-- Left and right proportional control(控制左右分屏大小)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opt)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opt)
keymap("n", "s,", "<cmd>vertical resize -20<CR>", opt)
keymap("n", "s.", "<cmd>vertical resize +20<CR>", opt)
-- Up and down ratio(控制上下分屏大小)
--keymap("n", "sj", "<cmd>resize +10<CR>", opt)
--keymap("n", "sk", "<cmd>resize -10<CR>", opt)
--keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opt)
--keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opt)

-- Indent code in visual mode(在可视模式进行缩进)
--keymap("v", "<", "<gv", opt)
--keymap("v", ">", ">gv", opt)

-- Move selected text up and down(上下移动选中的文本)
keymap("v", "J", "<cmd>move '>+1<CR>gv-gv", opt)
keymap("v", "K", "<cmd>move '<-2<CR>gv-gv", opt)

-- Configure Copy Shortcuts
-- keymap("v", "<C-c>", '"+y', opt) -- 复制
-- keymap("v", "<C-x>", '"+d', opt) -- 剪切

--Format(格式化)
keymap("n", "<M-S-f>", "<cmd>lua vim.lsp.buf.format()<CR>", opt)

--切换标签页
keymap("n", "<M-S-h>", "<cmd>bp<CR>", opt)
keymap("n", "<M-S-l>", "<cmd>bn<CR>", opt)

keymap("n", "ss", "<cmd>w<CR><cmd>source<CR>", opt)
keymap("n", "Q", "<cmd>wqa<CR>", opt)
-- keymap("n", "<C-c>", "<cmd>wqa<CR>", opt)

--以最高权限保存文件
keymap("n", "sw", "<cmd>SudaWrite<CR>", opt)
