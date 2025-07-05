vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

-- LSP Server to use for Python.##ceci est un teste pour avoir python
-- Set to "basedpyright" to use basedpyright instead of pyright.
-- vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
--vim.g.lazyvim_python_ruff = "ruff" --samedi 1er fevrier

--pour les mouvements de souris
vim.o.mousemoveevent = true

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
