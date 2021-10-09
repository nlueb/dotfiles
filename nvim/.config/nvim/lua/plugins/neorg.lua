local neorg = require 'neorg'

neorg.setup {
    -- Tell Neorg what modules to load
    load = {
        ['core.defaults'] = {}, -- Load all the default modules
        ['core.norg.concealer'] = {
            config = {
                icons = {
                    quote = {
                        enabled = true,
                        icon = '>'
                    }
                }
            }
        },
        ['core.norg.dirman'] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    my_workspace = '~/Documents/org/'
                }
            }
        },
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-cmp' -- We current support nvim-compe and nvim-cmp only
            }
        }
    }
}
