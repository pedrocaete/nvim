return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "jdtls", "texlab", "intelephense", "markdown_oxide" },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "stylua", "java-debug-adapter", "java-test", "codelldb" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			--local wp = require("wordpress") -- Carrega o plugin de WP
			--			lspconfig.lua_ls.setup({
			--				capabilities = capabilities,
			--			})
			--local intele_opts = vim.tbl_deep_extend("force", wp.intelephense, {
			--	capabilities = capabilities,
			--})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			lspconfig.laravel_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pest_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.phpactor.setup({
				-- Outras configs suas...
				handlers = {
					-- Isso aqui faz o Neovim jogar no lixo qualquer erro que o Phpactor tentar mostrar
					["textDocument/publishDiagnostics"] = function() end,
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.csharp_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.markdown_oxide.setup({
				capabilities = capabilities, -- again, ensure that capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
				---@diagnostic disable-next-line:unused-local
				on_attach = function(client, bufnr)
					-- refresh codelens on TextChanged and InsertLeave as well
					vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "CursorHold", "LspAttach" }, {
						buffer = bufnr,
						callback = vim.lsp.codelens.refresh,
					})

					-- trigger codelens refresh
					vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })

					-- setup conceallevel to enable it in obsidian.nvim
					vim.opt.conceallevel = 2
				end,
			})
			lspconfig.somesass_ls.setup({
				capabilities = capabilities,
				settings = {
					somesass = {
						-- Garante que ele valide o código e aponte erros
						validate = true,
						-- Configurações de sugestões e caminhos de importação
						ls = {
							scanImportPath = true, -- Procura variáveis em arquivos importados
						},
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
