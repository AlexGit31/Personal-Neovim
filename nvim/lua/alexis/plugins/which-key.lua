return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.setup({
        icons = { group = "" },
        win = { border = "rounded" }, -- ✅ Correction du champ `window` --> `win`
        layout = { align = "center" },
      })

      -- 🔥 Keymap rapide pour afficher toutes les keymaps 🔥
      vim.keymap.set("n", "<leader>k", ":WhichKey<CR>", { desc = "Show all keymaps" })

      -- 🔎 Commande personnalisée pour afficher toutes les keymaps
      vim.api.nvim_create_user_command("Keymaps", function()
        vim.cmd("WhichKey")
      end, {})
    end,
  },
  {
    "mrjones2014/legendary.nvim",
    dependencies = {
      "stevearc/dressing.nvim", -- Améliore l'interface utilisateur
      "folke/which-key.nvim", -- Intégration complète avec which-key
    },
    priority = 1, -- ✅ Priorité minimale pour Legendary
    config = function()
      local legendary = require("legendary")

      legendary.setup({
        include_builtin = true, -- 🔥 Inclure les commandes natives de Vim
        include_legendary_cmds = true, -- 🔥 Inclure les commandes Legendary
        auto_register_which_key = true, -- 🔥 Synchronise automatiquement avec which-key
        extensions = {
          lazy_nvim = true, -- 🔥 Intègre les keymaps définies dans Lazy.nvim
          diffview = false, -- 🔥 Intègre les keymaps de Diffview
          gitsigns = false, -- 🔥 Intègre les keymaps de Gitsigns
        },
      })

      -- 🔎 Keymap rapide pour afficher les commandes enregistrées dans Legendary
      vim.keymap.set("n", "<leader>lk", ":Legendary<CR>", { desc = "Show all legendary mappings" })

      vim.api.nvim_create_user_command("CheckKeymaps", function()
        local keymaps = require("legendary.config").mappings
        print(vim.inspect(keymaps))
      end, {})
    end,
  },
}
-- return {
--   "folke/which-key.nvim",
--   config = function()
--     local wk = require("which-key")
--
--     wk.setup({
--       icons = { group = "" },
--       win = { border = "rounded" }, -- ✅ Correction du champ `window` --> `win`
--       layout = { align = "center" },
--     })
--
--     -- 🔥 Keymap rapide pour afficher toutes les keymaps 🔥
--     vim.keymap.set("n", "<leader>wk", ":WhichKey<CR>", { desc = "Show all keymaps" })
--
--     -- 🔎 Commande personnalisée pour afficher toutes les keymaps
--     vim.api.nvim_create_user_command("Keymaps", function()
--       vim.cmd("WhichKey")
--     end, {})
--   end,
-- }
