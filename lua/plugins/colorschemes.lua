return {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  {
    "myagko/nymph",
    branch = "Nvim",
    priority = 1000,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme("nymph")

      -- You can configure highlights by doing something like:
      vim.cmd.hi("Comment gui=none")
    end,
  },
  "folke/tokyonight.nvim",
  {
    "aliqyan-21/darkvoid.nvim",
    init = function()
      require("darkvoid").setup({
        glow = true,
        show_end_of_buffer = true,
        colors = {
          bg = "#000000",
          type_builtin = "#8cf8f7",
          plugins = {
            gitsigns = true,
            lualine = true,
            nvim_cmp = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            whichkey = true,
          },
          -- Gitsigns
          added = "#72ef8d",
          removed = "#ef6c78",

          -- Popup menu
          pmenu_bg = "#000000",

          -- LSP diagnostics
          error = "#ff3102",
          warning = "#f1ff10",
          hint = "#75f481",
          info = "#24a2ff",
        },
      })
      vim.cmd.colorscheme("darkvoid")
    end,
  },
  "ellisonleao/gruvbox.nvim",
}
