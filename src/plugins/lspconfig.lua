MiniDeps.add("neovim/nvim-lspconfig")

local lspconfig = require("lspconfig")

-- preconfiguration ===========================================================

local on_attach_custom = function(client, buf_id) -- this runs when an lsp is attached to a buffer
	vim.notify("lsp attached")
end

local diagnostic_opts = {
	float = { border = "double" },
	-- Show gutter sings
	signs = {
		-- With highest priority
		priority = 9999,
		-- Only for warnings and errors
		severity = { min = "WARN", max = "ERROR" },
	},
	-- Show virtual text only for errors
	virtual_text = { severity = { min = "ERROR", max = "ERROR" } },
	-- Don't update diagnostics when typing
	update_in_insert = false,
}

vim.diagnostic.config(diagnostic_opts)

-- aethetics =================================================================

-- ensure round borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- completion =================================================================

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Bash (bashls) ===========================================================

lspconfig.bashls.setup({
	on_attach = on_attach_custom,
	capabilities = capabilities,
})

-- Python (pyright) ================================================

lspconfig.pyright.setup({
	on_attach = on_attach_custom,
	capabilities = capabilities,
})

-- Django =================================================================

lspconfig.djlsp.setup({
	on_attach = on_attach_custom,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach_custom,
	capabilities = capabilities,
  init_options = { includeLanguages = { htmldjango = "html" } }
})

-- Lua (lua_ls) ===========================================================

lspconfig.lua_ls.setup({
	on_attach = on_attach_custom,
	capabilities = capabilities,
})
