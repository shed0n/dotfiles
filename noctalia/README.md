### Configs for new noctalia v5

`palettes` folder contains custom themes, must be placed on `.config/noctalia`

`settings.toml` are general configs, unlike v4 which had `settings.json` on `.config/noctalia`, 
in v5 the global config is located on `.local/state/noctalia/settings.toml`, 
we can have settings.toml on `.config/noctalia` to overwrite the default config as well 
but changes made in the GUI are saved on .local only so it's better to place the settings in there to avoid future issues. 
