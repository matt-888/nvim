local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    -- Load custom file with global snippets first (adjust for Windows)
    gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})

require('mini.completion').setup({
    window = {
    info = { height = 25, width = 80},
    signature = { height = 25, width = 80, border = 'rounded' },
    lsp_completion = { source_func = 'omnifunc' }
  },
})
