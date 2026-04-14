# Neovim Config

Originally based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim.git)

Mostly the same, but it has been split up into multiple files and updated for Nvim 0.12

Install instructions are on the kickstart repo

### External Dependencies

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`), `tree-sitter`, `fzf`
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/wl-copy/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.
