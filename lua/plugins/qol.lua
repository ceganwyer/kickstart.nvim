return {
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  { -- Highlight color codes in buffer
    "brenoprata10/nvim-highlight-colors",
    lazy = false,
    keys = {
      { "<leader>tc", "<cmd>HighlightColors Toggle<cr>", desc = "[T]oggle [C]olorizer" },
    },
    opts = {
      render = "virtual",
      virtual_symbol_position = "eow",
      virtual_symbol_prefix = " ",
      virtual_symbol_suffix = "",
    },
  },
  { -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {},
  },
  { -- Highlight todo, notes, etc in comments

    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      keywords = {
        TODO = { icon = "", color = "#00ffff" },
      },
      highlight = {
        before = "",
        after = "fg",
      },
      gui_style = {
        fg = "BOLD",
        bg = "BOLD",
      },
    },
  },
}
