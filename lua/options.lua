vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

-- Enable break indent
vim.opt.breakindent = true
vim.opt.wrap = false

-- Save undo history
vim.opt.undofile = true

-- Disable swapfile and backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80"

-- Decrease update time
vim.opt.updatetime = 100

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set default tab size
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Netrw options
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "nu rnu"
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_winsize = 30
