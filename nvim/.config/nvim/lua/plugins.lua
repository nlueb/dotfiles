require 'util'

cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

local packer = require 'packer'
local util = require 'packer.util'

local function init(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Patches
    use 'antoinemadec/FixCursorHold.nvim'

    -- Colorscheme
    -- use {'tjdevries/colorbuddy.vim', config = [[require 'plugins/colorbuddy']]}
    -- use {
    -- 	'rose-pine/neovim',
    -- 	as = 'rose-pine',
    -- 	config = [[require 'plugins/rose-pine']]
    -- }

    -- Git
    use 'lambdalisue/gina.vim'

    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = [[require 'plugins/indent-blankline']]
    }

    use {
        'machakann/vim-sandwich'
        -- config = [[require 'plugins/sandwich']]
    }
    -- use 'rstacruz/vim-closer'
    use { 'cohama/lexima.vim' }
    use {'alvan/vim-closetag', config = [[require 'plugins/closetag']]}
    -- use {'jiangmiao/auto-pairs', config = [[require 'plugins/auto-pairs']]}

    use {
        'tversteeg/registers.nvim',
        config = [[require 'plugins/registers']]
    }
    -- use 'junegunn/vim-peekaboo'
    use 'junegunn/vim-easy-align'

    -- Visualize undo tree
    use 'simnalamburt/vim-mundo'

    use {'mhinz/vim-startify', config = [[require 'plugins/startify']]}

    -- File Drawers
    -- use {'kyazdani42/nvim-tree.lua', config =[[require 'plugins/tree']]}
    use {
        'lambdalisue/fern.vim',
        config = [[require 'plugins/fern']],
        requires = {
            'lambdalisue/fern-hijack.vim',
            'lambdalisue/fern-renderer-nerdfont.vim',
            'lambdalisue/nerdfont.vim',
        },
    }

    -- Highlight chars for f and t motions
    -- use 'unblevable/quick-scope'

    -- View and search LSP symbols, tags in Vim/NeoVim.
    -- use 'liuchengxu/vista.vim'

    -- Syntax
    use 'rktjmp/lush.nvim'
    use 'sheerun/vim-polyglot'
    use 'vmchale/dhall-vim'
    -- use 'wlangstroth/vim-racket'
    use {
        'sunjon/shade.nvim',
        config = [[require 'plugins/shade']]
    }

    use {'gcmt/taboo.vim', config = [[require 'plugins/taboo']]}

    use 'tweekmonster/startuptime.vim'

    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[require 'plugins/treesitter']],
        requires = {
            'romgrk/nvim-treesitter-context',
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor',
        },
    }

    use {
        'neovim/nvim-lspconfig',
        -- after = {'lsp-status.nvim'},
        config = [[require 'plugins/lsp']],
    }

    -- use {
    -- 	'kosayoda/nvim-lightbulb',
    -- 	config = [[require 'plugins/lightbulb']]
    -- }

    use {
        'onsails/lspkind-nvim',
        config = [[require 'plugins/lspkind']]
    }

    use 'nvim-lua/lsp-status.nvim'

    -- use {
    -- 	'nvim-lua/completion-nvim',
    -- 	config = [[require 'plugins/completion']],
    -- 	requires = {'steelsojka/completion-buffers'},
    -- }

    use {'hrsh7th/nvim-compe', config = [[require 'plugins/compe']]}

    use {
        'hrsh7th/vim-vsnip',
        config = [[require 'plugins/vsnip']],
        requires = {'golang/vscode-go', 'microsoft/vscode-python', 'keyring/vsc-lua'},
    }

    use {'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip'}

    -- use {'RishabhRD/popfix', run = 'make'}

    -- use {
    -- 	'RishabhRD/nvim-lsputils',
    -- 	config = [[require 'plugins/lsputils']],
    -- 	after = 'popfix',
    -- }

    use {'glepnir/lspsaga.nvim', config = [[require 'plugins/lspsaga']]}
    use {
        "folke/trouble.nvim",
        config = [[require 'plugins/trouble']]
    }

    use {
        "ray-x/lsp_signature.nvim"
    }

    use {
        'rrethy/vim-hexokinase',
        run = [[make hexokinase]],
        config = [[require 'plugins/haxokinase']],
    }

    use {
        'nvim-telescope/telescope.nvim',
        config = [[require 'plugins/telescope']],
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    }

    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        config = [[require 'plugins/fzy']],
    }

    use {'kyazdani42/nvim-web-devicons', config = [[require 'plugins/devicons']]}

    use {'bfredl/nvim-luadev', config = [[require 'plugins/luadev']]}

    use {
        'lewis6991/gitsigns.nvim',
        config = [[require 'plugins/gitsigns']],
        requires = 'nvim-lua/plenary.nvim',
    }

    use {'lambdalisue/suda.vim', config = [[require 'plugins/suda']]}

    use 'Shougo/deol.nvim'
end

local config = {display = {open_fn = util.float}}

packer.startup {init, config = config}
--vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
