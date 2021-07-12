local gl = require('galaxyline')
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')

gl.short_line_list = {'NvimTree','vista','dbui','packer', 'startify'}

local schema = require('vn-night.schema').schema

local colors = {
  bg = schema.gray2,
  section_bg = schema.gray3,
  fg = schema.gray10,
  grey = schema.gray4,

  orange = schema.orange;
  yellow = schema.yellow;
  green  = schema.green;
  cyan   = schema.cyan;
  blue   = schema.blue;
  red    = schema.red;
  teal   = schema.teal;
  purple = schema.purple;
}

local mode_color_schema = {
  n = colors.purple,
  i = colors.teal,
  c = colors.orange,
  V = colors.blue,
  [''] = colors.blue,
  v = colors.blue,
  R = colors.red,
}

local mode_color = function()
  return mode_color_schema[vim.fn.mode()]
end

local icons = {
    sep = {
        right = "",
        left = ""
    },
    diagnostic = {
        error = " ",
        warn = " ",
        info = " "
    },
    diff = {
        add = " ",
        modified = " ",
        remove = " "
    },
    git = "",
    file = {
      read_only = '',
      modified = '',
    }
}

local white_space = function() return ' ' end

local function file_name(is_active, highlight_group)
  normal_fg = is_active and colors.fg or colors.grey
  modified_fg = is_active and colors.red or colors.orange
  if vim.bo.modifiable then
    if vim.bo.modified then
      vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. modified_fg)
    else
      vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. normal_fg)
    end
  end
  return fileinfo.get_current_file_name(icons.file.modified, icons.file.read_only)
end

-- --------------------------------------Left side-----------------------------------------------------------
local i = 1
gls.left[i] = {
  FirstElement = {
    provider = function() 
      vim.api.nvim_command('hi GalaxyFirstElement guifg='..mode_color())
      return icons.sep.right
    end,
  },
}

i = i + 1
gls.left[i] = {
  Logo = {
    provider = function()
      vim.api.nvim_command('hi GalaxyLogo guibg='..mode_color())
      return '   ' 
    end,
  },
}

i = i + 1
gls.left[i] = {
  ViMode = {
    provider = function()
      local alias = {
        n       = 'NORMAL ',
        i       = 'INSERT ',
        c       = 'COMMAND',
        V       = 'VISUAL ',
        ['']  = 'VISUAL ',
        v       = 'VISUAL ',
        R       = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color()..' gui=bold')
      return '' .. alias[vim.fn.mode()]
    end,
    highlight = { colors.bg, colors.bg },
    -- separator = icons.sep.left,
    -- separator_highlight = {colors.bg, colors.section_bg},
  },
}

i= i + 1
gls.left[i] = {
  ViModeSep = {
    provider = function()
      vim.api.nvim_command('hi GalaxyViModeSep guifg='..mode_color()..' guibg='..colors.section_bg)
      return icons.sep.left .. ' '
    end,
  },
}

i = i + 1
gls.left[i] ={
  FileIcon = {
    provider = {white_space, 'FileIcon'},
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}

i = i + 1
gls.left[i] = {
  MyFileName = {
    provider = function() return file_name(true, 'GalaxyMyFileName') end,
    highlight = { colors.fg, colors.section_bg },
    separator = icons.sep.left .. ' ',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

i = i + 1
gls.left[i] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = icons.diagnostic.error,
    highlight = {schema.diag.danger.fg, colors.bg}
  }
}

i = i + 1
gls.left[i] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = icons.diagnostic.warn,
    highlight = {schema.diag.warning.fg, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = icons.diagnostic.info,
    highlight = {schema.diag.info.fg, colors.bg},
  }
}

-- ------------------------------------Right side-----------------------------------------------------
local j = 1
gls.right[j] = {
  FirstSeparator = {
    provider = function() return icons.sep.right end,
    highlight = { colors.section_bg, colors.bg },
  }
}

j = j + 1
gls.right[j] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.cyan, colors.section_bg },
  },
}

j = j + 1
gls.right[j] = {
  LastElement = {
    provider = function()
      vim.api.nvim_command('hi GalaxyLastElement guifg='..mode_color())
      return icons.sep.left
    end,
  },
}

-- -------------------------Short status line---------------------------------------
local k = 1
gls.short_line_left[k] = {
  SFirstElement = {
    provider = function() return icons.sep.right end,
    highlight = { colors.grey, 'NONE' },
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg},
  },
}

k = k + 1
gls.short_line_left[k] ={
  SFileIcon = {
    provider = 'FileIcon',
    highlight = { colors.grey, colors.bg },
  },
}

k = k + 1
gls.short_line_left[k] = {
  SMyFileName = {
    provider = function() return file_name(false, 'GalaxySMyFileName') end,
    highlight = {colors.grey, colors.bg},
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg}
  }
}

k = k + 1
gls.short_line_right[k] = {
  SLastElement = {
    provider = function() return icons.sep.left end,
    highlight = { colors.grey, 'NONE' }
  },
}
