return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true,
      on_highlights = function(hl, c)
        hl.BufferLineFill = { bg = "none" }
      end,
    })
    vim.cmd.colorscheme "tokyonight"
  end,
}
