local M = {}

-- TODO: extract all colors from nixos config
M.colors = {
	white = "#ffe3ff",
	black = "#0d0d0d",
	gray = "#595959",
	red = "#f99f9b",
	green = "#a2f28a",
	yellow = "#eef2bb",
	blue = "#96c7f2",
	pink = "#f2a2e5",
	cyan = "#8af2ec",

	light = {
		green = "#b5f2a2",
	},
	dark = {
		black = "#000000",
		gray = "#333333",
		white = "#bfaabf",
	},
}

function M.keybind(mode, key, action, options)
	options = options or { noremap = true, silent = true }

	vim.keymap.set(mode, key, action, options)
end

return M
