vim.g.mapleader = " "

local keymap = vim.keymap

--Open keymaps
keymap.set("n", "<leader>km", ":edit ~/.config/nvim/lua/core/keymaps.lua<CR>", { noremap = true, silent = true })

--Open Startify
keymap.set("n", "<leader>m", ":Startify<CR>", { noremap = true, silent = true })

--Best map to save and exit
keymap.set("n", "<S-w><S-w>", ":w<CR>")
keymap.set("n", "<S-q><S-q>", ":confirm q<CR>")

--Pastes in visual mode without yank
keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true })

--Other way to go to normal mode
vim.keymap.set("i", "<c-c>", "<esc>", { noremap = true, silent = true })

--Easy substitons
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Tabs
keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

--Centralize when move
keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")
keymap.set("n", "G", "Gzz")
keymap.set("n", "gg", "ggzz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-b>", "<C-b>zz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "H", "Hzz")
keymap.set("n", "L", "Lzz")
keymap.set("n", "M", "Mzz")

--Buffers
keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>q", ":bd!<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>b", ":enew<CR>", { noremap = true, silent = true })

--Dap
vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", '<leader>dd', function() require('dap').disconnect()
require('dapui').close()
end)
vim.keymap.set("n", '<leader>dt', function() require('dap').terminate()
require('dapui').close()
end)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
vim.keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"
widgets.centered_float(widgets.scopes) end)
vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
vim.keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

--Diffview
keymap.set("n","<leader>vo", ":DiffviewOpen<CR>",{ noremap = true, silent = true })
keymap.set("n","<leader>vc", ":DiffviewClose<CR>",{ noremap = true, silent = true })

--Git
keymap.set("n", "<C-g>h", ":Gitsigns preview_hunk<CR>")
keymap.set("n", "<C-g>lb", ":Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<C-g>b", ":Git blame<CR>")
keymap.set("n", "<C-g>l", ":Git log<CR>")

--Harpoon
--On the plugin by bugs when maps are here

--LazyGit
keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>ll", ":LazyGitFilter<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>lf", ":LazyGitFilterCurrentFile<CR>", { noremap = true, silent = true })

--LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

--Oil
keymap.set('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true })

--Telescope
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })

--Trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

--Twilight
keymap.set("n", "<leader>t", ":Twilight<CR>", { noremap = true, silent = true })
--ZenMode
keymap.set('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })

--[[Surround
    Add: ys
    Change: cs
    Delete ds
    
    All of the commands followeds by the surround that will be changed and the new surround (except in the delet case)
    --]]

-- Load Codeium only when wanted
keymap.set("n", "<leader>cc", ":Lazy load codeium.nvim<CR>")
