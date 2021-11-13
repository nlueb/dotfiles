local colorizer = require 'colorizer'

colorizer.setup ({ '!packer', '*' }, {
    RGB      = true,
    RRGGBB   = true,
    names    = false,
    RRGGBBAA = false,
    rgb_fn   = true,
    hsl_fn   = true,
    css      = false,
    css_fn   = false,
    mode     = 'foreground',
})
