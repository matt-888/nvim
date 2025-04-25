return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = {
    '.python-version',
    'pyproject.toml',
    'uv.lock',
  },
  init_options = {
    settings = {
      lint = {
        select = { 'E', 'F', 'I', 'B', 'SIM', 'TCH', 'RUF' },
      },
      format = {
        preview = true,
      },
    },
  },
}
