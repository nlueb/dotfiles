local vim = vim

local indent = require 'indent_blankline'

indent.setup {
    char = '│',
    -- show_current_context = true,
    buftype_exclude = {'terminal'},
}

vim.g.indentLine_char = '│'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
