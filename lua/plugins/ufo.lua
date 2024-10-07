return { -- Automatic fold generation
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          relculright = true,
          segments = {
            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
            { text = { "%s" }, click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
        vim.fn.sign_define("DiagnosticSignError", { text = "󰅙", texthl = "DiagnosticError" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticHint" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
      end,
    },
  },
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
      function() require("ufo").openFoldsExceptKinds() end,
      "Fold less",
    },
    {
      "zm",
      function() require("ufo").closeFoldsWith() end,
      "Fold more",
    },
    {
      "zp",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
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
