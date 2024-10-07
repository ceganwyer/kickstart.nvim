return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {
      preset = "helix",
      keys = {
        scroll_up = "<M-k>",
        scroll_down = "<M-j>",
      },
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
        rules = {
          { pattern = "%[b%]uffer", icon = "󰈔", color = "azure" },
          { pattern = "%[c%]ode", icon = "", color = "cyan" },
          { pattern = "%[f%]ind", icon = "", color = "green" },
          { pattern = "%[h%]arpoon", icon = "", color = "blue" },
          { pattern = "%[d%]ebug", icon = "󰃤 ", color = "red" },
          { pattern = "%[t%]oggle", icon = " ", color = "yellow" },
          { pattern = "%[w%]indow", icon = " ", color = "blue" },
        },
      },
      sort = { "local", "group", "alphanum", "mod" },
      -- Document existing key chains
      spec = {
        { "<leader>b", group = "[B]uffer" },
        { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
        { "<leader>d", group = "[D]ebug" },
        { "<leader>g", group = "[G]it", mode = { "n", "v" }, icon = { cat = "filetype", name = "git" } },
        { "<leader>h", group = "[H]arpoon" },
        { "<leader>hr", group = "[H]arpoon [R]eplace" },
        { "<leader>l", group = "[L]SP" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>f", group = "[F]ind" },
        { "<leader>w", group = "[W]indow" },
        { "<leader>t", group = "[T]oggle" },
      },
      win = {
        title_pos = "center",
      },
    },
  },
}
