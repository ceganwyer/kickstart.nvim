-- [[ Dependencies ]]
-- Plug-ins that are relied upon by other plugins
-- This file get's loaded first

vim.pack.add({
	vim.g.gh("nvim-lua/plenary.nvim"), -- So many plugins require this it's crazy
	vim.g.gh("MunifTanjim/nui.nvim"),
	vim.g.gh("nvim-telescope/telescope-fzf-native.nvim"),
	vim.g.gh("nvim-telescope/telescope-ui-select.nvim"),
	vim.g.gh("kevinhwang91/promise-async"),
	vim.g.gh("luukvbaal/statuscol.nvim"),
})

if vim.g.have_nerd_font then
	vim.pack.add({ vim.g.gh("nvim-tree/nvim-web-devicons") })
end

local builtin = require("statuscol.builtin")
require("statuscol").setup({
	relculright = true,
	segments = {
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{ text = { "%s" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})
