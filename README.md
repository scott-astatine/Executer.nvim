# Executer.nvim

### This is a simple project executer for NeoVim written in *lua*

### Install with packer
```lua
use 'scott-astatine/Executer.nvim'
```

### How to use?
```lua
require('Executer.nvim').runProject() -- To run the project.
require('Executer.nvim').buildProject() -- To build your project.
require('Executer.nvim').generateConfig() -- Genetates json config that you can use to provide your own run/build cmd.
```
