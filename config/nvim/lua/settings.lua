-- indentation
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- disable mouse
vim.opt.mouse = nil

-- folding
vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "marker"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- background characters {{{
-- TODO: foldtext
--if vim.opt.encoding == "utf-8" then
	vim.opt.listchars = {
		space = "·",
		nbsp = "␣",
		tab = "→ ",
		eol = "↩",
		extends = "»",
		precedes = "«",
	}
	vim.opt.list = true
	vim.opt.showbreak = "↪ "
	vim.opt.fillchars = {
		fold = " ",
		foldopen = "",
		foldclose = "",
	}
--else
--	vim.opt.listchars = {
--		space = ".",
--		nbsp = "~",
--		tab = ">-",
--		eol = "/",
--		extends = ">",
--		precedes = "<",
--	}
--	vim.opt.list = true
--	vim.opt.showbreak =  "\\ "
--	vim.opt.fillchars = {
--		fold = " ",
--		foldopen = "-",
--		foldclose = "+",
--	}
--end
-- }}}

-- colorscheme {{{
if vim.fn.empty(vim.env.TMUX) then
	if vim.fn.has("nvim") then
		vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = true
	end

	if vim.fn.has("termguicolors") then
		vim.opt.termguicolors = true
	end
end

vim.cmd.colorscheme("pct-flower-with-leaves")
-- }}}

-- other
vim.opt.laststatus = 3 -- have one statusline for every window
vim.opt.showtabline = 1 -- only show tabline when there are more than 1 tabs open
vim.opt.conceallevel = 2
vim.opt.colorcolumn = { 80 } -- show line at 80 characters
vim.opt.scrolloff = 5

-- hexokinase {{{
-- these need to be set before hexokinase is loaded
local ok, _ = pcall(require, "hexokinase")

if ok then
	vim.g.Hexokinase_highlighters = { "backgroundfull" }
	vim.g.Hexokinase_optInPatters = "full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names"
end
-- }}}
