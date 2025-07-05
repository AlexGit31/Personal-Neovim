-- return {
--   "iamcco/markdown-preview.nvim",
--   build = "cd app && npm install",
--   ft = { "markdown" },
--   config = function()
--     vim.g.mkdp_auto_start = 0 -- Démarrage manuel
--     vim.g.mkdp_browser = "safari" -- Remplace par ton navigateur préféré
--
--     -- Définir des raccourcis
--     vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Lancer MarkdownPreview" })
--     vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Arrêter MarkdownPreview" })
--     vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", { desc = "Basculer MarkdownPreview" })
--   end,
-- }
return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = { "markdown" },
  config = function()
    vim.g.mkdp_auto_start = 0 -- Démarrage manuel
    vim.g.mkdp_browser = "safari" -- Remplace par ton navigateur préféré

    -- Définir des raccourcis compatibles avec legendary.nvim
    require("legendary").setup({
      keymaps = {
        { "<leader>mp", ":MarkdownPreview<CR>", description = "Lancer MarkdownPreview", mode = "n" },
        { "<leader>ms", ":MarkdownPreviewStop<CR>", description = "Arrêter MarkdownPreview", mode = "n" },
        { "<leader>mt", ":MarkdownPreviewToggle<CR>", description = "Basculer MarkdownPreview", mode = "n" },
      },
    })
  end,
}
