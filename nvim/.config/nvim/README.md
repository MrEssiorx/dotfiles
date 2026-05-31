# Restructured Neovim config

This is a cleaned-up version of your current config with nearly the same behavior.

## Structure

- `init.lua` — entry point, only load order
- `lua/core/` — generic Neovim behavior
- `lua/plugins/` — plugin lists grouped by topic
- `lua/config/` — configuration of individual plugins
- `ftplugin/` — mappings/settings specific to a filetype

## Migration

Copy the contents of this directory into `~/.config/nvim`.

On first start, `lazy.nvim` will bootstrap itself and then install your plugins.

## Notes

- `lazy-lock.json` was not regenerated here. Keep using your existing one if you want the same plugin versions.
- If you want machine-specific overrides later, a common pattern is to add `lua/local.lua` and load it with `pcall(require, "local")`.
