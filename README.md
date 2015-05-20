dotfiles
--------

These dotfiles are managed with `stow`

```shell
cd ~
git clone <this repo>
cd ~/dotfiles

stow conky
stow fish
stow terminator
...
```

The `.templates` directory is not meant to be deployed with `stow`, but rather, with the `mkproj.fish` script
