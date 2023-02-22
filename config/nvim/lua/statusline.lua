local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function block(content, color)
	if #content == 0 then
		return ""
	end

	return string.format("%%%d* %s %%0*", color, content)
end

local function current_mode()
	local mode = vim.api.nvim_get_mode().mode
	local formatted_mode = modes[mode]:upper()

	return block(formatted_mode, 7)
end

local function current_file()
	return block("%<%f%m", 6)
end

local function git()
	-- TODO: why doesn't `vim.b.gitsigns_head` work?
	local head = vim.api.nvim_command_output( 'echo get(b:, "gitsigns_head")' )
	local changes = vim.api.nvim_command_output( 'echo get(b:, "gitsigns_status")' )

	return block( string.format("%s %s", head, changes), 4 ) -- TODO: is this green?
end

local function lsp_status()
	-- TODO:
	return block("offline", 2)
end

local function lsp_errors()
	return block("offline", 3)
end

local function statusline()
	return string.format(
		"%s%s%s %%= %s%s",

		current_mode(),
		current_file(),
		git(),
		
		lsp_status(),
		lsp_errors()
	)
end

vim.o.statusline = statusline()
