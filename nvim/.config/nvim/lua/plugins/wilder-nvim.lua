local fn = vim.fn

fn['wilder#setup'] {
    modes = {':', '/', '?'}
}

fn['wilder#set_option']('pipeline', {
    fn['wilder#branch'](
        fn['wilder#cmdline_pipeline'] {
            fuzzy = 1,
            set_pcre2_pattern = true,
        },
        fn['wilder#python_search_pipeline'] {
            pattern = 'fuzzy'
        }
    )
})

fn['wilder#set_option']('renderer', {
    fn['wilder#renderer_mux'] {
        [':'] = fn['wilder#popupmenu_renderer'] {
            highlighter = {
                fn['wilder#pcre2_highlighter'](),
                fn['wilder#basic_highlighter'](),
            }
        },
        ['/'] = fn['wilder#popupmenu_renderer'] {
            highlighter = {
                fn['wilder#pcre2_highlighter'](),
                fn['wilder#basic_highlighter'](),
            }
        }
    }
})
