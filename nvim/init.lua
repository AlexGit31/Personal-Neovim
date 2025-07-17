require("alexis.core.options")
require("alexis.core.keymaps")
require("alexis.core.live-server")
require("alexis.lazy")

--Activation des mouvements
vim.o.mousemoveevent = true
vim.g.python3_host_prog = "~/.venvs/neovim/bin/python"

-- Utiliser une couleur rose pastel agréable pour les liens
vim.cmd([[
  autocmd BufRead,BufNewFile *.html,*.md,*.txt syntax match Url /\vhttps?:\/\/[^\s]+/
  autocmd BufRead,BufNewFile *.html,*.md,*.txt highlight Url gui=underline guifg=#FFB6C1
]])

-- 🪛 Configuration des chemins LuaRocks pour LuaSocket
local home = os.getenv("HOME")
package.path = package.path
	.. ";"
	.. home
	.. "/.luarocks/share/lua/5.1/?.lua;"
	.. home
	.. "/.luarocks/share/lua/5.1/?/init.lua"
package.cpath = package.cpath .. ";" .. home .. "/.luarocks/lib/lua/5.1/?.so"
