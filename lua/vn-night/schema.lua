local u = require('vn-night.utils')

function make_schema() 
  local colors = {
    none    = 'NONE';
    -- core colors
     orange = '#f79617';
     yellow = '#ffc24b';
     green  = '#84CE5C';
     cyan   = '#50EAFA';
     blue   = '#32b4ff';
     red    = '#ff3c41';
     teal   = '#23D4AC';
     purple = '#a884f3';

     gray0   = '#000111';
     gray1   = '#171831'; --base
     gray2   = '#31324B';
     gray3   = '#4A4B64';
     gray4   = '#64657E';
     gray5   = '#7D7E97';
     gray6   = '#9697B0';
     gray7   = '#B0B1CA';
     gray8   = '#CACBE4';
     gray9   = '#E3E4FD';
     gray10  = '#FCFDFF';

    --extended colors
    red1    = '#ff3b30';
    yellow1 = '#ffcc00';
    blue1   = '#5ac8fa';
  }

  colors.diag = {
    danger  = { fg = colors.red1;    bg = rgba_to_rgb(colors.red1, colors.gray1, 0.16) };
    warning = { fg = colors.yellow1; bg = rgba_to_rgb(colors.yellow1, colors.gray1, 0.16) };
    info    = { fg = colors.blue1;   bg = rgba_to_rgb(colors.blue1, colors.gray1, 0.16) };
    hint    = { fg = colors.blue1;   bg = rgba_to_rgb(colors.blue1, colors.gray1, 0.16) };
  };

  colors.bg            = colors.gray1;
  colors.bg_popup      = rgba_to_rgb(colors.purple, colors.bg, 0.2);
  colors.bg_popup_sel  = rgba_to_rgb(colors.purple, colors.bg_popup, 0.8);
  colors.bg_highlight  = rgba_to_rgb(colors.blue, colors.gray1, 0.3);
  colors.bg_visual     = rgba_to_rgb(colors.blue, colors.gray1, 0.4);
  colors.fg            = colors.gray9;
  colors.fg_disabled   = colors.gray4;
  colors.fg_invert     = colors.gray0;
  colors.fg_popup      = colors.gray9;

  return colors;
end

local schema = make_schema();
return {
  schema = schema;
}
