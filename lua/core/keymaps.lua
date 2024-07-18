vim.g.mapleader = " "

local keymap = vim.keymap

--Open keymaps
keymap.set("n", "<leader>km", ":edit ~/.config/nvim/lua/core/keymaps.lua<CR>")

--Open Startify
keymap.set("n", "<leader>m", ":Startify<CR>")

--Best map to save and exit
keymap.set("n", "<C-w>", ":w<CR>")
keymap.set("n", "<S-w><S-w>", ":w<CR>")
keymap.set("i", "<C-w>", "<Esc>:w<CR>")
keymap.set("n", "<S-q><S-q>", ":confirm q<CR>")

--Pastes in visual mode without yank
keymap.set("x", "<leader>p", [["_dP]])

--Other way to go to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")

--Easy substitons
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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

--Bufferline
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<leader>x", ":bd!<CR>")
keymap.set("n", "<Leader>b", ":enew<CR>")

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
vim.keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
vim.keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
vim.keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
vim.keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

--Git
keymap.set("n", "<C-g>ph", ":Gitsigns preview_hunk<CR>")
keymap.set("n", "<C-g>lb", ":Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<C-g>a", ":Git add %<CR>")
keymap.set("n", "<C-g><S-a>", ":Git add .<CR>")
keymap.set("n", "<C-g>c", ":Git commit<CR>")
keymap.set("n", "<C-g>s", ":Git status<CR>")
keymap.set("n", "<C-g>b", ":Git blame<CR>")
keymap.set("n", "<C-g>p", ":Git push<CR>")
keymap.set("n", "<C-g>ol", ":Git log --oneline<CR>")
keymap.set("n", "<C-g>l", ":Git log<CR>")

--Harpoon
--On the plugin by bugs when maps are here

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

--Neo Tree
keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

--Oil
keymap.set('n', '<leader>o', ':Oil<CR>')

--Telescope
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
