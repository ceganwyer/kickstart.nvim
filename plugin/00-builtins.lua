vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")

vim.g.keymap("<leader>tU", "<CMD>Undotree<CR>", "[T]oggle [U]ndo Tree")
