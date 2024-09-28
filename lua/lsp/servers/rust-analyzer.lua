local on_attach = function(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

return {
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        autoReload = true,
      },
      check = {
        command = 'clippy',
      },
    },
  },
}
