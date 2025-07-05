--print(vim.fn.system("which python3"))
--print(vim.fn.system("which pylint"))

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Définir le linter eslint_d pour les autres langages, mais le désactiver pour JavaScript
    local eslint_d = {
      cmd = "eslint_d",
      args = {
        "--config",
        vim.fn.expand("~/.eslintrc.json"),
        "--format",
        "json",
        "--stdin",
        "--stdin-filename",
        "$FILENAME",
      },
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").eslint,
    }

    -- Désactivation du linter pour javascript
    lint.linters_by_ft = {
      javascript = {}, -- Pas de linter pour JavaScript
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    -- Linter Python spécifié
    require("lint").linters.pylint.cmd = "/Users/alexisevaristo/env3.13/bin/pylint"

    -- Auto-exécution du lint pour les fichiers non JavaScript
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Raccourci pour lancer manuellement le linting
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
