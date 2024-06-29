return{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({})
    vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', {})
    vim.api.nvim_set_keymap('n', '<leader>x', ':bd!<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>b', ':enew<CR>', { noremap = true, silent = true })
  end
}
