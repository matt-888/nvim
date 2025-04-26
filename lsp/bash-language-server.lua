return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = {},
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)"
    }
  }
}
