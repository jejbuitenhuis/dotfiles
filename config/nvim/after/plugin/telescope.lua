local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

local util = require "util"

local builtin = require "telescope.builtin"
local actions = require "telescope.actions"

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
})

util.keybind("n", "<c-k>", builtin.find_files)
util.keybind("n", "<c-j>", builtin.buffers)
