local a = vim.api
local f = vim.fn

-- floating statuslines {{{
-- render function {{{
function incline_render(render_props)
		local buffer, window = render_props.win, render_props.buf

		local file_name = a.nvim_buf_get_name(buffer)
		local res = file_name ~= "" and f.fnamemodify(file_name, ":t") or "[No Name]"

		if a.nvim_buf_get_option(buffer, "modified") then
			res = res .. "[+]"
		elseif a.nvim_buf_get_option(buffer, "readonly") then
			res = res .. "[-]"
		end

		a.nvim_echo( {{ "Output:" .. res }}, false, {} )

		return res
	end
-- }}}

require('incline').setup {
	render = "basic",
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
}
-- }}}
