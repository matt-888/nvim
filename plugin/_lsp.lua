-- global config ===============================================================

vim.lsp.config('*', {
  root_markers = { '.git' },
})


-- auto enable lsps ============================================================

for _, path in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
    local name = vim.fn.fnamemodify(path, ':t:r')
    vim.lsp.enable(name)
end


-- aesthetics ==================================================================

vim.diagnostic.config({
  virtual_text = true
})
