require 'util'

-- Highlight yanked region
cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank()]]
