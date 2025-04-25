-- mini.base16 =================================================================

require("mini.base16").setup({
	palette = {
		base00 = "#000000", --black --Default Background
		base01 = "#000000", --dark3 --Lighter Background (Used for status bars, line numbers, and folding marks)
		base02 = "#262626", --dark2 --Selection Background
		base03 = "#424949", --dark1 --Comments, Invisibles, Line Highlighting
		base04 = "#c6c6c6", --light1 --Dark Foreground (Used for status bars)
		base05 = "#767676", --light2 --Default Foreground, Caret, Delimiters, Operators
		base06 = "#00ff00", --light3 --Light Foreground (Not often used)

		base07 = "#eeeeee", --white --Light Background (Not often used)
		base08 = "#af005f", --red --Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
		base09 = "#ff8700", --orange --Integers, Boolean, Constants, XML Attributes, Markup Link Url
		base0A = "#ffd75f", --yellow --Classes, Markup Bold, Search Text Background
		base0B = "#5fd700", --green --Strings, Inherited Class, Markup Code, Diff Inserted
		base0C = "#afafff", --aqua --Support, Regular Expressions, Escape Characters, Markup Quotes
		base0D = "#00afff", --blue --Functions, Methods, Attribute IDs, Headings
		base0E = "#875faf", --purple --Keywords, Storage, Selector, Markup Italic, Diff Changed
		base0F = "#b2b2b2", --brown --Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
	},
	use_cterm = true,
})

-- ensure window separators aren't bold ----------------------------------------

vim.api.nvim_set_hl(0, 'WinSeparator', {
    fg = MiniBase16.config.palette.base03,
    bg = 'NONE',
    --ctermfg = 'NONE',
    --ctermbg = 'NONE'
})

-- ensure tabs are bland -------------------------------------------------------

vim.api.nvim_set_hl(0, 'TabLine', {
    fg = MiniBase16.config.palette.base04,
    bg = MiniBase16.config.palette.base02
})
vim.api.nvim_set_hl(0, 'TabLineSel', {
    fg = MiniBase16.config.palette.base02,
    bg = MiniBase16.config.palette.base04,
    bold = true
})
vim.api.nvim_set_hl(0, 'TabLineFill', {
    bg = MiniBase16.config.palette.base02
})


-- mini.notify =================================================================

require("mini.notify").setup({
	window = { config = { border = vim.g.border_style } },
})
vim.notify = MiniNotify.make_notify()


-- mini.starter ================================================================

local starter = require("mini.starter")

starter.setup({
	evaluate_single = true,
	items = {
		starter.sections.pick(),
		--starter.sections.recent_files(),
		starter.sections.builtin_actions(),
	},
})


-- mini.icons ==================================================================

require("mini.icons").setup({
	style = "ascii",
	use_file_extension = function(ext, _)
		local suf3, suf4 = ext:sub(-3), ext:sub(-4)
		return suf3 ~= "scm" and suf3 ~= "txt" and suf3 ~= "yml" and suf4 ~= "json" and suf4 ~= "yaml"
	end,
})

MiniIcons.mock_nvim_web_devicons()
