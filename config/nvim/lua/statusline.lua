Statusline = {}

local modes = setmetatable({
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
}, {
	-- prevent errors when no matching mode is found
	__index = function()
		return "UNKNOWN"
	end
})

local function block_without_spacing(content, color)
	return string.format("%%%d*%s%%0*", color, content)
end

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
	local git = vim.b.gitsigns_status_dict

	if not git or git.head == "" then
		return ""
	end

	local content = { git.head }

	if git.added and git.added ~= 0 then
		table.insert( content, string.format("+%d", git.added) )
	end

	if git.changed and git.changed ~= 0 then
		table.insert( content, string.format("~%d", git.changed) )
	end

	if git.removed and git.removed ~= 0 then
		table.insert( content, string.format("-%d", git.removed) )
	end

	local content = table.concat(content, " ")

	return block( string.format("%%{trim('%s')}", content), 4 )
end

local function lsp_status()
	-- TODO:
	return block("offline", 2)
end

local function lsp_errors()
	return block("offline", 3)
end

function Statusline.get()
	local left = {
		current_mode(),
		current_file(),
		git(),
	}
	local right = {
		lsp_status(),
		lsp_errors()
	}

	return table.concat({
		table.concat(left, ""),
		"%=",
		table.concat(right, ""),
	})
end

vim.o.statusline = "%!v:lua.Statusline.get()"
