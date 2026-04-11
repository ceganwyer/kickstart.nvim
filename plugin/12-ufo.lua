-- [[ UFO ]]
-- Automatic fold generation

vim.pack.add({ vim.g.gh("kevinhwang91/nvim-ufo") })

-- Configuration
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
require("ufo").setup()

-- Keybinds
vim.g.keymap("zR", function()
	require("ufo").openAllFolds()
end, "Open all folds")
vim.g.keymap("zM", function()
	require("ufo").closeAllFolds()
end, "Close all folds")
vim.g.keymap("zr", function()
	require("ufo").openFoldsExceptKinds()
end, "Fold less")
vim.g.keymap("zm", function()
	require("ufo").closeFoldsWith()
end, "Fold more")
vim.g.keymap("zp", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, "Peek fold")
