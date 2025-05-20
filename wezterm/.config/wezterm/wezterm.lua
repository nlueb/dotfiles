local wezterm = require 'wezterm'
local act = wezterm.action

return {
    --[[ term = 'xterm-256color', ]]
    color_scheme = 'mellow',
    -- colors = {
    --     -- The default text color
    --     foreground = '#CDD6F4',
    --     -- The default background color
    --     background = '#000000',
    --
    --     -- Overrides the cell background color when the current cell is occupied by the
    --     -- cursor and the cursor style is set to Block
    --     cursor_bg = '#CDD6F4',
    --     -- Overrides the text color when the current cell is occupied by the cursor
    --     cursor_fg = '#1E1E2E',
    --     -- Specifies the border color of the cursor when the cursor style is set to Block,
    --     -- or the color of the vertical or horizontal bar when the cursor style is set to
    --     -- Bar or Underline.
    --     cursor_border = '#6a9955',
    --
    --     -- the foreground color of selected text
    --     selection_fg = 'none',
    --     -- the background color of selected text
    --     selection_bg = '#45475A',
    --
    --     ansi = {
    --         '#6C7086',
    --         '#F38BA8',
    --         '#A6E3A1',
    --         '#F9E2AF',
    --         '#89B4FA',
    --         '#F5C2E7',
    --         '#89DCEB',
    --         '#CDD6F4',
    --     },
    --     brights = {
    --         '#7F849C',
    --         '#F38BA8',
    --         '#A6E3A1',
    --         '#F9E2AF',
    --         '#89B4FA',
    --         '#F5C2E7',
    --         '#89DCEB',
    --         '#CDD6F4',
    --     },
    --
    --     -- Arbitrary colors of the palette in the range from 16 to 255
    --     --[[ indexed = { [136] = '#af8700' }, ]]
    --
    --     -- Since: 20220319-142410-0fcdea07
    --     -- When the IME, a dead key or a leader key are being processed and are effectively
    --     -- holding input pending the result of input composition, change the cursor
    --     -- to this color to give a visual cue about the compose state.
    --     compose_cursor = 'orange',
    --
    --     -- Colors for copy_mode and quick_select
    --     -- available since: 20220807-113146-c2fee766
    --     -- In copy_mode, the color of the active text is:
    --     -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    --     -- 2. selection_* otherwise
    --     copy_mode_active_highlight_bg = { Color = '#000000' },
    --     -- use `AnsiColor` to specify one of the ansi color palette values
    --     -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --     --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    --     -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    --     copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    --     copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    --     copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },
    --
    --     quick_select_label_bg = { Color = 'peru' },
    --     quick_select_label_fg = { Color = '#ffffff' },
    --     quick_select_match_bg = { AnsiColor = 'Navy' },
    --     quick_select_match_fg = { Color = '#ffffff' },
    -- },
    font = wezterm.font_with_fallback {
        'Maple Mono',
        'codicon',
        '3270 Nerd Font',
    },
    harfbuzz_features = { 'zero', 'ss01', 'ss20' },
    font_size = 15,
    disable_default_key_bindings = true,
    enable_tab_bar = false,
    use_fancy_tab_bar = false,
    --[[ dpi = 137.68, ]]
    --[[ default_prog = { '/bin/tmux' }, ]]
    keys = {
        { key = '-', mods = 'CTRL', action = 'DecreaseFontSize' },
        { key = '=', mods = 'CTRL', action = 'IncreaseFontSize' },
        { key = 'P', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
    },
}
-- != ~=
