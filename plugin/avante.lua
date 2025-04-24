local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

add({
  source = 'yetone/avante.nvim',
  monitor = 'main',
  depends = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  hooks = { post_checkout = function()
    vim.notify("testmake")
    vim.cmd('make BUILD_FROM_SOURCE=true')
  end
  }
})

--add({ source = 'MeanderingProgrammer/render-markdown.nvim' })

now(function() require('avante_lib').load() end)
--later(function() require('render-markdown').setup({
--  opts = {
--        file_types = { "markdown", "Avante" },
--      },
--      ft = { "markdown", "Avante" },
--}) end)

vim.api.nvim_set_hl(0, 'AvanteSidebarWinSeparator', {
    fg = MiniBase16.config.palette.base05,
    bg = MiniBase16.config.palette.base00
})

later(function()
  require("avante").setup({
    hints = { enabled = false },
    selector = { provider = "mini_pick"},
    web_search_engine = { provider = "google" },
    behaviour = { enable_token_counting = false },
    windows = { sidebar_header = { enabled = false } }
  })
end)
