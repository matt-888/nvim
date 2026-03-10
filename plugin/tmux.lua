MiniDeps.add("alexghergh/nvim-tmux-navigation")

require("nvim-tmux-navigation").setup({
	disable_when_zoomed = true, -- defaults to false
	keybindings = {
		left = "<C-h>",
		down = "<C-a>",
		up = "<C-e>",
		right = "<C-k>",
		last_active = "<C-\\>",
		next = "<C-Space>",
	},
})
