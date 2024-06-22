--Maps
local map = vim.keymap.set
vim.g.mapleader = ' '
--Centralize when move
map('n', 'j', 'jzz', {})
map('n', 'k', 'kzz', {})
map('n', 'G', 'Gzz', {})
map('n', 'gg', 'ggzz', {})
map('n', 'n', 'nzz', {})
map('n', 'N', 'Nzz', {})
map('n', '<C-d>', '<C-d>zz', {})
map('n', '<C-u>', '<C-u>zz', {})
map('n', '<C-f>', '<C-f>zz', {})
map('n', '<C-b>', '<C-b>zz', {})
map('n', '{', '{zz', {})
map('n', '}', '}zz', {})
map('n', 'H', 'Hzz', {})
map('n', 'L', 'Lzz', {})
map('n', 'M', 'Mzz', {})
-- Tab = 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


--Initialize already with relative line numbers
vim.opt.relativenumber = true

--Highlight Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = 100})
  end
})

--Restore Cursor Position
local autocmd = vim.api.nvim_create_autocmd
