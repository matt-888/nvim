-- mini.extra ==================================================================

require('mini.extra').setup()


-- mini.animate ================================================================

local animate = require('mini.animate')

animate.setup({
  cursor = {
    timing = animate.gen_timing.linear({ duration = 160, unit = 'total' }),
  },
  scroll = { enable = false },
})


-- mini.bracketed ==============================================================

require('mini.bracketed').setup()


-- mini.bufremove ==============================================================

require('mini.bufremove').setup()


-- mini.clue ===================================================================

local miniclue = require('mini.clue')

miniclue.setup({ --stylua: ignore start
  clues = {
    Config.leader_group_clues,
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows({ submode_resize = true }),
    miniclue.gen_clues.z(),
  },
  triggers = {
    { mode = 'n', keys = '<Leader>' }, -- leader triggers
    { mode = 'x', keys = '<Leader>' },
    { mode = 'n', keys = [[\]] },      -- mini.basics
    { mode = 'n', keys = '[' },        -- mini.bracketed
    { mode = 'n', keys = ']' },
    { mode = 'x', keys = '[' },
    { mode = 'x', keys = ']' },
    { mode = 'i', keys = '<C-x>' },    -- Built-in completion
    { mode = 'n', keys = 'g' },        -- `g` key
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = "'" },        -- Marks
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },
    { mode = 'n', keys = '"' },        -- Registers
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
    { mode = 'n', keys = '<C-w>' },    -- Window commands
    { mode = 'n', keys = 'z' },        -- `z` key
    { mode = 'x', keys = 'z' },
  },
  window = {
		config = { border = vim.g.border_style },
		delay = 200,
	},
}) --stylua: ignore end


-- mini.completion =============================================================

-- add back when we can have rounded borders


-- mini.diff ===================================================================

require('mini.diff').setup()

local rhs = function() return MiniDiff.operator('yank') .. 'gh' end
vim.keymap.set('n', 'ghy', rhs, { expr = true, remap = true, desc = "Copy hunk's reference lines" })


-- mini.files ==================================================================

require('mini.files').setup({ windows = { preview = true } })

local minifiles_augroup = vim.api.nvim_create_augroup('ec-mini-files', {})

vim.api.nvim_create_autocmd('User', {
  group = minifiles_augroup,
  pattern = 'MiniFilesWindowOpen',
  callback = function(args) vim.api.nvim_win_set_config(args.data.win_id, { border = vim.g.border_style }) end,
})

vim.api.nvim_create_autocmd('User', {
  group = minifiles_augroup,
  pattern = 'MiniFilesExplorerOpen',
  callback = function()
    MiniFiles.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Config' })
    --MiniFiles.set_bookmark('m', vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim', { desc = 'mini.nvim' })
    --MiniFiles.set_bookmark('p', vim.fn.stdpath('data') .. '/site/pack/deps/opt', { desc = 'Plugins' })
    MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
  end,
})


-- mini.git ====================================================================

require('mini.git').setup()


-- mini.hipatterns =============================================================

local hipatterns = require('mini.hipatterns')
local hi_words = MiniExtra.gen_highlighter.words

hipatterns.setup({
  highlighters = { --stylua: ignore start
    fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
    hack  = hi_words({ 'HACK', 	'Hack',  'hack'  }, 'MiniHipatternsHack'),
    todo  = hi_words({ 'TODO', 	'Todo',  'todo'  }, 'MiniHipatternsTodo'),
    note  = hi_words({ 'NOTE', 	'Note',  'note'  }, 'MiniHipatternsNote'),
    hex_color = hipatterns.gen_highlighter.hex_color(),
  }, --stylua: ignore end
})


-- mini.indentscope ============================================================

local indentscope = require('mini.indentscope')

indentscope.setup({
  draw = {
    delay = 0,
    animation = indentscope.gen_animation.none()
  },
})

-- mini.jump ===================================================================

require('mini.jump').setup()


-- mini.jump2d =================================================================

local jump2d = require('mini.jump2d')

jump2d.setup({
  spotter = jump2d.gen_pattern_spotter('[^%s%p]+'),
  view = { dim = true, n_steps_ahead = 2 },
})


-- mini.map ====================================================================

local map = require('mini.map')
local gen_integr = map.gen_integration
local encode_symbols = map.gen_encode_symbols.block('2x1')

map.setup({
  symbols = { encode = encode_symbols },
  integrations = { gen_integr.builtin_search(), gen_integr.diff(), gen_integr.diagnostic() },
})

vim.keymap.set('n', [[\h]], ':let v:hlsearch = 1 - v:hlsearch<CR>', { desc = 'Toggle hlsearch' })

for _, key in ipairs({ 'n', 'N', '*' }) do
  vim.keymap.set('n', key, key .. 'zv<Cmd>lua MiniMap.refresh({}, { lines = false, scrollbar = false })<CR>')
end


-- mini.pairs =================================================================

require('mini.pairs').setup({ modes = { insert = true, command = true, terminal = true } })
vim.keymap.set('i', '<CR>', 'v:lua.Config.cr_action()', { expr = true })


-- mini.pick ==================================================================

require('mini.pick').setup({ window = { config = { border = vim.g.border_style } } })
vim.ui.select = MiniPick.ui_select
vim.keymap.set('n', ',', [[<Cmd>Pick buf_lines scope='current' preserve_order=true<CR>]], { nowait = true })


-- mini.surround ==============================================================

require('mini.surround').setup({ search_method = 'cover_or_next' })

-- Disable `s` shortcut in n / x modes (use `cl` instead) for safer usage of 'mini.surround'
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')


-- mini.trailspace ============================================================
require('mini.trailspace').setup()


-- mini.visits ================================================================
require('mini.visits').setup()


-- put here to match two file setup
MiniIcons.tweak_lsp_kind()
