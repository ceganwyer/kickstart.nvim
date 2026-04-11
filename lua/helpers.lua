-- [[
-- A central location for any global helper functions
-- ]]

-- Keymapping
vim.g.keymap = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Aliases for Github and Codeberg repo
vim.g.gh = function(x)
	return "https://github.com/" .. x
end
vim.g.cb = function(x)
	return "https://codeberg.org/" .. x
end
