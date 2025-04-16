--stylua: ignore start

-- leader key ==================================================================

vim.g.mapleader = ' '


-- general =====================================================================

vim.o.backup       = false          -- don't store backup
vim.o.mouse        = 'a'            -- enable mouse
vim.o.mousescroll  = 'ver:10,hor:6' -- customize mouse scroll
vim.o.switchbuf    = 'usetab'       -- use already opened buffers when switching
vim.o.writebackup  = false          -- don't store backup
vim.o.undofile     = true           -- enable persistent undo

vim.o.shada        = "'100,<50,s10,:1000,/100,@100,h" -- limit what is stored in ShaDa file

vim.cmd('filetype plugin indent on') -- enable all filetype plugins


-- aesthetics ==================================================================

vim.g.border_style   = 'rounded' -- set a global variable for border style that can be accessed elsewhere
vim.o.breakindent    = true      -- indent wrapped lines to match line start
vim.o.colorcolumn    = '+1'      -- draw colored column one step to the right of desired maximum width
vim.o.cursorline     = true      -- enable highlighting of the current line
vim.o.laststatus     = 2         -- always show statusline
vim.o.linebreak      = true      -- wrap long lines at 'breakat' (if 'wrap' is set)
--vim.o.list            = true      -- show helpful character indicators, weird, adds hiphens when typing which I don't like
vim.o.number         = true      -- show line numbers
vim.o.pumblend       = 10        -- make builtin completion menus slightly transparent
vim.o.pumheight      = 10        -- make popup menu smaller
vim.o.relativenumber = true
vim.o.ruler          = false     -- don't show cursor position
--vim.o.shortmess      = 'aoOWFcS' -- disable certain messages from |ins-completion-menu|
vim.o.showmode       = false     -- don't show mode in command line
vim.o.showtabline    = 2         -- always show tabline
vim.o.signcolumn     = 'yes'     -- always show signcolumn or it would frequently shift
vim.o.splitbelow     = true      -- horizontal splits will be below
vim.o.splitright     = true      -- vertical splits will be to the right
vim.o.termguicolors  = true      -- enable gui colors
vim.o.winblend       = 10        -- make floating windows slightly transparent
vim.o.wrap           = false     -- display long lines as just one line

--vim.o.fillchars = table.concat(
--  { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
--  ','
--)
--vim.o.listchars = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
--vim.o.cursorlineopt = 'screenline,number' -- show cursor line only screen line when wrapped
--vim.o.breakindentopt = 'list:-1' -- add padding for lists when 'wrap' is on


-- colors ======================================================================

-- enable syntax highlighing if it wasn't already (as it is time consuming)
-- don't defer it because it affects start screen appearance
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end


-- editing =====================================================================

vim.o.autoindent    = true     -- use auto indent
vim.o.expandtab     = true     -- convert tabs to spaces
--vim.o.formatoptions = 'rqnl1j' -- improve comment editing
vim.o.ignorecase    = true     -- ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch     = true     -- show search results while typing
vim.o.infercase     = true     -- infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth    = 2        -- use this number of spaces for indentation
vim.o.smartcase     = true     -- don't ignore case when searching if pattern has upper case
vim.o.smartindent   = true     -- make indenting smart
vim.o.tabstop       = 2        -- insert 2 spaces for a tab
vim.o.virtualedit   = 'block'  -- allow going past the end of line in visual block mode

--vim.opt.completeopt:append('fuzzy') -- use fuzzy matching for built-in completion note for some reason this is causing an error atm
vim.opt.iskeyword:append('-')       -- treat dash separated words as a word text object

-- define pattern for a start of 'numbered' list. this is responsible for
-- correct formatting of lists when using `gw`. this basically reads as 'at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item'
-- vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]


-- spelling ====================================================================

--vim.o.spell        = true    -- turn on spelling
vim.o.spelllang    = 'en_us' -- define spelling dictionaries
vim.o.spelloptions = 'camel' -- treat parts of camelCase words as seprate words, snake_case is already treated this way

vim.opt.complete:append('kspell') -- add spellcheck options for autocomplete
vim.opt.complete:remove('t')      -- don't use tags for completion

--vim.o.dictionary   = vim.fn.stdpath('config') .. '/misc/dict/english.txt' -- use specific dictionaries


-- folds =======================================================================

--vim.o.foldmethod       = 'indent' -- set 'indent' folding method
--vim.o.foldlevel        = 1        -- display all folds except top ones
--vim.o.foldnestmax      = 10       -- create folds only for some number of nested levels
--vim.g.markdown_folding = 1        -- use folding by heading in markdown files


-- settings autocommands =======================================================

local augroup = vim.api.nvim_create_augroup('CustomSettings', {})
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  callback = function()
    -- don't auto-wrap comments and don't insert comment leader after hitting 'o'
    -- if don't do this on `FileType`, this keeps reappearing due to being set in
    -- filetype plugins.
    vim.cmd('setlocal formatoptions-=c formatoptions-=o')
  end,
  desc = [[Ensure proper 'formatoptions']],
})

--stylua: ignore end
