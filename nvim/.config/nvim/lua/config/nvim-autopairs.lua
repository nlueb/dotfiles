local npairs = require 'nvim-autopairs'

npairs.setup {
    enable_check_bracket_line = true,
    disable_filetype = { 'TelescopePrompt' , 'vim', 'scheme', 'racket' },
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
    }
}

local ok, cmp = pcall(require, 'cmp')

if ok then
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end
