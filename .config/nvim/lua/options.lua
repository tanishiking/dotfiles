local opt = vim.opt

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- UI
opt.number = true
opt.showcmd = true
opt.cursorline = true
opt.hidden = true
opt.confirm = true
opt.visualbell = true
opt.mouse = "a"
opt.termguicolors = true

-- No timeout for mappings, timeout for key codes
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 10

-- No swap/backup
opt.swapfile = false
opt.backup = false
opt.writebackup = true

-- Tabs
opt.showtabline = 2

-- Search
opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true

-- Display
opt.laststatus = 2
opt.cmdheight = 1
opt.display = "lastline"
opt.title = true

-- Completion
opt.wildmenu = true
opt.lazyredraw = true
opt.showmatch = true
opt.matchpairs:append("<:>")
opt.backspace = "indent,eol,start"

-- Invisible characters
opt.list = true
opt.listchars = { tab = ">-", trail = "-", nbsp = "%", extends = ">", precedes = "<" }

-- Folding
opt.foldenable = true
opt.foldlevelstart = 10
opt.foldnestmax = 10

-- Clipboard
opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "."
