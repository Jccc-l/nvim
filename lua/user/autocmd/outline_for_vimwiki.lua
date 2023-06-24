vim.api.nvim_create_autocmd("FileType", {
	pattern = { "vimwiki" },
	callback = function()
		vim.o.filetype="markdown"
	end,
})
