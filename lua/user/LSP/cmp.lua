--local cmp = require'cmp'

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	print("cmp failed")
	return
end

local luasnip = require("luasnip")

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}

cmp.setup({
	mapping = {
		-- ... Your other configuration ...

		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
	},
	snippet = {
		-- We recommend using *actual* snippet engine.
		-- It's a simple implementation so it might not work in some of the cases.
		expand = function(args)
			unpack = unpack or table.unpack
			local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
			local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
			local indent = string.match(line_text, '^%s*')
			local replace = vim.split(args.body, '\n', true)
			local surround = string.match(line_text, '%S.*') or ''
			local surround_end = surround:sub(col)

			replace[1] = surround:sub(0, col - 1) .. replace[1]
			replace[#replace] = replace[#replace] .. (#surround_end > 1 and ' ' or '') .. surround_end
			if indent ~= '' then
				for i, line in ipairs(replace) do
					replace[i] = indent .. line
				end
			end

			vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			--border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'zsh' },
		{ name = 'latex_symbols' },
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}),
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) --vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
				zsh = "[ZSH]",
			})[entry.source.name]
			return vim_item
		end
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
--}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['clangd'].setup {
	capabilities = capabilities
}
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
	capabilities = capabilities
}
require('lspconfig')['jdtls'].setup { }
require("luasnip.loaders.from_vscode").lazy_load()
