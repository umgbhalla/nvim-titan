local status_ok, _ = pcall(require, "rust-tools")
if not status_ok then
	return
end

local opts = {
	tools = {
		-- rust-tools options
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,
		-- Whether to show hover actions inside the hover window
		-- This overrides the default hover handler
		hover_with_actions = true,
		runnables = {
			-- whether to use telescope for selection menu or not
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},
		debuggables = {
			-- whether to use telescope for selection menu or not
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},
		-- These apply to the default RustSetInlayHints command
		inlay_hints = {
			-- Only show inlay hints for the current line
			only_current_line = false,
			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",
			-- wheter to show parameter hints with the inlay hints or not
			show_parameter_hints = true,
			-- prefix for parameter hints
			parameter_hints_prefix = "<- ",
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = " » ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- whether to align to the extreme right or not
			right_align = false,
			-- padding from the right if right_align is true
			right_align_padding = 7,
		},
		hover_actions = {
			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},
			-- whether the hover action window gets automatically focused
			auto_focus = false,
		},
	},
	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
				},
				procMacro = {
					enable = false,
				},
				diagnostics = {
					disabled = { "macro-error", "unresolved-proc-macro" },
				},
			},
		},
	},
}

require("rust-tools").setup(opts)

-- Command:
-- RustSetInlayHints
-- RustDisableInlayHints
-- RustToggleInlayHints
-- set inlay hints
-- require("rust-tools.inlay_hints").set_inlay_hints()
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
