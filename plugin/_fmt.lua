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

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrailspaceOnSave", { clear = true }),
  callback = function()
    if vim.bo.buftype == "" then
      MiniTrailspace.trim()
    end
  end,
  desc = "remove trailing whitespace on save",
})
