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
	sidescrolloff = 999,
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

--Defer loading shada until after startup_
vim.opt.shadafile = "NONE"
vim.schedule(function()
	vim.opt.shadafile = require("core.utils").load_config().options.shadafile
	vim.cmd([[ silent! rsh ]])
end)
