local vim = vim
local keymap = vim.api.nvim_set_keymap

local vim = vim

-- Use <Tab> and <S-Tab> to navigate through popup menu
keymap('i', '<C-j>', [[pumvisible() ? "<C-n>" : "<C-j>"]], {expr = true, noremap = true})
keymap('i', '<C-k>', [[pumvisible() ? "<C-p>" : "<C-k>"]], {expr = true, noremap = true})

-- Use Enter for completion
vim.g.completion_confirm_key = ''
keymap('i', '<CR>', [[pumvisible() ? complete_info()["selected"] != "-1" ? "<Plug>(completion_confirm_completion)" : "<c-e><CR>" : "<CR>"]], {expr = true}, {})
-- imap('<CR>', [[pumvisible() ? complete_info()['selected'] != '-1' ? '<Plug>(completion_confirm_completion)' : '<c-e><CR>' : '<CR><Plug>CloserClose']], {expr = true})

-- Set completeopt to have a better completion experience
set {'completeopt', 'menuone,noinsert,noselect'}

-- Use Ctrl + Space to toggle completion
vim.g.completion_enable_auto_popup = 1
keymap('i', '<C-Space>', [[<Plug>(completion_trigger)]], {silent = true}, {})

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
vim.g.completion_matching_smart_case = 1

-- Use vim-vsnip snippets
vim.g.completion_enable_snippet = 'vim-vsnip'

-- Insert parenthesis when completing methods or functions.
vim.g.completion_enable_auto_paren = 1

-- Change sources whenever the current completion source has no complete items
vim.g.completion_auto_change_source = 1
-- Chain completion
vim.g.completion_chain_complete_list = {
	default = {
		string = {
			{complete_items = {'buffers'}},
			{complete_items = {'path'}, triggered_only = {'/'}},
			{mode = { '<c-p>' }},
			{mode = { '<c-n>' }}
		},
		comment = {
			{complete_items = {'buffers'}},
			{complete_items = {'path'}, triggered_only = {'/'}},
			{mode = { '<c-p>' }},
			{mode = { '<c-n>' }}
		},
		default = {
			{complete_items = {'lsp', 'snippet'}},
			{complete_items = {'path'}, triggered_only = {'/'}},
			{mode = { '<c-p>' }},
			{mode = { '<c-n>' }}
		}
	}
}
