local function hex_to_rgb(hex)
  local hex_in_decimal = tonumber(string.sub(hex, 2), 16)
  local mask = 255
  return {
    r = bit.band(bit.rshift(hex_in_decimal, 16), mask),
    g = bit.band(bit.rshift(hex_in_decimal, 8), mask),
    b = bit.band(hex_in_decimal, mask),
  }
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02X%02X%02X", r, g, b)
end

local function rgba_to_rgb(color_hex, background, alpha)
  -- Docs
  -- https://ciechanow.ski/alpha-compositing/
  local c = hex_to_rgb(color_hex)
  local bg = hex_to_rgb(background)
  local new_r = (1 - alpha) * bg.r + alpha * c.r
  local new_g = (1 - alpha) * bg.g + alpha * c.g
  local new_b = (1 - alpha) * bg.b + alpha * c.b
  return rgb_to_hex(new_r, new_g, new_b)
end

local function hsl_to_hex(h, s, l)
  s = s / 100
  l = l / 100
  local function k(n)
    return (n + h / 30) % 12
  end
  local a = s * math.min(l, 1 - l)
  local function f(n)
    return l - a * math.max(-1, math.min(k(n) - 3, math.min(9 - k(n), 1)))
  end
  return rgb_to_hex(math.floor(255 * f(0) + 0.5), math.floor(255 * f(8) + 0.5), math.floor(255 * f(4) + 0.5))
end

function highlight(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' '.. sp)
end

return {
  hex_to_rgb = hex_to_rgb;
  rgba_to_rgb = rgba_to_rgb;
  highlight = highlight;
  hsl_to_hex = hsl_to_hex;
}
