local u = require('vn-night.utils')

function make_schema() 
  -- core colors
  local orange = '#f79617';
  local yellow = '#ffc24b';
  local green  = '#84CE5C';
  local cyan   = '#50EAFA';
  local blue   = '#32b4ff';
  local red    = '#ff3c41';
  local teal   = '#23D4AC';
  local purple = '#a884f3';

  -- gray shade based on #0e1a2a
  -- local gray0 = '#000111';
  -- local gray1 = '#0e1a2a';
  -- local gray2 = '#344050';
  -- local gray3 = '#5B6777';
  -- local gray4 = '#818D9D';
  -- local gray5 = '#A7B3C3';
  -- local gray6 = '#CDD9E9';
  -- local gray7 = '#F3FFFF';

  -- gray shade based on #171831
  local gray0   = '#000111';
  local gray1   = '#171831';
  local gray2   = '#31324B';
  local gray3   = '#4A4B64';
  local gray4   = '#64657E';
  local gray5   = '#7D7E97';
  local gray6   = '#9697B0';
  local gray7   = '#B0B1CA';
  local gray8   = '#CACBE4';
  local gray9   = '#E3E4FD';
  local gray10  = '#FCFDFF';

  --extended colors
  local red1    = '#ff3b30';
  local yellow1 = '#ffcc00';
  local blue1   = '#5ac8fa';

  return {
    none   = 'NONE';

    orange  = orange;
    yellow  = yellow;
    green   = green;
    cyan    = cyan;
    blue    = blue;
    red     = red;
    teal    = teal;
    purple  = purple;

    gray0   = gray0;
    gray1   = gray1;
    gray2   = gray2;
    gray3   = gray3;
    gray4   = gray4;
    gray5   = gray5;
    gray6   = gray6;
    gray7   = gray7;
    gray8   = gray8;
    gray9   = gray9;
    gray10  = gray10;

    diag  = {
      danger  = { fg = red1;    bg = u.rgba_to_rgb(red1, gray1, 0.16) };
      warning = { fg = yellow1; bg = u.rgba_to_rgb(yellow1, gray1, 0.16) };
      info    = { fg = blue1;   bg = u.rgba_to_rgb(blue1, gray1, 0.16) };
      hint    = { fg = blue1;   bg = u.rgba_to_rgb(blue1, gray1, 0.16) };
    };

    -- Functionality colors
    bg            = gray1;
    bg_popup      = gray7;
    bg_highlight  = u.rgba_to_rgb(blue, gray1, 0.3);
    bg_visual     = u.rgba_to_rgb(blue, gray1, 0.4);
    fg            = gray9;
    fg_disabled   = gray4;
    fg_invert     = gray0;
  }
end

local schema = make_schema();
return {
  schema = schema;
}
