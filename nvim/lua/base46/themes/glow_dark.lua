-- glow_dark : 高亮增强版 OneDark + 高对比 + 透明背景

local M = {}

M.base_30 = {
  white = "#f0f3fa",           -- 更亮白色
  darker_black = "#262a33",
  black = "#2a2e38",           -- 主背景（建议设为透明）
  black2 = "#323640",
  one_bg = "#383c46",
  one_bg2 = "#464b57",
  one_bg3 = "#505662",
  grey = "#646a76",
  grey_fg = "#788090",
  grey_fg2 = "#9aa0ad",
  light_grey = "#c2c8d4",
  red = "#ff6f6f",
  baby_pink = "#ff9cb0",
  pink = "#ffacd0",
  line = "#3c414b",
  green = "#b4f88f",
  vibrant_green = "#a7ffa3",
  nord_blue = "#9ad3ff",
  blue = "#84caff",
  yellow = "#fff59d",
  sun = "#ffe58c",
  purple = "#e1b0ff",
  dark_purple = "#c999ff",
  teal = "#70e1ff",
  orange = "#ffc78e",
  cyan = "#a6edff",
  statusline_bg = "#353944",
  lightbg = "#3f434e",
  pmenu_bg = "#84caff",
  folder_bg = "#84caff",
}

M.base_16 = {
  base00 = "#2a2e38", -- background
  base01 = "#464b57",
  base02 = "#5e6470",
  base03 = "#788090",
  base04 = "#9aa0ad",
  base05 = "#f0f3fa", -- foreground（正文变亮）
  base06 = "#f5f7fb",
  base07 = "#ffffff",
  base08 = "#ff6f6f", -- red
  base09 = "#ffb877", -- orange
  base0A = "#fff59d", -- yellow
  base0B = "#b4f88f", -- green
  base0C = "#70e1ff", -- cyan
  base0D = "#84caff", -- blue
  base0E = "#e1b0ff", -- purple
  base0F = "#d66b6b", -- dark red
}

M.type = "dark"

M = require("base46").override_theme(M, "glow_dark")

return M
