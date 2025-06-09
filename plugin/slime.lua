MiniDeps.add("jpalardy/vim-slime")

vim.g.slime_target = "tmux"
vim.g.slime_bracketed_paste = 1
vim.g.slime_default_config = { socket_name = "default", target_pane = "{top-left}" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_python_ipython = 1
vim.g.slime_no_mappings = 1
