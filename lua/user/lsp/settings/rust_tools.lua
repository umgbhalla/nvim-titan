local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	return
end
require("rust-tools").setup({})

-- Command:
-- RustSetInlayHints
-- RustDisableInlayHints
-- RustToggleInlayHints
-- set inlay hints
require("rust-tools.inlay_hints").set_inlay_hints()
-- disable inlay hints
-- require("rust-tools.inlay_hints").disable_inlay_hints()
-- toggle inlay hints
-- require("rust-tools.inlay_hints").toggle_inlay_hints()
-- Command:
-- RustParentModule
-- require("rust-tools.parent_module").parent_module()
-- Command:
-- RustJoinLines
-- require("rust-tools.join_lines").join_lines()
