local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end
-- Default options:
kanagawa.setup({
	undercurl = true, -- enable undercurls
	commentStyle = "italic",
	functionStyle = "NONE",
	keywordStyle = "italic",
	statementStyle = "bold",
	typeStyle = "NONE",
	variablebuiltinStyle = "italic",
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
})
-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd("colorscheme tokyodark")

-- vim.cmd([[
-- try
--   colorscheme gotham
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]])
