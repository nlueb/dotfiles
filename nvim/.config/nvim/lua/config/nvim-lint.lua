local lint = require 'lint'

lint.linters_by_ft = {
    text = {'vale',},
    markdown = {'vale',},
    rst = {'vale',},
    dockerfile = {'hadolint',},
    python = {'flake8', 'mypy', 'cspell'},
    go = {'revive', 'cspell',},
    sh = {'shellcheck', 'cspell',},
    lua = {'selene', 'cspell',},
}
