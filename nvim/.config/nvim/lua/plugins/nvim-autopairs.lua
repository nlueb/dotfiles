local npairs = require 'nvim-autopairs'
local npairs_cmp = require "nvim-autopairs.completion.cmp"

npairs.setup {
    enable_check_bracket_line = true,
    disable_filetype = { "TelescopePrompt" , "vim" },
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
    }
}

npairs_cmp.setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = true, -- automatically select the first item
})
