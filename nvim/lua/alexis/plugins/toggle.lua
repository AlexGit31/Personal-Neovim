return {
  "nguyenvukhang/nvim-toggler",

  config = function()
    require("nvim-toggler").setup({
      -- Ajout de toggles personnalisés
      inverses = {
        ["true"] = "false",
        ["yes"] = "no",
        ["on"] = "off",
        ["enabled"] = "disabled",
        ["visible"] = "hidden",
      },
    })

    -- Raccourci clavier pour toggler un mot sous le curseur
    vim.keymap.set("n", "<leader>;", require("nvim-toggler").toggle, { desc = "Toggle small units" })
  end,
}
