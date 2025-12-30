# Neovim Loading Order

This is the order that your Neovim files are loaded:

1. `init.lua` - This is the first file Neovim loads
2. `plugin/packer_compiled.lua` - Loaded automatically because it's in the plugin folder
3. `lua/spes/init.lua` - Loaded because `init.lua` says `require("spes")`
4. `lua/spes/packer.lua` - Loaded because `spes.init` says `require("spes.packer")`
5. `lua/spes/set.lua` - Loaded because `spes.init` says `require("spes.set")`
6. `lua/spes/colorschemeChanges.lua` - Loaded because `spes.init` says `require("spes.colorschemeChanges")`
7. All files in `after/plugin/` folder - Loaded automatically at the end, including:
    Ex:
   - `vimtex.lua`
   - `treesitter.lua`
   - `refactoring.lua`
   - `lsp.lua`
   - `grammarous.lua`
   - `fugitive.lua`
   - `undotree.lua`
   - `telescope.lua`
   - `markdown-preview.lua`
   - `harpoon.lua`
   - `goyo.lua`
