local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    default_cursor_style = "BlinkingBlock",
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    font_size = 10.0,
}
--config.color_scheme = 'London Tube (base16)'
config.color_scheme = 'Solarized Darcula (Gogh)'

config.colors = {
    background = '#222d32',
    cursor_bg = '#d3d7cf',
    selection_bg = '#32383E',
}

config.window_frame = {
  inactive_titlebar_bg = '#222d32',
  active_titlebar_bg = '#222d32',
  inactive_titlebar_fg = '#c2cee5',
  active_titlebar_fg = '#c2cee5',
  inactive_titlebar_border_bottom = '#222d32',
  active_titlebar_border_bottom = '#222d32',
  button_fg = '#c2cee5',
  button_bg = '#222d32',
  button_hover_fg = '#222d32',
  button_hover_bg = '#c2cee5',
}

config.keys = {
    -- paste from the clipboard
    { 
      key = 'v',
      mods = 'CTRL',
      action = wezterm.action.PasteFrom 'Clipboard' 
    },
    -- paste from the primary selection
    {
      key = 'V', 
      mods = 'CTRL|SHIFT', 
      action = wezterm.action.PasteFrom 'Clipboard' 
    },
    -- copy to the clipboard
    {
      key = 'C',
      mods = 'CTRL',
      action = wezterm.action.CopyTo 'Clipboard'
    },
    -- This will create a new split and run your default program inside it
    {
      key = 'o',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'e',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
  }

return config
