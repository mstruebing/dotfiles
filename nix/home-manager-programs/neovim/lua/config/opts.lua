-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.spelllang = 'en_us,de_de'

-- allow per project vimrc
vim.opt.exrc = true
vim.opt.secure = true


-- indentations
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace= indent,eol,start -- Backspace through everything

-- swap/backup/undo
-- vim.opt.noswapfile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
-- vim.opt.undodir = "~/.cache/nvim/undodir"

-- color TODO
vim.opt.colorcolumn = "80"

-- search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard="unnamedplus"

vim.opt.cursorline = true

vim.opt.autoread = true

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
