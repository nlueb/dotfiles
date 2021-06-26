require 'util'

-- Expand
smap('<Enter>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<Enter>']], {expr = true})

-- Expand or jump
imap('<C-l>',   [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '']], {expr = true})
smap('<C-l>',   [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '']], {expr = true})

-- Jump forward or backward
-- imap('<C-l>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>']], {expr = true})
-- smap('<C-l>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>']], {expr = true})
imap('<C-h>',  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '']], {expr = true})
smap('<C-h>',  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '']], {expr = true})

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
-- nmap        s   <Plug>(vsnip-select-text)
-- xmap        s   <Plug>(vsnip-select-text)
-- nmap        S   <Plug>(vsnip-cut-text)
-- xmap        S   <Plug>(vsnip-cut-text)
