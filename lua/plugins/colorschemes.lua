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
      vim.cmd.colorscheme("nymph")

      -- You can configure highlights by doing something like:
      vim.cmd.hi("Comment gui=none")
    end,
  },
  "folke/tokyonight.nvim",
  "aliqyan-21/darkvoid.nvim",
  "ellisonleao/gruvbox.nvim",
}
