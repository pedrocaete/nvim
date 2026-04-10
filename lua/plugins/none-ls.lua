return {
	"nvimtools/none-ls.nvim",
	dependencies = { "bitpoke/wordpress.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.csharpier,

				-- Carregamos o plugin aqui dentro para evitar o erro de loop
				null_ls.builtins.diagnostics.phpcs.with(require("wordpress").null_ls_phpcs),
				null_ls.builtins.formatting.phpcbf.with(require("wordpress").null_ls_phpcs),
			},
		})

		-- Atalho para formatar
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
