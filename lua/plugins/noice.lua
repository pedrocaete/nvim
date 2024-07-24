return {
    "folke/noice.nvim",
    config = function()
        require("noice").setup({
            -- add any options here
            routes = {
--                {
--                    filter = {
--                        event = "msg_show",
--                        any = {
--                            { find = "%d+L, %d+B" },
--                            { find = "; after #%d+" },
--                            { find = "; before #%d+" },
--                            { find = "%d fewer lines" },
--                            { find = "%d more lines" },
--                        },
--                    },
--                   opts = { skip = true },
--                },
                {
                    view = "notify",
                    filter = {
                        event = "msg_showmode",
                        find = "recording",
                    },
                },
            },
        })
        require("notify").setup({
            background_colour = "#aaaaaa",
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
