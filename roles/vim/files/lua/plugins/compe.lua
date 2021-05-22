require 'util'
local compe = require 'compe'

local vim = vim

vim.o.completeopt = 'menu,menuone,noselect'

-- Use <C-j> and <C-k> to navigate through popup menu
inoremap('<C-j>', [[pumvisible() ? "<Down>" : "<C-j>"]], {expr = true})
inoremap('<C-k>', [[pumvisible() ? "<Up>" : "<C-k>"]], {expr = true})

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
imap('<CR>', [[compe#confirm("<cr>")]], {expr = true, silent = true})

-- Use Ctrl + Space to toggle completion
inoremap('<C-Space>', [[compe#complete()]], {expr = true, silent = true})

inoremap('<C-e>', [[compe#close('<C-e>')]], {expr = true, silent = true})

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
