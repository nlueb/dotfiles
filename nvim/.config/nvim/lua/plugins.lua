local vim = vim
local cmd = vim.cmd

vim.g.vscode_style = 'dark'
vim.g.vscode_italic_comment = 1

cmd [[ packadd packer.nvim ]]

cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]]

local packer = require 'packer'
local util = require 'packer.util'

-- Use Wrapper {{{
local function file_exists(filename)
    local config_path = vim.fn.expand(
                            '~/.config/nvim/lua/config/' .. filename .. '.lua')
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
                    config = [[require 'config/]] .. config_name .. [[']]
                }
            end
        end
        if type(opts) == 'table' and type(opts[1]) == 'string' then
            config_name = opts[1]:gsub('.*/(.*)', '%1'):gsub('%.', '-')
            if file_exists(config_name) then
                opts.config = [[require 'config/]] .. config_name .. [[']]
            end
        end
        orig_use(opts)
    end
end
--}}}

local function init(use)
-- Init {{{
    local use = use_wrapper(use)
    use { 'wbthomason/packer.nvim', opt = true }
    -- use 'rktjmp/hotpot.nvim'
    use 'antoinemadec/FixCursorHold.nvim'
    use 'lambdalisue/suda.vim'
    use 'lewis6991/impatient.nvim'
--}}}

-- UI {{{
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'mhinz/vim-startify'
    use 'gcmt/taboo.vim'
    use 'winston0410/cmd-parser.nvim'
    use 'winston0410/range-highlight.nvim'
    use 'rcarriga/nvim-notify'
    use 'folke/which-key.nvim'
    use 'folke/trouble.nvim'
    use 'TimUntersberger/neogit'
    use 'sindrets/diffview.nvim'
    use 'j-hui/fidget.nvim'
    use 'simnalamburt/vim-mundo'
    use 'lewis6991/gitsigns.nvim'
--}}}

-- Actions {{{
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-repeat'
    use 'machakann/vim-sandwich'
    use 'junegunn/vim-easy-align'
--}}}

-- Colors {{{
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor',
            'windwp/nvim-ts-autotag',
            'JoosepAlviste/nvim-ts-context-commentstring',
        }
    }
    use 'rktjmp/lush.nvim'
    use 'rktjmp/shipwright.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'Mofiqul/vscode.nvim'
--}}}

-- Languages {{{
    use 'wlangstroth/vim-racket'
    use {
        'Saecki/crates.nvim',
        event = {'BufRead Cargo.toml'},
        requires = 'nvim-lua/plenary.nvim'
    }
--}}}

-- Finder {{{
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'ahmedkhalf/project.nvim'
--}}}

-- Lsp / Completion {{{
    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'onsails/lspkind-nvim'

    use {
        'hrsh7th/nvim-cmp',
        after = 'LuaSnip',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'kdheepak/cmp-latex-symbols',
        },
    }

    use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }
    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
--}}}
end

-- Packer Init {{{
local config = {
    display = {
        open_fn = util.float
    },
    -- compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
    compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua',
}

packer.startup { init, config = config }
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
