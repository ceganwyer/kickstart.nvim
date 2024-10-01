--[[
My personal config based on kickstart.nvim.

Took the guts and split it up into multiple files because having everything
  in one file hurts my brain. 

Structure:
  |~/.config/nvim/
  \
   | init.lua - this file; entrypoint for the config
   | lua/ - dir containing rest of config files
   \
    | options.lua - General config options
    | keymaps.lua - General keymaps
    | autocommands.lua - General autocommands
    | lazy-plugins.lua - Lazy boostraping and plugin enabling
    | plugins/ - dir containig plugin definitions
    | lsp/ - dir containing lsp-specific plugins and configurations
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Options ]]
require("options")

-- [[ Helper functions ]]
require("helpers")

-- [[ Plugins ]]
require("lazy-plugins")

-- [[ Keymaps ]]
require("keymaps")

-- [[ Autocommands ]]
require("autocommands")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
