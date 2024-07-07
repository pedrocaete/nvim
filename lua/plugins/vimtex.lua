return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_quickfix_enabled = 1
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_quickfix_mode = 0

        local keymap = vim.keymap
        keymap.set("n", "<leader>tc", ":VimtexCompile<CR>")
        keymap.set("n", "<leader>ts", ":VimtexStop<CR>")
        keymap.set("n", "<leader>te", ":VimtexErrors<CR>")
        keymap.set("n", "<leader>tl", ":VimtexLog<CR>")
    end,

    ft = "tex",
}
