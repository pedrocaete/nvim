--Remove highlight after a search
vim.api.nvim_set_keymap("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Tab = 4 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

--Initialize already with relative line numbers
vim.cmd("set relativenumber")

-- Show the absolute line numeber
vim.cmd("set number")

--Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})

--Restore Cursor Position
local function restore_cursor()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
        vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
    end
end

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = restore_cursor,
})

--Undo persists after a file is close
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

--Clipboard of nvim integrated with the system clipboard
vim.opt.clipboard = "unnamedplus"

--Term guicolors
vim.opt.termguicolors = true

--To Obsidian Plugin Works Properly
vim.opt_local.conceallevel = 1
