-- quick startup
require('impatient')

HOME = os.getenv("HOME")

local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Keymapping (most of which is in whichkey config in lua/user/whichkey.lua) --
g.mapleader = ','
g.maplocalleader = ','


-- User settings --
opt.mouse = 'a'
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.ignorecase = true
opt.smartcase = true
opt.softtabstop = 4
opt.relativenumber = true
opt.signcolumn = 'number'
opt.encoding = 'utf-8'
opt.syntax = 'enable'
opt.guifont = 'Hack Nerd Font'
opt.shell = '/bin/zsh'
g.neovide_transparency = 1
g.do_filetype_lua = 1
g.did_load_filetypes = 0
-- g.python3_host_prog = HOME .. '/.local/venv/nvim/Scripts/python.exe'

-- Set colorscheme
opt.termguicolors = true
cmd('colorscheme evokai')
cmd('hi Normal guibg=NONE ctermbg=NONE')


-- Plugins
require('user.plugins')
require('user.whichkey')
require('user.hop')
require('user.nvim-tree')
require('user.lualine')
require('user.bufferline')
require('user.treesitter')
require('user.telescope')
require('user.cmp')
require('user.lsp')
-- require('user.dap')
require('user.trouble')
require('user.gitsigns')
require('user.comment')
-- require('user.neoscroll')
require('user.colorizer')
require('user.autopairs')
require('user.toggleterm')
require('user.project')
require('user.indentline')
require('user.neoclip')
-- require('user.tabnine')
require('user.zen-mode')
-- require('user.pantran')
