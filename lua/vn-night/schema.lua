local u = require('vn-night.utils')

function reverse(t)
  local ret = {}
  local n = #t
  local i = 1
  for i = 0, n-1 do
    ret[i+1] = t[n-i]
  end
  return ret
end

local function make_schema(light)
  local base_gray = {
    u.hsl_to_hex(236, 41, 8),
    u.hsl_to_hex(238, 44, 14), --base
    u.hsl_to_hex(236, 39, 23),
    u.hsl_to_hex(237, 34, 30),
    u.hsl_to_hex(235, 28, 39),
    u.hsl_to_hex(236, 22, 49),
    u.hsl_to_hex(235, 23, 60),
    u.hsl_to_hex(235, 27, 70),
    u.hsl_to_hex(237, 31, 80),
    u.hsl_to_hex(235, 33, 89),
    u.hsl_to_hex(235, 36, 96),
  }

  local colors = {
    none    = 'NONE',
    -- core colors
    orange = light and u.hsl_to_hex(32 , 98, 42) or u.hsl_to_hex(34 , 93, 53),
    yellow = light and u.hsl_to_hex(42 , 80, 28) or u.hsl_to_hex(40 , 99, 65),
    green  = light and u.hsl_to_hex(102, 74, 32) or u.hsl_to_hex(99 , 54, 58),
    cyan   = light and u.hsl_to_hex(184, 81, 36) or u.hsl_to_hex(186, 94, 65),
    blue   = light and u.hsl_to_hex(205, 76, 46) or u.hsl_to_hex(202, 99, 60),
    red    = light and u.hsl_to_hex(350, 84, 42) or u.hsl_to_hex(358, 92, 62),
    teal   = light and u.hsl_to_hex(168, 80, 30) or u.hsl_to_hex(166, 72, 48),
    purple = light and u.hsl_to_hex(259, 70, 54) or u.hsl_to_hex(259, 82, 74),

    gray = light and reverse(base_gray) or base_gray
  }

  colors.bg            =  colors.gray[2]
  colors.bg_popup      =  colors.gray[3]
  colors.bg_popup_sel  =  colors.gray[5]
  colors.bg_highlight  =  u.rgba_to_rgb(colors.blue,    colors.bg,     0.3)
  colors.bg_visual     =  u.rgba_to_rgb(colors.blue,    colors.bg,     0.4)
  colors.fg            =  colors.gray[10]
  colors.fg_disabled   =  colors.gray[5]
  colors.fg_invert     =  colors.gray[1]
  colors.fg_popup      =  colors.gray[10]

  colors.diag = {
    danger   =  {  fg  =  colors.red,     bg  =  u.rgba_to_rgb(colors.red,     colors.bg,  0.16)  },
    warning  =  {  fg  =  colors.yellow,  bg  =  u.rgba_to_rgb(colors.yellow,  colors.bg,  0.16)  },
    info     =  {  fg  =  colors.blue,    bg  =  u.rgba_to_rgb(colors.blue,    colors.bg,  0.16)  },
    hint     =  {  fg  =  colors.gray[10],    bg  =  u.rgba_to_rgb(colors.gray[10], colors.bg,  0.16)  },
  };


  return colors;
end

return {make_schema = make_schema}
