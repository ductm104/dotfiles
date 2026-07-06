# dotfiles

Clone this repo anywhere and run the installer.

## Install

Run:

```sh
./install.sh
```

The installer works from wherever this repo is cloned. It sources this repo's
`.bashrc` from `~/.bashrc` and links tmux, vim, and screen config files into
your home directory. Existing files are moved into this clone directory with a
`.backup.<timestamp>` suffix before links are created.
