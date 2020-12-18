require 'util'

cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

local packer = require 'packer'
local util = require 'packer.util'

local function init(use)
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Colorscheme
	use 'pgdouyon/vim-yin-yang'
	use {
		'tjdevries/colorbuddy.vim',
		config = [[require 'plugins/colorbuddy']]
	}

	use 'tpope/vim-commentary'
	use 'tpope/vim-repeat'
	use 'tpope/vim-fugitive'
	
	use 'machakann/vim-sandwich'

	use 'junegunn/vim-peekaboo'
	use 'junegunn/vim-easy-align'

	-- Highlight chars for f and t motions
	-- use 'unblevable/quick-scope'

	-- View and search LSP symbols, tags in Vim/NeoVim.
	-- use 'liuchengxu/vista.vim'

	-- Syntax
	use 'sheerun/vim-polyglot'
	use 'vmchale/dhall-vim'

	use {
		'vim-airline/vim-airline',
		config = [[require 'plugins/airline']],
		requires = 'vim-airline/vim-airline-themes'
	}

	use {'gcmt/taboo.vim', config = [[require 'plugins/taboo']]}

	use 'tweekmonster/startuptime.vim'

	use {
		'nvim-treesitter/nvim-treesitter',
		config = [[require 'plugins/treesitter']],
		requires = {
			'romgrk/nvim-treesitter-context',
			'nvim-treesitter/playground',
			'nvim-treesitter/nvim-treesitter-textobjects'
		}
	}

	use {
		'neovim/nvim-lspconfig',
		after = 'completion-nvim',
		config = [[require 'plugins/lsp']],
	}

	use {
		'nvim-lua/completion-nvim',
		config = [[require 'plugins/completion']]
	}

	use {
		'hrsh7th/vim-vsnip-integ',
		disable = true
	}

	use {
		'hrsh7th/vim-vsnip',
		disable = true,
		after = 'vim-vsnip-integ',
		config = [[require 'plugins/vsnip']]
	}

	use {
		'RishabhRD/popfix',
		run = 'make'
	}

	use {
		'RishabhRD/nvim-lsputils',
		config = [[require 'plugins/lsputils']],
		after = 'popfix'
	}

	use {
		'rrethy/vim-hexokinase',
		run = [[make hexokinase]],
		config = [[require 'plugins/haxokinase']]
	}

	use {
		'nvim-telescope/telescope.nvim',
		config = [[require 'plugins/telescope']],
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	use {
		'kyazdani42/nvim-web-devicons',
		config = [[require 'plugins/devicons']]
	}

	use {
		'bfredl/nvim-luadev',
		config = [[require 'plugins/luadev']]
	}

end

local config = {
	display = {
		open_fn = util.float
	}
}

packer.startup {init, config = config}
