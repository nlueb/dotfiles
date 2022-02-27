local lspsig = require 'lsp_signature'

lspsig.setup {
    bind = true,
    floating_window = true,
    -- floating_window_above_cur_line = true,
    hint_enable = false,
    doc_lines = 0,
    fix_pos = true,
    handler_opts = {
        border = "none"
    }
}
