# Neovim Config

Originally based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim.git)

The main differences are I split it up into multiple files for my sanity - I cannot stand having everything in one huge file.

Install instructions are on the main repo, only kept dependencies below for my convenience.

### External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`), `tree-sitter`, `fzf`
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/wl-copy/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.
