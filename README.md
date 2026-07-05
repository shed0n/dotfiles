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

> [!WARNING] 
> The `--adopt` flag *will* overwrite the contents of your current
> directory with the contents from your target directory. Please be careful.

## Doom Emacs

To get the clipboard working on x11, you need `xclip` installed. I think I installed it with
1. `<M-x> package install`
2. `xclip`

Just make sure it's on your system and you should be able to use your system clipboard with emacs.

On Mac you need `pbcopy` which you can install with `<M-x> package`.

``` emacs-lisp
;; use system clipboard
(require 'pbcopy)
(turn-on-pbcopy)
```

I think you should be able to just yoink my doom emacs config then run `doom
sync`. There may be some missing packages, but you should be able to install
them with `<M-x> package-install`.

## Neovim

1. If you have an existing neovim installation, delete any existing runtime dir
   you have for neovim to prevent errors in your new version.
   `usr/local/nvim/runtime`. See :checkhealth of your current neovim install to
   confirm what the path is on your machine.
2. [Install the nightly version of neovim][nightly] - I have some plugins, I
   can't remember which ones (treesitter maybe?) that require the nightly
   version of neovim as they use the latest features. I just install from
   source.
3. [Install Packer][packer] - this is the package manager I use for lua
   dotfiles.
4. Run `nvim`
5. Type `:PackerSync` or `:PackerInstall` (need to double check this on a
   *fresh* install) - This will install all of your nvim plugins.
6. You may have to run `:TSUpdate` 'cause treesitter is fussy,

[blog]: https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
[packer]: https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart
[nightly]: https://github.com/neovim/neovim/releases/nightly

## Tmux

1. [Install tpm][tpm]
2. Add plugins to `~/.tmux.conf`
3. Run tmux (or reload tmux env `tmux source ~/.tmux.conf`)
4. Install plugins with `prefix + I` (capital i)

[tpm]: https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation

