-- probably won't be adding much to this for the time being

Config.cr_action = function()
	if vim.fn.pumvisible() ~= 0 then
		local item_selected = vim.fn.complete_info()["selected"] ~= -1
		return item_selected and H.keys["ctrl-y"] or H.keys["ctrl-y_cr"]
	else
		return require("mini.pairs").cr()
	end
end

-- autocommands

-- helper functions ============================================================

_G.keymap = function(mode, keys, cmd, opts)
	opts = opts or {}
	if opts.silent == nil then
		opts.silent = true
	end
	vim.keymap.set(mode, keys, cmd, opts)
end

_G.nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, opts)
end

_G.xmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, opts)
end
