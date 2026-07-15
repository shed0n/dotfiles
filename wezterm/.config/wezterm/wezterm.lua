local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    default_cursor_style = "BlinkingBlock",
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    font_size = 10.0,
    scrollback_lines = 15000,
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
    -- copy to the clipboard
    {
      key = 'c',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CopyTo 'Clipboard'
    },
    -- paste from the clipboard
    { 
      key = 'v',
      mods = 'CTRL',
      action = wezterm.action.PasteFrom 'Clipboard' 
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
    -- saves the terminal history by writing current pane scrollback to a file
    {
      key = 's',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.EmitEvent('save-scrollback'),
    },
  }

wezterm.on('save-scrollback', function(window, pane)
  -- 15000 lines to match scrollback size
  local text = pane:get_lines_as_text(15000)
  local home = os.getenv("HOME")
  local timestamp = os.date("%Y-%m-%d_%H-%M-%S")
  local file_path = home .. "/Downloads/terminal_history_" .. timestamp .. ".txt"
  -- write the text to the file
  local file = io.open(file_path, "w")
  if file then
    file:write(text)
    file:close()
    -- show a quick notification to show it worked
    window:toast_notification("WezTerm", "Terminal history saved to " .. file_path, nil, 2000)
  end
end)

return config
