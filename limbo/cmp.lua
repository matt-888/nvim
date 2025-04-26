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
