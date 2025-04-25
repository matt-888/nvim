MiniDeps.add('stevearc/conform.nvim')

require('conform').setup({
  formatters_by_ft = {
    bash = { 'shellharden' },
    sh = { 'shellharden' },
    python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
    julia  = { 'runic' },
    r  = { 'air' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
