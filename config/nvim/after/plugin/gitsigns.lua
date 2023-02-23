local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
	return
end

gitsigns.setup({
	signs = {
		add = { text = '│' },
		change = { text = '│' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
		untracked = { text = '┆' },
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
})
