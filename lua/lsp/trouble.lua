return {
  "folke/trouble.nvim",
  opts = {},
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[T]oggle [T]rouble Diagnostics",
    },
    {
      "]t",
      function() require("trouble").next({ skip_groups = true, jump = true }) end,
      desc = "Next [T]rouble item",
    },
    {
      "[t",
      function() require("trouble").prev({ skip_groups = true, jump = true }) end,
      desc = "Previous [T]rouble item",
    },
  },
}
