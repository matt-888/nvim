MiniDeps.add("mhartington/formatter.nvim")

local util = require("formatter.util")

-- provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- enable or disable logging
	logging = false,
	-- set the log level
	log_level = vim.log.levels.WARN,
	-- all formatter configurations are opt-in
	filetype = {

		lua = { require("formatter.filetypes.lua").stylua }, -- "formatter.filetypes.lua" defines default configurations for the "lua" filetype
		python = { require("formatter.filetypes.python").black },
		json = { require("formatter.filetypes.json").prettydiff }, -- todo get a json formatter that has some opinions
    htmldjango = { util.copyf(require("formatter.defaults.djlint")) }, -- note that djlint must be installed via Mason

		-- use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- format on save autocommand
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
