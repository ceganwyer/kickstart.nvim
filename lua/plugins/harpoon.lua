return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- Setup basic keymaps
    vim.g.map("<leader>ha", function() harpoon:list():add() end, "[H]arpoon [A]dd")
    vim.g.map("<leader>1", function() harpoon:list():select(1) end, "Harpoon 1")
    vim.g.map("<leader>2", function() harpoon:list():select(2) end, "Harpoon 2")
    vim.g.map("<leader>3", function() harpoon:list():select(3) end, "Harpoon 3")
    vim.g.map("<leader>4", function() harpoon:list():select(4) end, "Harpoon 4")
    vim.g.map("<leader>h1", function() harpoon:list():replace_at(1) end, "Replace [H]arpoon 1")
    vim.g.map("<leader>h2", function() harpoon:list():replace_at(2) end, "Replace [H]arpoon 2")
    vim.g.map("<leader>h3", function() harpoon:list():replace_at(3) end, "Replace [H]arpoon 3")
    vim.g.map("<leader>h4", function() harpoon:list():replace_at(4) end, "Replace [H]arpoon 4")
    vim.g.map("<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "[H]arpoon [L]ist")
  end,
}
