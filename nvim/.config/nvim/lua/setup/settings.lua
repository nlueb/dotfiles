vim.o.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = ''

vim.o.showmode = false
vim.o.laststatus = 3
vim.o.cmdheight = 0

vim.o.breakindent = true

vim.o.undofile = true
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath 'config' .. '/undo'

vim.o.backup = true
vim.o.backupcopy = 'auto'
vim.o.backupdir = vim.fn.stdpath 'config' .. '/backup'

vim.o.swapfile = true
vim.o.directory = vim.fn.stdpath 'config' .. '/swap'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '░', nbsp = '␣' }

vim.opt.fillchars:append { eob = ' ' }

vim.o.inccommand = 'nosplit'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- vim.o.smartindent = true

vim.o.wrap = false

vim.opt.wildignore = {
    '*.o',
    '*.obj',
    '*.class',
    '*/nvim/backup/*',
    '*/nvim/undo/*',
    '*/nvim/swap/*',
    '*.ppm',
}
