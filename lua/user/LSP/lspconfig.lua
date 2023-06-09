local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	print("lspconfig falied")
	return
end
mason_lspconfig.setup({
	ensure_installed = { "texlab", "lua_ls", "pyright", "jdtls", "clangd" },
	automatic_installation = true,
	handlers = nil,
})
