local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#0A0C09',
  yellow = '#E3FF14',
  cyan = '#193234',
  darkblue = '#243AC3',
  green = '#00F528',
  orange = '#F5CE89',
  purple = '#F78FB4',
  magenta = '#F227F5',
  grey = '#CFD4C7',
  blue = '#0CF5E7',
  red = '#F6335B'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  GitIcon = {
    provider = function() return '[]' end,
    condition = buffer_not_empty,
    highlight = {colors.bg,colors.green},
  }
}
gls.left[2] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.bg,colors.green},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[3] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.green, colors.bg},
    highlight = {colors.green, colors.green}
  }
}

gls.right[1] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '',
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.bg, colors.purple},
  },
}

gls.right[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {colors.bg, colors.purple},
  },
}
gls.right[4] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_not_empty,
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.bg, colors.purple}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.bg, colors.purple},
    highlight = {colors.grey,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.bg, colors.purple},
    highlight = {colors.grey,colors.purple}
  }
}

