require("alexis.core.options")
require("alexis.core.keymaps")
require("alexis.lazy")

--Activation des mouvements
vim.o.mousemoveevent = true
vim.g.python3_host_prog = "~/.venvs/neovim/bin/python"

-- Utiliser une couleur rose pastel agréable pour les liens
vim.cmd([[
  autocmd BufRead,BufNewFile *.html,*.md,*.txt syntax match Url /\vhttps?:\/\/[^\s]+/
  autocmd BufRead,BufNewFile *.html,*.md,*.txt highlight Url gui=underline guifg=#FFB6C1
]])
