local opt = vim.opt

-- Set line numbers, enable mouse support, and hide mode
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.termguicolors = true -- true color support

-- Enable break indent
opt.breakindent = true
opt.wrap = false

-- Save undo history
opt.undofile = true

-- Disable swapfile and backup
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.local/state/nvim"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true


-- Keep signcolumn on by default and enable colorcolumn
opt.signcolumn = "yes"
opt.colorcolumn = "100"

-- Decrease update time
opt.updatetime = 100

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 250

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true
opt.winminwidth = 5

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Tab behaviour configuration
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Netrw options
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "nu rnu"
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_winsize = 30

-- Enable new UI
require("vim._core.ui2").enable({})
