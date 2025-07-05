return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		-- Désactiver les keybindings par défaut
		vim.g.codeium_disable_bindings = 1

		-- Keymaps personnalisés en mode INSERT
		vim.api.nvim_set_keymap("i", "<C-g>", "codeium#Accept()", { expr = true, silent = true })
		vim.api.nvim_set_keymap("i", "<C-n>", "codeium#CycleCompletions(1)", { expr = true, silent = true })
		vim.api.nvim_set_keymap("i", "<C-p>", "codeium#CycleCompletions(-1)", { expr = true, silent = true })
		vim.api.nvim_set_keymap("i", "<C-x>", "codeium#Clear()", { expr = true, silent = true })

		-- Fonction Lua pour le toggle avec feedback visuel
		local codeium_enabled = true

		local function toggle_codeium()
			if codeium_enabled then
				vim.cmd("CodeiumDisable")
				codeium_enabled = false
				show_status_popup("Codeium désactivé")
			else
				vim.cmd("CodeiumEnable")
				codeium_enabled = true
				show_status_popup("Codeium activé")
			end
		end

		function show_status_popup(msg)
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, { msg })

			local width = #msg + 4
			local height = 1
			local win_opts = {
				relative = "editor",
				width = width,
				height = height,
				row = 2,
				col = vim.o.columns - width - 4,
				style = "minimal",
				border = "rounded",
			}

			local win = vim.api.nvim_open_win(buf, false, win_opts)

			-- Auto close after 1 second
			vim.defer_fn(function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
			end, 1000)
		end

		-- Keymap NORMAL mode: toggle Codeium and show feedback
		vim.keymap.set("n", "<C-x>", toggle_codeium, { noremap = true, silent = true })
	end,
}
