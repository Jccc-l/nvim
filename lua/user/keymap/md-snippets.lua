vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.notify("This is a markdown file")
		-- Bold
		keymap("i", ",b", "****<++><ESC>F*hi", opts)
		-- Italy
		keymap("i", ",i", "**<++><ESC>F*i", opts)
		-- Mission
		keymap("i", ",m", "- [ ] ", opts)
		-- Picture
		keymap("i", ",p", "<img src=\"\" style=\"max-width=100%\"><ESC>3F\"i", opts)
		-- Find next<++>
		keymap("i", ",f", "<ESC>/<++><CR>cf>", opts)
		-- Line
		keymap("i", ",l", "---<CR>", opts)
		-- Link
		keymap("i",",a","[](<++>)<++><ESC>F]i",opts)
		-- Strikethrough
		keymap("i", ",s", "~~~~ <++><Esc>F~hi", opts)
		-- Code block
		keymap("i", ",c", "```<CR><++><CR>```<ESC>2kA",opts)
		-- Title
		keymap("i", ",1", "# <CR><++><ESC>kA", opts)
		keymap("i", ",2", "## <CR><++><ESC>kA", opts)
		keymap("i", ",3", "### <CR><++><ESC>kA", opts)
		keymap("i", ",4", "#### <CR><++><ESC>kA", opts)
	end,
})
