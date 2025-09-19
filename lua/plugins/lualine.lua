return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local wpm = require("wpm")
        require("lualine").setup({
            sections = {
                lualine_x = {
                    "encoding",
                    "fileformat",
                    "filetype",
                    wpm.wpm,
                    wpm.historic_graph,
                },
            },
            options = {
                theme = "tokyonight",
            },
        })
    end,
}
