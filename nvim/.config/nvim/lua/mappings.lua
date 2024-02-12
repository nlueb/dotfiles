local vim = vim
local keymap = vim.keymap.set

keymap('n', '\\', [[m'O<esc>0d$`']], {noremap = true })
keymap('n', '<CR>', [[m'o<esc>0d$`']], {noremap = true })
keymap('n', '<Tab>', '>>', {noremap = true })
keymap('n', '<S-Tab>', '<<', {noremap = true })
keymap('n', '<leader>h', '<cmd>lua ShowHighlightCapture()<CR>', {silent = true})
keymap('n', '<leader>n', '<cmd>nohl<CR>', {silent = true})
keymap('n', '<c-k>', vim.lsp.buf.signature_help, {silent = true, noremap = true })
keymap('n', '<c-j>', vim.diagnostic.open_float, {noremap = true })
keymap('n', 'K', vim.lsp.buf.hover, {silent = true, noremap = true })
keymap('n', '<leader>lr', vim.lsp.buf.rename, { silent = true, noremap = true })
keymap('n', '<leader>la', vim.lsp.buf.code_action, { silent = true, noremap = true })
keymap('n', '<leader>lf', vim.lsp.buf.format, { silent = true, noremap = true })
keymap('n', '<leader>ld', vim.lsp.buf.references, { silent = true, noremap = true })
keymap('n', '<leader>dd', [[<cmd>%s/\s\+$//e<cr>]], { silent = true })

keymap('x', '<Tab>', '>gv', {noremap = true })
keymap('x', '<S-Tab>', '<gv', {noremap = true })

keymap('i', '<c-q>', function ()
    local closers = {")", "]", "}", ">", "'", '"', "`", ","}
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local after = line:sub(col + 1, -1)
    local closer_col = #after + 1
    local closer_i = nil
    for i, closer in ipairs(closers) do
        local cur_index, _ = after:find(closer)
        if cur_index and (cur_index < closer_col) then
            closer_col = cur_index
            closer_i = i
        end
    end
    if closer_i then
        vim.api.nvim_win_set_cursor(0, {row, col + closer_col})
    else
        vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end
end, {silent = true})
