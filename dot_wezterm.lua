-- ~/.wezterm.lua
local wezterm = require("wezterm")

return {
  default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" },
  font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
  font_size = 14.0,
  color_scheme = "Catppuccin Mocha",
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  window_background_opacity = 0.92,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
}
