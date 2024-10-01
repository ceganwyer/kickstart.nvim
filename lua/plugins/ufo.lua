return { -- Automatic fold generation
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufRead",
  keys = {
    {
      "zR",
      function() require("ufo").openAllFolds() end,
      "Open all folds",
    },
    {
      "zM",
      function() require("ufo").closeAllFolds() end,
      "Close all folds",
    },
    {
      "zr",
      function() require("ufo").openFoldExceptKinds() end,
      "Fold less",
    },
    {
      "zm",
      function() require("ufo").closeFoldsWith() end,
      "Fold more",
    },
    {
      "zp",
      function() require("ufo").peekFoldedLinesUnderCursor() end,
      "Peek fold",
    },
  },
  config = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    require("ufo").setup()
  end,
}
