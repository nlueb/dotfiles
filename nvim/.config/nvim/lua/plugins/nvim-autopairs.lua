local npairs = require 'nvim-autopairs'

npairs.setup {
    enable_check_bracket_line = true,
    disable_filetype = { "TelescopePrompt" , "vim" },
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
    }
}
