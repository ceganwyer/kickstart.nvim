return {
  {
    'brenoprata10/nvim-highlight-colors',
    lazy = false,
    keys = {
      { '<leader>tc', '<cmd>HighlightColors Toggle<cr>', desc = '[T]oggle [C]olorizer' },
    },
    opts = {
      render = 'virtual',
      virtual_symbol_position = 'eow',
      virtual_symbol_prefix = ' ',
      virtual_symbol_suffix = '',
    },
  },
}
