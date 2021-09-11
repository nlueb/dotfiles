local vim = vim
local keymap = vim.api.nvim_set_keymap

local compe = require 'compe'

vim.o.completeopt = 'menu,menuone,noselect'

-- Use <C-j> and <C-k> to navigate through popup menu
keymap('i', '<C-j>', [[pumvisible() ? "<Down>" : "<C-j>"]], {expr = true, noremap = true})
keymap('i', '<C-k>', [[pumvisible() ? "<Up>" : "<C-k>"]], {expr = true, noremap = true})

vim.api.nvim_exec([[
	function! PerformCR()
		if pumvisible()
			if complete_info()["selected"] != "-1"
				call compe#confirm()
			else
				call AutoPairsReturn()
			endif
		else
			call AutoPairsReturn()
		endif
	endfunction
]], false)
-- Use Enter for completion
-- imap('<CR>', [[PerformCR()]], {expr = true, silent = true})
-- imap('<CR>', [[pumvisible() ? complete_info()["selected"] != "-1" ? "<c-o>:call compe#confirm()<cr>" : "<c-o>:call compe#close()<cr>" : "<CR>"]], {expr = true, silent = true})
keymap('i', '<CR>', [[compe#confirm(lexima#expand('<LT>CR>', 'i'))]], {expr = true, silent = true}, {})

-- Use Ctrl + Space to toggle completion
keymap('i', '<C-Space>', [[compe#complete()]], {expr = true, silent = true, noremap = true})

keymap('i', '<C-e>', [[compe#close('<C-e>')]], {expr = true, silent = true, noremap = true})

compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  allow_prefix_unmatch = false,

  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = false,
    snippets_nvim = false,
  },
}
