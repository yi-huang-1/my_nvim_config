-- utf 8
vim.g.encoding = "UTF-8"
vim.g.fileencoding = 'utf-8'

-- jkhl move cursor keeping 8 lines
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- use relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true
-- highlight current line
vim.wo.cursorline = true
-- show left signs
vim.wo.signcolumn = "yes"
-- right reference column number
vim.wo.colorcolumn = "130"
-- indent tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftaround = true
-- >> and << length
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- space as tab
vim.o.expandtab = false
vim.bo.expandtab = false
-- auto indent in new lines
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- search with case
vim.o.ignorecase = true
vim.o.smartcase = true
-- highlight search
vim.o.hlsearch = true
-- input while search
vim.o.incsearch = true
-- height of cmd
vim.o.cmdheight = 2
-- auto load files when files changed
vim.o.autoread = true
vim.bo.autoread = true
-- warp lines
vim.wo.wrap = false
-- jump to next line <Left><Right> at front or end of lines
vim.o.whichwrap = '<,>,[,]'
-- allow hidding modified buffer
vim.o.hidden = true
-- mouse
vim.o.mouse = "a"
-- backup files settings
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- timeoutlen
vim.o.timeoutlen = 200
-- split window
vim.o.splitbelow = true
vim.o.splitright = true
-- autocomplete
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- style
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- show unvisible symbols
vim.o.list = false
vim.o.listchars = "space:·"
-- enhanced complete
vim.o.wildmenu = true
-- Don't pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- max lines of auto-complete
vim.o.pumheight = 10
-- show tab line
vim.o.showtabline = 2
-- disable show mode
vim.o.showmode = false
-- undo dir
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
-- exrc
vim.opt.exrc = true

