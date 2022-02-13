local opt = vim.opt
local g = vim.g

local options = {
	backup = false, -- creates a backup file
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smarttab = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	softtabstop = 2,
	cursorline = true, -- highlight the current line
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 999, -- is one of my fav
	-- sidescrolloff = 999,
	guifont = "Lig Operator Mono:h12",
}
for k, v in pairs(options) do
	opt[k] = v
end

options = require("core.utils").load_config().options
opt.title = true
opt.cmdheight = options.cmdheight
-- Indentline
opt.expandtab = options.expandtab
opt.fillchars = options.fillchars
opt.hidden = options.hidden
opt.ignorecase = options.ignorecase
opt.mouse = options.mouse
opt.shiftwidth = options.shiftwidth
opt.smartcase = options.smartcase
opt.smartindent = options.smartindent
opt.clipboard = options.clipboard
-- Numbers
opt.number = options.number
opt.numberwidth = options.numberwidth
opt.relativenumber = options.relativenumber
opt.ruler = options.ruler

-- disable nvim intro
-- vim.opt.shortmess:append("c")
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = options.tabstop
opt.termguicolors = true
opt.timeoutlen = options.timeoutlen
opt.undofile = options.undofile
-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = options.updatetime
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
vim.cmd([[set iskeyword+=-]])
g.mapleader = options.mapleader
-- TODO: this doesn't seem to work
vim.cmd([[set formatoptions-=cro]])
-- vim.g.minimap_width = 10
-- vim.g.minimap_auto_start = 0
-- vim.g.minimap_auto_start_win_enter = 0
--
-- Won't close when max fold is opened
vim.g.fold_cycle_toggle_max_open = 0
-- Won't open when max fold is closed
vim.g.fold_cycle_toggle_max_close = 0

--Defer loading shada until after startup_
vim.opt.shadafile = "NONE"
vim.schedule(function()
	vim.opt.shadafile = require("core.utils").load_config().options.shadafile
	vim.cmd([[ silent! rsh ]])
end)

-- init.lua
g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true,
	position = "right",
	relative_width = true,
	width = 75,
	auto_close = true,
	show_numbers = false,
	show_relative_n4mbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "TSURI" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Package = { icon = "", hl = "TSNamespace" },
		Class = { icon = "𝓒", hl = "TSType" },
		Method = { icon = "ƒ", hl = "TSMethod" },
		Property = { icon = "", hl = "TSMethod" },
		Field = { icon = "", hl = "TSField" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "ℰ", hl = "TSType" },
		Interface = { icon = "ﰮ", hl = "TSType" },
		Function = { icon = "", hl = "TSFunction" },
		Variable = { icon = "", hl = "TSConstant" },
		Constant = { icon = "", hl = "TSConstant" },
		String = { icon = "𝓐", hl = "TSString" },
		Number = { icon = "#", hl = "TSNumber" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Array = { icon = "", hl = "TSConstant" },
		Object = { icon = "⦿", hl = "TSType" },
		Key = { icon = "🔐", hl = "TSType" },
		Null = { icon = "NULL", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Struct = { icon = "𝓢", hl = "TSType" },
		Event = { icon = "🗲", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" },
	},
}
