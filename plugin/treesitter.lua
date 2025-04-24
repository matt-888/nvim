local ensure_installed = {
	'bash',
	'c',
  'cpp',
  'css',
  'htmldjango',
	'html',
	'javascript',
	'json',
	'julia',
	'lua',
	'markdown',
	'markdown_inline',
	'python',
	'r',
	'regex',
	'rst',
	'rust',
	'tsx',
	'yaml',
	'vim',
	'vimdoc',
}

MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
MiniDeps.add({ source = 'nvim-treesitter/nvim-treesitter-textobjects' })

require('nvim-treesitter.configs').setup({
  ensure_installed = ensure_installed,
  highlight = { enable = true },
  incremental_selection = { enable = false },
  textobjects = { enable = false },
  indent = { enable = false },
})

-- disable injections in 'lua' language
local ts_query = require('vim.treesitter.query')
local ts_query_set = ts_query.set
ts_query_set('lua', 'injections', '')
