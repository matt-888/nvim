-- stylua: ignore start

-- general =====================================================================

-- helper functions
local keymap      = _G.keymap
local nmap_leader = _G.nmap_leader
local xmap_leader = _G.xmap_leader

-- move inside completion list with <TAB>
keymap("i", [[<Tab>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
keymap("i", [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- better command history navigation
keymap("c", "<C-p>", "<Up>", { silent = false })
keymap("c", "<C-n>", "<Down>", { silent = false })

-- stop highlighting of search results
keymap("n", [[\h]], ":let v:hlsearch = 1 - v:hlsearch<CR>", { desc = "toggle hlsearch" })

-- paste before/after linewise
keymap({ "n", "x" }, "[p", '<Cmd>exe "put! " . v:register<CR>', { desc = "paste above" })
keymap({ "n", "x" }, "]p", '<Cmd>exe "put "  . v:register<CR>', { desc = "paste below" })


-- leader ======================================================================

-- global table ----------------------------------------------------------------

-- structure of tables is taken to be compatible with 'mini.clue'

_G.Config.leader_group_clues = {
  { mode = 'n', keys = '<Leader>a', desc = '+avante' },
  { mode = 'n', keys = '<Leader>b', desc = '+buffers' },
  { mode = 'n', keys = '<Leader>e', desc = '+explore' },
  { mode = 'n', keys = '<Leader>f', desc = '+find' },
  { mode = 'n', keys = '<Leader>l', desc = '+lsp' },
  { mode = 'n', keys = '<Leader>m', desc = '+map' },
  --{ mode = 'n', keys = '<Leader>o', desc = '+other' },
  { mode = 'n', keys = '<Leader>s', desc = '+special' }, -- specific language tools
  { mode = 'n', keys = '<Leader>t', desc = '+tabs' },
  { mode = 'n', keys = '<Leader>v', desc = '+visits' },
  { mode = 'n', keys = '<Leader>w', desc = '+windows' },
  { mode = 'x', keys = '<Leader>l', desc = '+lsp' },
}

-- misc ------------------------------------------------------------------------------------------------------
nmap_leader('<leader>', '<Plug>SlimeParagraphSend', 'send paragraph')
xmap_leader('<leader>', '<Plug>SlimeRegionSend',    'send selection')

-- b for buffer ----------------------------------------------------------------------------------------------
nmap_leader('ba', '<Cmd>b#<CR>',                                 'alternate')
nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<CR>',         'delete')
nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  'delete!')
nmap_leader('bs', '<Cmd>lua Config.new_scratch_buffer()<CR>',    'scratch')
nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<CR>',        'wipeout')
nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', 'wipeout!')

-- e for explore / edit ---------------------------------------------------------------------------
nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>',                             'directory')
nmap_leader('ef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', 'file directory')
nmap_leader('ei', '<Cmd>edit $MYVIMRC<CR>',                                    'edit init.lua')
--nmap_leader('eq', '<Cmd>lua Config.toggle_quickfix()<CR>',                     'quickfix')

-- f for find (mini.pick) -------------------------------------------------------------------------
nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>',                      '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>',                      '":" history')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>',               'added hunks (all)')
nmap_leader('fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>',      'added hunks (current)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>',                                'buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>',                            'commits (all)')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>',                   'commits (current)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>',                 'diagnostic workspace')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>',             'diagnostic buffer')
nmap_leader('ff', '<Cmd>Pick files<CR>',                                  'files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>',                              'grep live')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>',                 'grep current word')
nmap_leader('fh', '<Cmd>Pick help<CR>',                                   'help tags')
nmap_leader('fH', '<Cmd>Pick hl_groups<CR>',                              'highlight groups')
nmap_leader('fl', '<Cmd>Pick buf_lines scope="all"<CR>',                  'lines (all)')
nmap_leader('fL', '<Cmd>Pick buf_lines scope="current"<CR>',              'lines (current)')
nmap_leader('fm', '<Cmd>Pick git_hunks<CR>',                              'modified hunks (all)')
nmap_leader('fM', '<Cmd>Pick git_hunks path="%"<CR>',                     'modified hunks (current)')
nmap_leader('fr', '<Cmd>Pick resume<CR>',                                 'resume')
nmap_leader('fp', '<Cmd>Pick projects<CR>',                               'projects')
nmap_leader('fR', '<Cmd>Pick lsp scope="references"<CR>',                 'references (lsp)')
nmap_leader('fs', '<Cmd>Pick lsp scope="workspace_symbol"<CR>',           'symbols workspace (lsp)')
nmap_leader('fS', '<Cmd>Pick lsp scope="document_symbol"<CR>',            'symbols buffer (lsp)')
nmap_leader('fv', '<Cmd>Pick visit_paths cwd="" preserve_order=true<CR>', 'visit paths (all)')
nmap_leader('fV', '<Cmd>Pick visit_paths preserve_order=true<CR>',        'visit paths (cwd)')

-- l for lsp (and format) -------------------------------------------------------------------------
nmap_leader('la', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', 'arguments popup')
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>',  'diagnostics popup')
--nmap_leader('lf', 'conform.format()',                           'format')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.hover()<CR>',          'information')
nmap_leader('lj', '<Cmd>lua vim.diagnostic.goto_next()<CR>',   'next diagnostic')
nmap_leader('lk', '<Cmd>lua vim.diagnostic.goto_prev()<CR>',   'prev diagnostic')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>',     'references')
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>',         'rename')
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>',     'source definition')
--xmap_leader('lf', formatting_cmd,                              'format selection')

-- m for map --------------------------------------------------------------------------------------
nmap_leader('mc', '<Cmd>lua MiniMap.close()<CR>',        'close')
nmap_leader('mf', '<Cmd>lua MiniMap.toggle_focus()<CR>', 'focus (toggle)')
nmap_leader('mo', '<Cmd>lua MiniMap.open()<CR>',         'open')
nmap_leader('mr', '<Cmd>lua MiniMap.refresh()<CR>',      'refresh')
nmap_leader('ms', '<Cmd>lua MiniMap.toggle_side()<CR>',  'side (toggle)')
nmap_leader('mt', '<Cmd>lua MiniMap.toggle()<CR>',       'toggle')

-- o for other ------------------------------------------------------------------------------------

-- s for special ----------------------------------------------------------------------------------
-- define in /after/ftplugin

-- t for tabs -------------------------------------------------------------------------------------
-- gt gT #gt
nmap_leader('tn', '<Cmd>tabnew<CR>',     'new')
nmap_leader('tc', '<Cmd>tabc<CR>',       'close')
nmap_leader('to', '<Cmd>tabo<CR>',       'close other')
--nmap_leader('td', '<Cmd>tabdo<CR>',       'do')

-- v for visits -----------------------------------------------------------------------------------
nmap_leader('vv', '<Cmd>lua MiniVisits.add_label("core")<CR>',    'add "core" label')
nmap_leader('vV', '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'remove "core" label')
nmap_leader('vl', '<Cmd>lua MiniVisits.add_label()<CR>',          'add label')
nmap_leader('vL', '<Cmd>lua MiniVisits.remove_label()<CR>',       'remove label')
local map_pick_core = function(keys, cwd, desc)
  local rhs = function()
    local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
    MiniExtra.pickers.visit_paths({ cwd = cwd, filter = 'core', sort = sort_latest }, { source = { name = desc } })
  end
  nmap_leader(keys, rhs, desc)
end
map_pick_core('vc', '',  'core visits (all)')
map_pick_core('vC', nil, 'core visits (cwd)')

-- w for windows ---------------------------------------------------------------------------------------------
nmap_leader('wv', '<Cmd>vsplit<CR>',                   'vertical')
nmap_leader('wh', '<Cmd>split<CR>',                    'horizontal')
nmap_leader('wt', '<C-w>T',                            'tab')
nmap_leader('wc', '<Cmd>close<CR>',                    'close')
nmap_leader('wm', '<Cmd>wincmd _ | wincmd |<CR>',      'max')
nmap_leader('w_', '<C-w>_',                            'max vertical')
nmap_leader('w|', '<C-w>|',                            'max vertical')
nmap_leader('w=', '<C-w>=',                            'reset')

-- stylua: ignore end
