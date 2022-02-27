local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = 'all',
    highlight = { enable = true },
    indent = { enable = true },

-- Refactor {{{
    refactor = {
        highlight_definitions = { enable = true },
    },
--}}}

-- Textobjects {{{
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
--}}}

-- Playground {{{
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
--}}}

-- Autotag {{{
    autotag = {
        enable = true,
        filetypes = {
            'html', 'xml', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'
        },
    },
--}}}

-- Context Comments {{{
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
            cuda = { __default = '// %s', __multiline = '/* %s */' }
        }
    }
--}}}

}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
