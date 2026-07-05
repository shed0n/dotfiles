# dotfiles

They're finally organized (for now). I've started using stow to manage my dotfiles using symlinks.
This is also so i don't forget how setup stuff i use when switching machines.

## GNU Stow

Easiest path:

1. Create `~/git/dotfiles`
2. Create directory structure relative as if the `dotfiles` directory was `~`
3. Move existing files into the dotfiles directory. For example: `mv ~/.config/wezterm/* ~/git/dotfiles/wezterm/.config/wezterm/`
4. `stow wezterm` (or whatever package you added)

```sh
├── flameshot
│   └── .config
│       └── flameshot
│           └── flameshot.ini
├── scripts
│   └── .config
│       └── scripts
│           └── maintenance.sh
├── solaar
│   └── .config
│       └── solaar
│           └── config.yaml
├── starship
│   └── starship.toml
├── wezterm
│   └── .config
│       └── wezterm
│           ├── wezterm.lua
│           └── wezterm.sh
└── zsh
    ├── .config
    │   └── zsh
    │       ├── aliases.zsh
    │       ├── exports.zsh
    │       └── functions.zsh
    └── .zshrc
```

If you already have an existing config you want to back up, create your dotfiles repository, 
then run `stow .zshrc --adopt` (CAREFUL with `--adopt`) to set the contents of your dotfiles' `.zshrc` for example, 
to what you have configured at `~/.zshrc`. 
You can also map packages like `wezterm`, `flameshot`, etc. you just need to follow the right directory hierarchy as shown above.

### Install on a new machine

Typically if I'm installing on a machine that has an existing configuration for a package, I'll use the `--adopt` directive for stow, then do a `git restore`. Here's what that looks like:
1. Clone the repo and `cd` in there.
2. For each package in the repo that you want symlinked, run `stow <package>`. You will need to use `--adopt` if the package already exists on the machine. This creates a symlink for the package to your dotfiles repo.
3. If you want to use the config you had previously stored in your dotfiles repo, then run `git restore <dir>` or `git restore .` if you're feeling wild. If you want to **overwrite** the neovim config you had in your dotfiles repo with the one you have currently at `~/.config/nvim`, then don't do the restore.


> `--adopt` flag *will* overwrite the contents of your current directory with the contents from your target directory.