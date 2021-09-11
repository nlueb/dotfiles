local vim = vim
local keymap = vim.api.nvim_set_keymap

-- Expand
keymap('s', '<Enter>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<Enter>']], {expr = true, noremap = true})

-- Expand or jump
keymap('i', '<C-l>',   [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '']], {expr = true, noremap = true})
keymap('s', '<C-l>',   [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '']], {expr = true, noremap = true})

-- Jump forward or backward
-- keymap('i', '<C-l>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>']], {expr = true, noremap = true})
-- keymap('s', '<C-l>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>']], {expr = true, noremap = true})
keymap('i', '<C-h>',  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '']], {expr = true, noremap = true})
keymap('s', '<C-h>',  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '']], {expr = true, noremap = true})

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
-- nmap        s   <Plug>(vsnip-select-text)
-- xmap        s   <Plug>(vsnip-select-text)
-- nmap        S   <Plug>(vsnip-cut-text)
-- xmap        S   <Plug>(vsnip-cut-text)
