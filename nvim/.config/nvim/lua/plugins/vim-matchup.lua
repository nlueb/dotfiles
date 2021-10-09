local vim = vim

vim.g.matchup_matchparen_offscreen = {
    method = 'popup'
}

vim.g.matchup_surround_enabled = 1
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_hi_surround_always = 1

-- 0 matching is enabled within strings and comments
-- 1 recognize symbols within comments
-- 2 don't recognize anything in comments
vim.g.matchup_delim_noskips = 0
