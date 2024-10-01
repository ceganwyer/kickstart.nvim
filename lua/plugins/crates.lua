return {
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
          on_attach = function(client, bufnr)
            local crates = require("crates")
            local function opts(desc) return { buffer = bufnr, silent = true, remap = false, desc = desc } end

            require("which-key").add({
              { "<leader>C", group = "[C]argo", icon = { cat = "filetype", name = "rust" } },
              {
                "<leader>Ct",
                function() crates.toggle() end,
                desc = "Crates [T]oggle",
                buffer = bufnr,
                silent = true,
                remap = false,
                icon = { cat = "filetype", name = "rust" },
              },
              {
                "<leader>Cr",
                function() crates.reload() end,
                desc = "Crates [R]eload",
                buffer = bufnr,
                silent = true,
                remap = false,
                icon = { cat = "filetype", name = "rust" },
              },
              {
                "<leader>Cv",
                function() crates.show_versions_popup() end,
                desc = "Crates [V]ersions",
                buffer = bufnr,
                silent = true,
                remap = false,
                icon = { cat = "filetype", name = "rust" },
              },
              {
                "<leader>Cu",
                function() crates.update_crate() end,
                desc = "[U]pdate Crate",
                buffer = bufnr,
                silent = true,
                remap = false,
                icon = { cat = "filetype", name = "rust" },
              },
              {
                "<leader>CU",
                function() crates.upgrade_crate() end,
                desc = "[U]pgrade Crate",
                buffer = bufnr,
                silent = true,
                remap = false,
                icon = { cat = "filetype", name = "rust" },
              },
            })
          end,
        },
        completion = {
          cmp = {
            enabled = true,
          },
        },
      })
    end,
  },
}
