--Maps
local map = vim.keymap.set
vim.g.mapleader = " "
vim.keymap.set("n", "<C-s>", function() vim.cmd("w") end, { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

--Centralize when move
map("n", "j", "jzz", {})
map("n", "k", "kzz", {})
map("n", "G", "Gzz", {})
map("n", "gg", "ggzz", {})
map("n", "n", "nzz", {})
map("n", "N", "Nzz", {})
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})
map("n", "<C-f>", "<C-f>zz", {})
map("n", "<C-b>", "<C-b>zz", {})
map("n", "{", "{zz", {})
map("n", "}", "}zz", {})
map("n", "H", "Hzz", {})
map("n", "L", "Lzz", {})
map("n", "M", "Mzz", {})

--Remove highlight after a search
vim.api.nvim_set_keymap("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Tab = 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--Initialize already with relative line numbers
vim.cmd("set relativenumber")
vim.cmd("set number")

--Show absolute number of the atual line

--Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})

--Restore Cursor Position
local autocmd = vim.api.nvim_create_autocmd

--Nordtheme configs
vim.g.nord_disable_background = true

--Undo persists after a file is close
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

--Clipboard of nvim integrated with the system clipboard
vim.opt.clipboard = "unnamedplus"
