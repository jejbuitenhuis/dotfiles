local ok, indent_blankline = pcall(require, "indent_blankline")

if not ok then
	return
end

indent_blankline.setup({
	show_current_content = true,
	show_current_context_start = true,
})
