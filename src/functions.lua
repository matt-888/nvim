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
