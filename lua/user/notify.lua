local status_ok, _ = pcall(require, "notify")
if not status_ok then
	return
end

vim.notify = require("notify")
-- require("notify")("My super important message")
