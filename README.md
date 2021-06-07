# vn-night

### A dark neovim colorscheme written in lua. Support built-in LSP and [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

# 🔌 Requirements
```
Neovim >= 0.5.0

[Galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) if you use this plugin for statusline
```
# 📥 Installation
```vim
" Vim-Plug
Plug 'nxvu699134/vn-night.nvim'
```

```lua
-- Packer
use {'nxvu699134/vn-night.nvim'}
```

# 🔨 Usage

Enable the colorscheme:
```vim 
"Vim-Script:
colorscheme vn-night
```

```lua
--Lua:
require('vn-night').setup()
--or
vim.cmd('colorscheme vn-night')
```

Enable the colorscheme for galaxyline just put this line in your config:
```lua
require('vn-night.galaxyline')
```

# 👀 Preview
![preview](https://github.com/nxvu699134/vn-night.nvim/blob/main/Preview.png)

