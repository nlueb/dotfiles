local vim = vim

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'setup.settings'
require 'setup.mappings'
require 'setup.autocmds'

require 'setup.lazy'
