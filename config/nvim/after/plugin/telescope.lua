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

				["<CR>"] = actions.select_default,
				["<c-v>"] = actions.select_vertical,
				["<c-x>"] = actions.select_horizontal,
				["<c-t>"] = actions.select_tab,

				["<c-p>"] = actions.move_selection_previous,
				["<c-n>"] = actions.move_selection_next,

				["<c-Space>"] = actions.toggle_selection,
				["<c-@>"] = actions.toggle_selection,
			},
		},
	},
})

util.keybind("n", "<c-k>", builtin.find_files)
util.keybind("n", "<c-j>", builtin.buffers)
util.keybind("n", "<leader>ff", builtin.live_grep)
