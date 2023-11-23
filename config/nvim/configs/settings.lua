local UTIL = {}

function UTIL.keybind(mode, key, action, options)
	options = options or { noremap = true, silent = true }

	vim.keymap.set(mode, key, action, options)
end

local a = vim.api
local f = vim.fn

-- floating statuslines {{{
local FILES_WHICH_REQUIRE_MORE_INFO = {
	["index"] = true,
	["mod"] = true,
}

-- render function {{{
local function incline_render(render_props)
	local buffer = render_props.buf

	local file_path = a.nvim_buf_get_name(buffer)
	local res = file_path ~= "" and f.fnamemodify(file_path, ":t") or "[No Name]"

	if a.nvim_buf_get_option(buffer, "modified") then
		res = res .. "[+]"
	elseif a.nvim_buf_get_option(buffer, "readonly") then
		res = res .. "[-]"
	end

	local file_name = f.fnamemodify(file_path, ":t:r")

	-- https://stackoverflow.com/a/33606621/9946744
	if FILES_WHICH_REQUIRE_MORE_INFO[file_name] then
		-- get the first folder the file is in (:p:h:t), but we want it
		-- relative to the project root, so we use :. to get it relative
		local folder = f.fnamemodify(file_path, ":p:.:h:t")

		if folder == "." or folder == "/" then
			folder = ""
		end

		res = folder .. "/" .. res
	end

	return res
end
-- }}}

require('incline').setup({
	render = incline_render,
	window = {
		margin = {
			vertical = {
				top = 0,
				bottom = 0,
			},
		},
		winhighlight = {
			active = { Normal = "TabLineSel" },
			inactive = { Normal = "TabLine" },
		},
	},
	hide = {
		only_win = "count_ignored",
	},
})
-- }}}

-- git diff in sign column {{{
local gitsigns = require("gitsigns")

local GITSIGNS_KEY_PREFIX = "<leader>g"

gitsigns.setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		enable = true,
		interval = 1000,
		follow_files = true,
	},
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 250,
	},
	current_line_blame_formatter = " ‣ <author>, <author_time:%Y-%m-%d> - <summary>",

	on_attach = function()
		UTIL.keybind("n", "[h", gitsigns.prev_hunk)
		UTIL.keybind("n", "]h", gitsigns.next_hunk)

		UTIL.keybind("n", GITSIGNS_KEY_PREFIX .. "b", gitsigns.blame_line)
		UTIL.keybind("n", GITSIGNS_KEY_PREFIX .. "B", function() gitsigns.blame_line({ full = true }) end)

		UTIL.keybind("n", GITSIGNS_KEY_PREFIX .. "r", gitsigns.reset_hunk)
		UTIL.keybind("v", GITSIGNS_KEY_PREFIX .. "r", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
	end,
})
-- }}}
