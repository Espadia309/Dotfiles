-- enable the line number
vim.opt.number = true
-- make the line number relative
vim.opt.relativenumber = true

-- make the help/config windows open to the bottom
vim.opt.splitbelow = true
-- make the others code windows open to the right
vim.opt.splitright = true

-- when a line is full, just continue the line, not create a new 'visual' line
vim.opt.wrap = false

-- transform tab into space
vim.opt.expandtab = true
-- set the number of space needed to be a tab to 8
vim.opt.tabstop = 8
-- use the tabstop for auto indent 
vim.opt.shiftwidth = 8

vim.opt.softtabstop = 8

-- Synchronise the nvim clipboard and the system clipboard
vim.opt.clipboard = "unnamedplus"

-- make the cursor always center
vim.opt.scrolloff = 999

-- make the block edit select all white space as normal space
vim.opt.virtualedit = 'block'

-- create a temporary windows when make a replace
vim.opt.inccommand = 'split'

-- ignore uppercase for tab completion
vim.opt.ignorecase = true

-- add true color support
vim.opt.termguicolors = true

-- set the leader key
vim.g.mapleader = " "

-- set lsp completion option
vim.opt.completeopt = {'menuone', 'noselect'}

-- set the style of popup window
vim.o.pumheight = 5
vim.o.pumborder = 'rounded'

-- autocompletion
vim.o.autocomplete = true

vim.cmd("colorscheme milk")
