-- stylua: ignore start

-- initialization ==============================================================

-- enable neovim autoloader ----------------------------------------------------

pcall(function() vim.loader.enable() end)

-- define config table and paths -----------------------------------------------

_G.Config = {}

local path_package = vim.fn.stdpath('data') .. '/site/'
local path_source =  vim.fn.stdpath('config') .. '/src/'
local mini_path =    path_package .. '/pack/deps/start/mini.nvim'

-- ensure mini.nvim is set up --------------------------------------------------

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

-- define helpers --------------------------------------------------------------

require('mini.deps').setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local source = function(path) dofile(path_source .. path) end


-- settings, functions & mappings ==============================================

now(function() source('options.lua') end)
now(function() source('functions.lua') end)
now(function() source('mappings.lua') end)


-- mini.nvim ===================================================================

add({ name = 'mini.nvim', checkout = 'HEAD' })
now(function()   source('mini/now.lua')   end)
later(function() source('mini/later.lua') end)


-- plugins =====================================================================

-- avante: ai powered editing
later(function() source('plugins/avante.lua') end)

-- treesitter: advanced syntax parsing, highlighting & text objects
later(function() source('plugins/treesitter.lua') end)

-- mason: lsp / formater / linter package manager
later(function() source('plugins/mason.lua') end)

-- cmp: completion
later(function() source('plugins/cmp.lua') end)

-- conform: formatting
later(function() source('plugins/formatter.lua') end)

-- lspconfig: language server configurations
later(function() source('plugins/lspconfig.lua') end)

-- slime: send buffer code to repl
later(function() source('plugins/slime.lua') end)

-- tmux: tmux navigation
later(function() source('plugins/tmux.lua') end)

-- stylua: ignore end
