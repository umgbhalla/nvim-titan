local global = require("core.global")
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
	local data_dir = {
		global.cache_dir .. "backup",
		global.cache_dir .. "session",
		global.cache_dir .. "swap",
		global.cache_dir .. "tags",
		global.cache_dir .. "undo",
	}
	-- There only check once that If cache_dir exists
	-- Then I don't want to check subs dir exists
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		os.execute("mkdir -p " .. global.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local neovide_config = function()
	vim.cmd([[set guifont=Lig\ Operator\ Mono:h12]])
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_no_idle = true
	vim.g.neovide_cursor_animation_length = 0.03
	vim.g.neovide_cursor_trail_length = 0.05
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_speed = 20.0
	vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local load_core = function()
	-- local pack = require("core.pack")
	createdir()
	-- pack.ensure_plugins()
	neovide_config()

	require("core.options")
	-- require("core.mapping")
	-- require("keymap")
	-- require("core.event")

	local present, impatient = pcall(require, "impatient")
	if present then
		impatient.enable_profile()
	end
	-- require("core")
	require("core.autocmds")

	require("user.alpha")
	require("user.autopairs")
	require("user.barbar")
	require("user.cmpconf")
	require("user.colorscheme")
	require("user.comment")
	require("user.cool")
	require("user.diaglist")
	require("user.gitsignsconf")
	require("user.indentline")
	require("user.keymaps")
	require("user.lsp")
	require("user.lsp.settings.rust_tools")
	require("user.lualineconf")
	require("user.notify")
	require("user.nvim-treeconf")
	require("user.options")
	require("user.plugins")
	require("user.presenceconf")
	require("user.project")
	require("user.sidebar")
	require("user.surround")
	require("user.telescopeconf")
	require("user.toggletermconf")
	require("user.treesitter")
	require("user.whichkey")

	-- pack.load_compile()

	-- vim.cmd([[colorscheme catppuccin]])
end

load_core()
