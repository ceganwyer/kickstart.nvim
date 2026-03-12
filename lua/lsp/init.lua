-- LSP Configuration
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            override_vim_notify = true,
          },
        },
      },

      -- Allows extra capabilities provided by nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "[L]SP: " .. desc })
          end
          local builtin = require("telescope.builtin")

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")

          -- Find references for the word under your cursor.
          map("gr", builtin.lsp_references, "[G]oto [R]eferences")

          -- INFO: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- Register LSP group with whichkey
          -- For some reason if I don't register it here, the icon for the group
          -- doesn't work, probably because this file gets loaded before whickey.lua
          local wk = require("which-key")
          wk.add({
            { "<leader>l", group = "[L]SP" },
          }, {
            mode = { "n" },
          })
          map("<leader>lI", "<cmd>LspInfo<cr>", "[I]nfo")
          map("<leader>la", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })
          map("<leader>lD", builtin.lsp_type_definitions, "Type [D]efinition")
          map("<leader>lh", vim.lsp.buf.signature_help, "Signature [H]elp")
          map("<leader>li", builtin.lsp_implementations, "[I]mplementations")
          map("<leader>lr", vim.lsp.buf.rename, "[R]ename symbol")
          map("<leader>lR", vim.lsp.buf.references, "[R]eferences")
          map("<leader>ls", builtin.lsp_document_symbols, "Document [S]ymbols")
          map("<leader>lw", builtin.lsp_workspace_symbols, "[W]orkspace Symbols")
          map("<leader>lx", "<cmd>LspRestart<cr>", "Restart")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map(
              "<leader>th",
              function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end,
              "[T]oggle Inlay [H]ints"
            )
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Server definitions and configs
      local servers = {
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
        gopls = {
          settings = {
            gopls = {
              hints = {
                parameterNames = true,
                functionTypeParameters = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        rust_analyzer = {
          on_attach = function(_, bufnr) vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
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
        marksman = {},
      }
      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require("mason").setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      for name, server in pairs(servers) do
        -- Print statements for debugging server configs
        -- print(name)
        -- print("settings:", vim.inspect(servers[name]))
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end,
  },
}
