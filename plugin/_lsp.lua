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

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = vim.g.border_style
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
  virtual_text = true
})
