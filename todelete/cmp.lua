MiniDeps.add("hrsh7th/cmp-nvim-lsp")
MiniDeps.add("hrsh7th/cmp-buffer")
MiniDeps.add("hrsh7th/cmp-path")
MiniDeps.add("andersevenrud/cmp-tmux")
--MiniDeps.add('hrsh7th/cmp-cmdline')
MiniDeps.add("hrsh7th/nvim-cmp")

--todo remove
MiniDeps.add("L3MON4D3/LuaSnip")
MiniDeps.add("saadparwaiz1/cmp_luasnip")
MiniDeps.add("rafamadriz/friendly-snippets")
require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require("luasnip")
local cmp = require("cmp")

-- add html snippets to djangohtml files
luasnip.filetype_extend("htmldjango", {"html"})
require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({

	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},

	window = {
		completion = { border = vim.g.border_style },
		documentation = { border = vim.g.border_style },
	},

	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

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
	}),

	matching = { disallow_fuzzy_matching = true },
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "tmux" },
	}),
})

require("cmp").register_source("buffer", require("cmp_buffer").new())
require("cmp").register_source("path", require("cmp_path").new())
require("cmp").register_source("tmux", require("cmp_tmux").new())
require("cmp_nvim_lsp").setup()
