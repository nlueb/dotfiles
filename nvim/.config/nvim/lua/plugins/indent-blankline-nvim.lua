local vim = vim

local indent = require 'indent_blankline'

indent.setup {
    char = '│',
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_current_context = false,
    buftype_exclude = {
        'terminal',
    },
    filetype_exclude = {
        'help',
        'packer',
        'startify'
    }
}
