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
