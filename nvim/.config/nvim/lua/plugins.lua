local vim = vim
local cmd = vim.cmd

cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

local packer = require 'packer'
local util = require 'packer.util'

local function file_exists(filename)
    local config_path = vim.fn.expand(
                            '~/.config/nvim/lua/plugins/' .. filename .. '.lua')
    local config_readable = vim.fn.filereadable(config_path) == 1
    return config_readable
end

local function use_wrapper(orig_use)
    return function(opts)
        local config_name
        if type(opts) == 'string' then
            config_name = opts:gsub('.*/(.*)', '%1'):gsub('%.', '-')
            if file_exists(config_name) then
                opts = {
                    opts,
                    config = [[require 'plugins/]] .. config_name .. [[']]
                }
            end
        end
        if type(opts) == 'table' and type(opts[1]) == 'string' then
            config_name = opts[1]:gsub('.*/(.*)', '%1'):gsub('%.', '-')
            if file_exists(config_name) then
                opts.config = [[require 'plugins/]] .. config_name .. [[']]
            end
        end
        orig_use(opts)
    end
end

local function init(use)
    local use = use_wrapper(use)

    -- Packer can manage itself as an optional plugin
    use {
        'wbthomason/packer.nvim',
        opt = true
    }

    -- Patches
    use 'antoinemadec/FixCursorHold.nvim'

    -- Git
    use 'lambdalisue/gina.vim'

    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'machakann/vim-sandwich'
    use 'nacro90/numb.nvim'
    -- use 'cohama/lexima.vim'

    -- use 'tversteeg/registers.nvim'
    use 'junegunn/vim-easy-align'

    -- Visualize undo tree
    use 'simnalamburt/vim-mundo'

    use 'mhinz/vim-startify'

    -- File Drawers
    -- use {'kyazdani42/nvim-tree.lua', config =[[require 'plugins/tree']]}
    -- use {
    --     'lambdalisue/fern.vim',
    --     requires = {
    --         'lambdalisue/fern-hijack.vim',
    --         'lambdalisue/fern-renderer-nerdfont.vim', 'lambdalisue/nerdfont.vim'
    --     }
    -- }

    -- Highlight chars for f and t motions
    -- use 'unblevable/quick-scope'

    -- View and search LSP symbols, tags in Vim/NeoVim.
    -- use 'liuchengxu/vista.vim'

    -- Syntax
    use 'rktjmp/lush.nvim'
    use 'sheerun/vim-polyglot'
    use 'vmchale/dhall-vim'
    use 'sunjon/shade.nvim'

    use 'gcmt/taboo.vim'

    -- use 'tweekmonster/startuptime.vim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'romgrk/nvim-treesitter-context', 'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor'
        }
    }

    use 'folke/lua-dev.nvim'

    use 'neovim/nvim-lspconfig'

    use 'onsails/lspkind-nvim'

    use 'nvim-lua/lsp-status.nvim'

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'kdheepak/cmp-latex-symbols',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'ray-x/cmp-treesitter',
            'hrsh7th/cmp-cmdline',
        }
    }

    use 'L3MON4D3/LuaSnip'

    -- use {
    --     'hrsh7th/vim-vsnip',
    --     requires = {
    --         'golang/vscode-go', 'microsoft/vscode-python', 'keyring/vsc-lua'
    --     }
    -- }

    -- use {
    --     'hrsh7th/vim-vsnip-integ',
    --     after = 'vim-vsnip'
    -- }

    -- use {'RishabhRD/popfix', run = 'make'}

    -- use {
    -- 	'RishabhRD/nvim-lsputils',
    -- 	config = [[require 'plugins/lsputils']],
    -- 	after = 'popfix',
    -- }

    -- use 'glepnir/lspsaga.nvim'
    use 'folke/trouble.nvim'

    -- use 'ray-x/lsp_signature.nvim'

    use {
        'rrethy/vim-hexokinase',
        run = [[make hexokinase]]
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use 'kyazdani42/nvim-web-devicons'

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Smooth scrolling
    -- use 'karb94/neoscroll.nvim'

    use 'folke/which-key.nvim'

    use {
        'Saecki/crates.nvim',
        event = {'BufRead Cargo.toml'},
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use 'rcarriga/nvim-notify'

    use {
        'nvim-neorg/neorg',
        after = 'nvim-treesitter'
    }

    use 'AndrewRadev/splitjoin.vim'
    use 'andymass/vim-matchup'

    -- use {
    --     'gelguy/wilder.nvim',
    --     run = ':UpdateRemotePlugins'
    -- }

    use 'folke/twilight.nvim'

    use 'lambdalisue/suda.vim'
end

local config = {
    display = {
        open_fn = util.float
    }
}

packer.startup { init, config = config }
