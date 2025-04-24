--stylua: ignore start

-- general =====================================================================

vim.g.mapleader    = ' '

vim.o.backup       = false          -- don't store backup
vim.o.mouse        = ''             -- disable mouse
vim.o.mousescroll  = 'ver:0,hor:0'  -- disable mouse scroll
vim.o.switchbuf    = 'usetab'       -- use already opened buffers when switching
vim.o.writebackup  = false          -- don't store backup
vim.o.undofile     = true           -- enable persistent undo

vim.o.shada        = "'100,<50,s10,:1000,/100,@100,h" -- limit what is stored in ShaDa file

vim.cmd('filetype plugin indent on') -- enable all filetype plugins


-- aesthetics ==================================================================

vim.g.border_style   = 'rounded' -- set global variable for border style that can be accessed elsewhere
vim.o.breakindent    = true      -- indent wrapped lines to match line start
vim.o.colorcolumn    = '+1'      -- draw colored column one step to the right of desired maximum width
vim.o.cursorline     = true      -- enable highlighting of the current line
vim.o.laststatus     = 3         -- global status line
vim.o.linebreak      = true      -- wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.number         = true      -- show line numbers
vim.o.pumblend       = 10        -- make builtin completion menus slightly transparent
vim.o.pumheight      = 10        -- make popup menu smaller
vim.o.relativenumber = true      -- have line numbers be relative
vim.o.ruler          = false     -- don't show cursor position
vim.o.showmode       = false     -- don't show mode in command line
--vim.o.showtabline    = 2         -- always show tabline
vim.o.signcolumn     = 'yes'     -- always show signcolumn or it would frequently shift
vim.o.splitbelow     = true      -- horizontal splits will be below
vim.o.splitright     = true      -- vertical splits will be to the right
vim.o.termguicolors  = true      -- enable gui colors
vim.o.winblend       = 10        -- make floating windows slightly transparent
vim.o.wrap           = false     -- display long lines as just one line

vim.o.listchars      = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
vim.o.cursorlineopt  = 'screenline,number' -- show cursor line only screen line when wrapped
vim.o.breakindentopt = 'list:-1' -- add padding for lists when 'wrap' is on

-- windows ---------------------------------------------------------------------

--vim.o.fillchars = table.concat(
--  { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
--  ','
--)

-- colors ----------------------------------------------------------------------

-- enable syntax highlighing
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end


-- editing =====================================================================

vim.o.autoindent    = true     -- use auto indent
vim.o.expandtab     = true     -- convert tabs to spaces
vim.o.formatoptions = 'qnl1j'  -- improve comment editing
vim.o.ignorecase    = true     -- ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch     = true     -- show search results while typing
vim.o.infercase     = true     -- infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth    = 2        -- use this number of spaces for indentation
vim.o.smartcase     = true     -- don't ignore case when searching if pattern has upper case
vim.o.smartindent   = true     -- make indenting smart
vim.o.tabstop       = 2        -- insert 2 spaces for a tab
vim.o.virtualedit   = 'block'  -- allow going past the end of line in visual block mode

vim.opt.completeopt:append('fuzzy') -- use fuzzy matching for built-in completion
vim.opt.iskeyword:append('-')       -- treat dash separated words as a word text object

vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]] -- define pattern for a start of 'numbered' list


-- spelling ====================================================================

vim.o.spell        = true    -- turn on spelling
vim.o.spelllang    = 'en_us' -- define spelling dictionaries
vim.o.spelloptions = 'camel' -- treat parts of camelCase words as seprate words, snake_case is already treated this way

vim.opt.complete:append('kspell') -- add spellcheck options for autocomplete
vim.opt.complete:remove('t')      -- don't use tags for completion


-- folds =======================================================================

-- vim.o.foldmethod       = 'indent' -- set 'indent' folding method
-- vim.o.foldlevel        = 1        -- display all folds except top ones
-- vim.o.foldnestmax      = 10       -- create folds only for some number of nested levels
-- vim.g.markdown_folding = 1        -- use folding by heading in markdown files

--stylua: ignore end
