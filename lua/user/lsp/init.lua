local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("lspconfig").rls.setup({
	-- Use nightly build
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		rust = {
			unstable_features = true,
			build_on_save = true,
			all_features = true,
		},
	},
})
