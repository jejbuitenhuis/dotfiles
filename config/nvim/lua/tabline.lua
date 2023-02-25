Tabline = {}

function Tabline.get()
	local tabs = {}

	local tab_curr = vim.fn.tabpagenr()

	for index = 1, vim.fn.tabpagenr("$") do
		local win_num = vim.fn.tabpagewinnr(index)
		local buf_num = vim.fn.tabpagebuflist(index)[win_num]
		local buf_name = vim.fn.bufname(buf_num)
		local buf_unsaved = vim.fn.getbufvar(buf_num, "&mod")

		local tab = { string.format("%%%dT", index) }

		if index == tab_curr then
			table.insert(tab, "%#TabLineSel# ")
		else
			table.insert(tab, "%#TabLine# ")
		end

		if buf_name ~= "" then
			table.insert( tab, string.format("%d %s ", index, buf_name) )
		else
			table.insert( tab, string.format("%d [No Name] ", index) )
		end

		if buf_unsaved == 1 then
			table.insert(tab, "[+] ")
		end

		table.insert( tabs, table.concat(tab, "") )
	end

	table.insert(tabs, "%#TabLineFill#")

	return table.concat(tabs, "")
end

vim.o.tabline = '%!v:lua.Tabline.get()'
