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
            local function opts(desc)
              return { buffer = bufnr, silent = true, remap = false, desc = desc }
            end

            require("which-key").add({ "<leader>C", group = "[C]argo", icon = { icon = "" } })
            vim.keymap.set("n", "<leader>Ct", crates.toggle, opts("Crates [T]oggle"))
            vim.keymap.set("n", "<leader>Cr", crates.reload, opts("Crates [R]eload"))
            vim.keymap.set("n", "<leader>Cv", crates.show_versions_popup, opts("Crate [V]ersions"))

            vim.keymap.set("n", "<leader>Cu", crates.update_crate, opts("[U]pdate Crate"))
            vim.keymap.set("n", "<leader>CU", crates.upgrade_crate, opts("[U]pgrade Crate"))
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
