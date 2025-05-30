MiniDeps.add({
  source = 'saghen/blink.cmp',
  depends = {
    'rafamadriz/friendly-snippets',
    --'mgalliou/blink-cmp-tmux'
  },
  checkout = 'v1.1.1'
})

require("blink.cmp").setup({

  fuzzy = {
    implementation = 'lua',
    sorts = {
      'exact',
      'score',
      'sort_text'
    }
  },

  sources = {
    default = {
      'lsp', 'path', 'snippets', 'buffer',
      --'tmux'
    },
    providers = {
          --tmux = {
          --  module = "blink-cmp-tmux",
          --  name = "tmux",
          --},
  },
  },

  keymap = {
    preset = 'enter',
    ['<Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then return cmp.snippet_forward()
        else return cmp.select_next() end
      end,
      'snippet_forward',
      'fallback'
    },
    ['<S-Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then return cmp.snippet_backward()
        else return cmp.select_prev() end
      end,
      'snippet_backward',
      'fallback'
    },
  },

  completion = {
    trigger = { show_in_snippet = true },
    menu = {
      min_width = 1,
      scrollbar = false,
      draw = {
        columns = { { 'label', 'label_description', 'kind_icon', gap = 1 } },
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          }
        }
    }
    },
    documentation = {
      auto_show = true,
    }
  },

})
