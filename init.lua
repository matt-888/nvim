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


-- mini.nvim ===================================================================

add({ name = 'mini.nvim', checkout = 'HEAD' })
now(function()   dofile(vim.fn.stdpath('config') .. '/mini/now.lua')   end)
later(function() dofile(vim.fn.stdpath('config') .. '/mini/later.lua') end)


-- language tools ==============================================================

--now(function() source('lsp.lua') end)
--now(function() source('completion.lua') end)
