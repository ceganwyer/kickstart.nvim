-- [[ Quality of Life Plugins ]]
-- Various plugins that offer slight QOL improvements
vim.pack.add({
	vim.g.gh("tpope/vim-sleuth"), -- Detect tabstop and shiftwidth automatically
	vim.g.gh("brenoprata10/nvim-highlight-colors"),
	-- Add indentation guides even on blank lines
	vim.g.gh("j-hui/fidget.nvim"),
	vim.g.gh("lukas-reineke/indent-blankline.nvim"),
	vim.g.gh("rachartier/tiny-cmdline.nvim"),
	vim.g.gh("folke/todo-comments.nvim"),
	vim.g.gh("folke/trouble.nvim"),
	vim.g.gh("folke/twilight.nvim"),
	vim.g.gh("folke/zen-mode.nvim"),
})

-- nvim-highlight-colors config and keymaps
require("nvim-highlight-colors").setup({
	render = "virtual",
	virtual_symbol_position = "eow",
	virtual_symbol_prefix = " ",
	virtual_symbol_suffix = "",
})
vim.g.keymap("<leader>tc", "<CMD>HighlightColors Toggle<CR>", "[T]oggle [C]olorizer")

-- Tiny-cmdline.nvim config and keymaps
vim.o.cmdheight = 0
require("tiny-cmdline").setup({})

-- Fidget.nvim config
require("fidget").setup({
	notification = {
		override_vim_notify = true,
		window = {
			avoid = { "NvimTree" },
		},
	},
})

-- folke/todo-comments.nvim config and keymaps
require("todo-comments").setup({
	signs = false,
	keywords = {
		TODO = { icon = "", color = "#00ffff" },
	},
	highlight = {
		before = "",
		after = "fg",
	},
	gui_style = {
		fg = "BOLD",
		bg = "BOLD",
	},
})
vim.g.keymap("]t", function()
	require("todo-comments").jump_next()
end, "Next todo comment")
vim.g.keymap("[t", function()
	require("todo-comments").jump_prev()
end, "Previous todo comment")

-- folke/trouble.nvim config and keymaps
require("trouble").setup({
	modes = {
		test = {
			type = "split",
			relative = "win",
			position = "right",
			size = 0.3,
			mode = "diagnostics",
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.3,
			},
		},
	},
})
vim.g.keymap("<leader>tt", "<CMD>Trouble diagnostics toggle<CR>", "[T]oggle [T]rouble Diagnostics")
vim.g.keymap("]t", function()
	require("trouble").next({ skip_groups = true, jump = true })
end, "Next [T]rouble item")
vim.g.keymap("[t", function()
	require("trouble").prev({ skip_groups = true, jump = true })
end, "Previous [T]rouble item")

-- folke/twilight.nvim config and keymaps
vim.g.keymap("<leader>tT", "<CMD>Twilight<CR>", "[T]oggle [T]wilight Mode")

-- folke/zen-mode.nvim config and keymaps
vim.g.keymap("<leader>tz", "<CMD>ZenMode<CR>", "[T]oggle [Z]en Mode")
