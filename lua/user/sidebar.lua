local status_ok, sidebar = pcall(require, "sidebar-nvim")
if not status_ok then
	return
end
local opts = {
	open = true,
	side = "right",
	initial_width = 40,
	update_interval = 1000,
	sections = { "todos", "buffers", "diagnostics", "files" },
	section_separator = { "", "", "" },
	containers = {
		attach_shell = "/bin/sh",
		show_all = true,
		interval = 5000,
	},
	datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
	todos = {
		icon = "",
		ignored_paths = { "~" }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
		initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
	},
	disable_closing_prompt = true,

	buffers = {
		icon = "",
		ignored_buffers = {}, -- ignore buffers by regex
	},
	files = {
		icon = "",
		show_hidden = false,
		ignored_paths = { "%.git$" },
	},
}

sidebar.setup(opts)
