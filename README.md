# dotfiles

They're finally organized (for now). I've started using stow to manage my dotfiles using symlinks.
This is also so i don't forget how setup stuff i use when switching machines.

## GNU Stow

If you already have an existing config you want to back up, create your dotfiles repository, 
then run `stow .zshrc --adopt` (CAREFUL with `--adopt`) to set the contents of your dotfiles' `.zshrc` for example, 
to what you have configured at `~/.zshrc`. 
You can also map packages like `wezterm`, `flameshot`, etc. you just need to follow the right directory hierarchy.

### Install on a new machine

If I'm installing on a machine that has an existing configuration for a package, I'll use the `--adopt` directive for stow, then do a `git restore`. Here's what that looks like:
1. Clone the repo and `cd` in there.
2. For each package in the repo that you want symlinked, run `stow <package>`. You will need to use `--adopt` if the package already exists on the machine. This creates a symlink for the package to your dotfiles repo.
3. If you want to use the config you had previously stored in your dotfiles repo, then run `git restore <dir>` or `git restore .` if you're feeling wild.

> `--adopt` flag *will* overwrite the contents of your current directory with the contents from your target directory.

> [!IMPORTANT]  
For sddm configs run stow targeting `/etc` so that `sddm.conf` lands in the right spot: `sudo stow -t /etc sddm`  
Also copy the theme folder directly to `/usr/share/sddm/themes/` so SDDM doesn't run into permission issues trying to read your home directory: `sudo cp -r sddm/themes/silent /usr/share/sddm/themes/`

I've also vibecoded a script to do all of this automagically so we just need to:  
1. Run `./install.sh`
2. Run git diff inside this repository to check what changed
3. If you see default system configs overwriting this repo configs, run `git restore .` to push this repo configs, or `git restore <dir>` for a specific package.


