-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function mygroup(name)
  return augroup("clayton_" .. name, { clear = true })
end

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = mygroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Trim whitespace on save
autocmd({ "BufWritePre" }, {
  group = mygroup("trim"),
  pattern = "*",
  command = [[%s/\s+$//e]],
})

-- Reload files on change
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group =  mygroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Auto-enable word wrap and spellcheck on text filetypes
autocmd("FileType", {
  group = mygroup("wrap_spell"),
  pattern = { "text", "plaintext", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
