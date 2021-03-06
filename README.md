# vn-night

### A dark neovim colorscheme written in lua. Support built-in LSP and [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

# 🌈 Color palette
![core pallete](https://github.com/nxvu699134/vn-night.nvim/blob/main/images/core_pallete.png)
![gray shade](https://github.com/nxvu699134/vn-night.nvim/blob/main/images/gray_pallete.png)


# 🔌 Requirements

- Neovim >= 0.5.0

# ⚡️ Support:

- [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)


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
```

Setup theme for lualine.nvim
```lua
require('lualine').setup {options = {theme = 'vn-night'}}
```

Enable the colorscheme for galaxyline just put this line in your config:
```lua
require('vn-night.galaxyline')
```

# 👀 Preview
![preview](https://github.com/nxvu699134/vn-night.nvim/blob/main/images/Preview.png)

