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
	vim.cmd([[set guifont=Lig\ Operator\ Mono:h10]])
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

local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

local load_core = function()
	createdir()
	neovide_config()
	require("core.options")
	-- require("core.mapping")
	-- require("keymap")
	-- require("core.event")

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
	require("user.plugins")
	require("user.presenceconf")
	require("user.project")
	require("user.sidebar")
	require("user.surround")
	require("user.telescopeconf")
	require("user.toggletermconf")
	require("user.treesitter")
	require("user.whichkey")
	require("neoscroll").setup({
		-- All these keys will be mapped to their corresponding default scrolling animation
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
		hide_cursor = true, -- Hide cursor while scrolling
		stop_eof = true, -- Stop at <EOF> when scrolling downwards
		use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
		respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
		cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
		easing_function = nil, -- Default easing function
		pre_hook = nil, -- Function to run before the scrolling animation starts
		post_hook = nil, -- Function to run after the scrolling animation ends
		performance_mode = false, -- Disable "Performance Mode" on all buffers.
	})
	require("colorizer").setup()
end

load_core()
