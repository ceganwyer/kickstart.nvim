return {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  -- But for many setups, the LSP (`ts_ls`) will work just fine
  -- ts_ls = {},
  --
  rust_analyzer = {
    on_attach = function(client, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          autoReload = true,
        },
        check = {
          command = "clippy",
        },
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        format = {
          defaultConfig = {
            call_arg_parentheses = "keep",
          },
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = {
          disable = { "missing-fields" },
          globals = { "vim", "require" },
        },
      },
    },
  },
}
