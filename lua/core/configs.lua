--Remove highlight after a search
vim.api.nvim_set_keymap("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Tab = 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

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

