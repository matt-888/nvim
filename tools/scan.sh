#! /bin/bash

nvim --headless \
  -c "lua MiniDeps.snap_save(vim.fn.stdpath('config') .. '/tools/mini-deps-snap')" \
  +qa

