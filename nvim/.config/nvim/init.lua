local vim = vim

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

function _G.IsWSL()
    local version = vim.fn.readfile('/proc/version', '', 1)
    if vim.tbl_isempty(version) then
        error('Could not read /proc/version')
    end
    return string.find(version[1], 'microsoft')
end

require('setup.settings')
require('setup.mappings')
require('setup.autocmds')

require('setup.lazy')
