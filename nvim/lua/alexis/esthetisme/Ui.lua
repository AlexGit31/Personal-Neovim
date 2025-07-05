local themes = require("alexis.esthetisme.themes")

local M = {}

function M.select_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	pickers
		.new({}, {
			prompt_title = " Choisir un thème",
			finder = finders.new_table({ results = themes.themes }),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr) -- ← On ferme après avoir récupéré
					if selection and selection[1] then
						themes.apply(selection[1])
					else
						vim.notify("Aucun thème sélectionné", vim.log.levels.WARN)
					end
				end)
				return true
			end,
		})
		:find()
end

return M
