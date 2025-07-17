-- Variable pour stocker le PID du live-server
local live_server_pid = nil

-- Fonction pour obtenir un port libre
local function get_free_port(start_port)
	local socket = require("socket")
	local port = start_port
	while port < 9000 do
		local test = socket.bind("*", port)
		if test then
			test:close()
			return port
		end
		port = port + 1
	end
	return nil
end

-- Raccourci pour lancer le live-server
vim.keymap.set("n", "<leader>ls", function()
	local port = get_free_port(3000) or 3000
	local cmd = { "live-server", ".", "--port=" .. port }

	local job_id = vim.fn.jobstart(cmd, {
		detach = false, -- on veut pouvoir obtenir le PID
		on_stdout = function(_, data, _)
			-- (optionnel) pour log ou debug
		end,
		on_stderr = function(_, data, _)
			-- (optionnel) pour log ou debug
		end,
	})

	if job_id > 0 then
		-- Récupérer le PID du job via jobpid()
		local pid = vim.fn.jobpid(job_id)
		if pid then
			live_server_pid = pid
			vim.notify(
				"Live Server lancé sur http://localhost:" .. port .. " (PID: " .. pid .. ")",
				vim.log.levels.INFO
			)
		else
			vim.notify("Impossible de récupérer le PID de live-server", vim.log.levels.ERROR)
		end
	else
		vim.notify("Échec du démarrage de live-server", vim.log.levels.ERROR)
	end
end, { desc = "Lancer Live Server", silent = true })

-- Tuer uniquement le live-server lancé à la fermeture de Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if live_server_pid then
			vim.fn.jobstart({ "kill", "-9", tostring(live_server_pid) })
		end
	end,
})
