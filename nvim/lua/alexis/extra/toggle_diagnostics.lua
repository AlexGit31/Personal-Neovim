local M = {}

local diagnostics_enabled = true

function M.toggle_diagnostics()
	diagnostics_enabled = not diagnostics_enabled
	if diagnostics_enabled then
		vim.diagnostic.enable(true, { bufnr = 0 }) -- réactive diagnostics pour le buffer courant
		vim.notify("Diagnostics ON", vim.log.levels.INFO)
	else
		vim.diagnostic.enable(false, { bufnr = 0 }) -- désactive diagnostics pour le buffer courant
		vim.notify("Diagnostics OFF", vim.log.levels.WARN)
	end
end

return M
