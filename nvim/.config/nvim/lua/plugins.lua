local vim = vim
local cmd = vim.cmd

local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

cmd [[ packadd packer.nvim ]]

local PackerUserConfig = create_augroup('PackerUserConfig', { clear = false })
create_autocmd('BufWritePost', {
    group = PackerUserConfig,
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile'
})

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
--    use 'gcmt/taboo.vim'
--    use 'winston0410/cmd-parser.nvim'
--    use 'winston0410/range-highlight.nvim'
    use 'rcarriga/nvim-notify'
    -- use 'folke/which-key.nvim'
--    use 'folke/trouble.nvim'
--    use 'TimUntersberger/neogit'
--    use 'sindrets/diffview.nvim'
    use 'j-hui/fidget.nvim'
--    use 'simnalamburt/vim-mundo'
    use 'lewis6991/gitsigns.nvim'
    use 'elihunter173/dirbuf.nvim'
--}}}

-- Actions {{{
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-repeat'
    use 'machakann/vim-sandwich'
    use 'junegunn/vim-easy-align'
--}}}

-- Colors {{{
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' }
    use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }

    use 'rktjmp/lush.nvim'
    use 'rktjmp/shipwright.nvim'
    use 'norcalli/nvim-colorizer.lua'

    use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }
--}}}

-- Languages {{{
--    use 'wlangstroth/vim-racket'
--    use {
--        'Saecki/crates.nvim',
--        event = {'BufRead Cargo.toml'},
--        requires = 'nvim-lua/plenary.nvim'
--    }
--    use 'ckipp01/stylua-nvim'
--}}}

-- Finder {{{
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
--    use 'ahmedkhalf/project.nvim'
--}}}

-- Lsp / Completion {{{
    use 'L3MON4D3/LuaSnip'

    use { 'hrsh7th/nvim-cmp', after = 'LuaSnip' }

    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
    use { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }

    use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }

    use 'lukas-reineke/lsp-format.nvim'

    use { 'neovim/nvim-lspconfig', after = { 'lsp-format.nvim', 'cmp-nvim-lsp' } }

--    -- use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
--    use 'mfussenegger/nvim-lint'
    use 'ray-x/lsp_signature.nvim'
--}}}

-- Debugging {{{
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
-- }}}

-- Snippets {{{
    use 'rafamadriz/friendly-snippets'
-- }}}
end

-- Packer Init {{{
local config = {
    display = {
        open_fn = util.float
    },
    compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua',
}

packer.startup { init, config = config }
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
