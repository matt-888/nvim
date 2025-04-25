return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    '.python-version',
    'pyproject.toml',
    'uv.lock',
  },
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'basic',
      },
    },
  }
}
