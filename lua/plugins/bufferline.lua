return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Epxplorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    },
  },
}
