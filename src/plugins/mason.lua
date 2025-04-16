MiniDeps.add("williamboman/mason.nvim")
MiniDeps.add("williamboman/mason-lspconfig.nvim")

require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		-- these are only lsps, formatters can't be put here
		"bashls",
		"julials",
		"lua_ls",
		"pyright",
    --"djlsp", --MasonInstall django-template-lsp manually for now
    --"django-template-lsp",
    "tailwindcss",
		"rust_analyzer",
	},
})
