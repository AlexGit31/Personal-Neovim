return {
	"jbyuki/venn.nvim",
	config = function()
		function _G.Toggle_venn()
			local venn_enabled = vim.inspect(vim.b.venn_enabled)

			if venn_enabled == "nil" then
				vim.b.venn_enabled = true

				-- Sauvegarde des options actuelles
				vim.b.venn_saved_options = {
					colorcolumn = vim.opt.colorcolumn:get(),
					cursorline = vim.opt.cursorline:get(),
					cursorcolumn = vim.opt.cursorcolumn:get(),
					indent_blankline_enabled = vim.g.indent_blankline_enabled,
				}

				-- Réglages visuels pour le dessin
				vim.cmd([[setlocal ve=all]])
				vim.opt.colorcolumn = ""
				vim.opt.cursorline = true
				vim.opt.cursorcolumn = true

				-- Désactive indent-blankline proprement
				vim.g.indent_blankline_enabled = false
				pcall(vim.cmd, "IBLDisable") -- fonctionne si ibl est bien installé

				-- Keymaps directionnels
				vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
				vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
				vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
				vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
				vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })

				print("✏️ Venn drawing mode: ON")
			else
				-- Restaure les options visuelles
				local opts = vim.b.venn_saved_options or {}
				vim.opt.colorcolumn = opts.colorcolumn or ""
				vim.opt.cursorline = opts.cursorline or false
				vim.opt.cursorcolumn = opts.cursorcolumn or false

				-- Réactive indent-blankline
				vim.g.indent_blankline_enabled = opts.indent_blankline_enabled ~= false
				pcall(vim.cmd, "IBLEnable")

				-- Supprime les keymaps
				vim.api.nvim_buf_del_keymap(0, "n", "J")
				vim.api.nvim_buf_del_keymap(0, "n", "K")
				vim.api.nvim_buf_del_keymap(0, "n", "L")
				vim.api.nvim_buf_del_keymap(0, "n", "H")
				vim.api.nvim_buf_del_keymap(0, "v", "f")

				vim.b.venn_enabled = nil
				vim.b.venn_saved_options = nil

				print("❌ Venn drawing mode: OFF")
			end
		end

		vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true, silent = true })
	end,
}
