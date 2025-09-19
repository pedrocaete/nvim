return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Desativa o netrw, pois o nvim-tree o substituirá
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Define o realce do fundo como transparente (opcional)
        vim.cmd("highlight NvimTreeNormal guibg=NONE ctermbg=NONE")

        require("nvim-tree").setup({
            -- Recarrega a árvore automaticamente quando arquivos são alterados
            auto_reload_on_write = true,
            -- Sincroniza a árvore com o diretório de trabalho atual
            sync_root_with_cwd = true,
            -- Atualiza o foco na árvore para o arquivo do buffer atual
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            view = {
                width = 30,
                side = "left",
            },
            filters = {
                dotfiles = false,
                custom = { ".git", "node_modules", ".cache" },
            },
        })
    end,
}
