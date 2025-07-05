-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------
keymap.set(
	"n",
	"<leader>td",
	require("alexis.extra.toggle_diagnostics").toggle_diagnostics,
	{ desc = "Toggle Diagnostics" }
)
-- Nouvelle Keymaps --
keymap.set("n", "ù", "o<Esc>", { desc = "Ajouter une ligne sans rentrer en mode insert" })
keymap.set("n", "=", "O<Esc>", { desc = "Ajouter une ligne sans rentrer en mode insert" })
keymap.set("n", "à", "0", { desc = "Aller au debut de la ligne" })
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
--keymap.set("n", "dd", '"_d', { noremap = true, silent = true })
--keymap.set("v", "d", '"_d', { noremap = true, silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>_", "<C-x>", { desc = "Decrement number" }) -- decrement -- Attention j'ai mis _ et pas -

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--chat gpt-- LanguageTool : pour avoir des recomodations de correction de francais
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "(d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", ")d", vim.diagnostic.goto_next, { noremap = true, silent = true })

-- New --
-- esthetisme
vim.keymap.set("n", "<leader>ut", function()
	require("alexis.esthetisme.ui").select_theme()
end, { desc = "Changer de thème" })

-- bufferline
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

map("n", "<leader>c", "<cmd>bdelete<CR>", opts) -- fermer le buffer courant
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", opts)
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", opts)
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", opts)
map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", opts)
