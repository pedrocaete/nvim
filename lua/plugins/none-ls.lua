return {
	"nvimtools/none-ls.nvim",
	dependencies = { "bitpoke/wordpress.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "cpp", "cuda" },
					extra_args = {
						"--style={BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, TabWidth: 4}",
					},
				}),

				-- Carregamos o plugin aqui dentro para evitar o erro de loop
				null_ls.builtins.diagnostics.phpcs.with(require("wordpress").null_ls_phpcs),
				null_ls.builtins.formatting.phpcbf.with(require("wordpress").null_ls_phpcs),
			},
		})

		-- Atalho para formatar
		vim.keymap.set("n", "<leader>gf", function()
			local clang_format_filetypes = {
				c = true,
				cpp = true,
				cuda = true,
			}

			vim.lsp.buf.format({
				filter = function(client)
					if clang_format_filetypes[vim.bo.filetype] then
						return client.name == "null-ls"
					end

					return true
				end,
			})
		end, {})
	end,
}
