# Executer.nvim

### This is a simple project executer for NeoVim written in *lua*
This plugin has default support for multiple languages and tools. And you can customize you project's build/run `cmd`
by generating `.ExecuterConf.json` file.

### Install with packer
```lua
use 'scott-astatine/Executer.nvim'
```

### How to use this plugin?
```lua
require('Executer.nvim').runProject() -- To run the project.
require('Executer.nvim').buildProject() -- To build your project.
require('Executer.nvim').generateConfig() -- Genetates json config file with default config that you can use to provide your own run/build cmd.
```

### Kemaps
```lua
local ops = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>lr', ':lua require('Executer.nvim').runProject()', ops)
keymap('n', '<leader>lb', ':lua require('Executer.nvim').buildProject()', ops)
keymap('n', '<leader>lg', ':lua require('Executer.nvim').generateConfig()', ops)
```

### or.. if you use *WhichKey* then
```lua
//... other WhichKey keymappings

l = {
    name = "LangSpec",
    r = {"<cmd>lua require('Executer').runProject()<cr>", "Run Project"},
    b = {"<cmd>lua require('Executer').buildProject()<cr>", "Build Project"},
    g = {"<cmd>lua require('Executer').generateConfig()<cr>", "Gen Project run/build conf"},
}
//... maps
```


