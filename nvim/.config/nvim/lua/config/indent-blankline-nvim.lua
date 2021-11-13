local indent = require 'indent_blankline'

indent.setup {
    -- char = '│',
    char_list = {'│', '┆'},
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_current_context = false,
    max_indent_increase = 1,
    buftype_exclude = {
        'terminal',
    },
    filetype_exclude = {
        'help',
        'packer',
        'startify'
    }
}
