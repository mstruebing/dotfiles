vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", ":Files<CR>")
vim.keymap.set("n", "<leader>b", ":Buffers<CR>")
vim.keymap.set("n", "<leader>ag", ":Ag ")
vim.keymap.set("n", "<leader>'", ":Marks<CR>")

vim.keymap.set("n", "<leader>h", ":set invhlsearch<CR>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set('n', "Q", "@@")

vim.keymap.set('n', "<C-t>", ":NERDTreeToggle<CR>")

vim.keymap.set('n', '<leader>gs', ":Git<CR>")
vim.keymap.set('n', '<leader>gb', ":Git blame<CR>")

-- vimux \o/
vim.keymap.set("n", "<leader>-", ":w<CR>:VimuxPromptCommand<CR>")
vim.keymap.set("n", "<leader>=", ":w<CR>:VimuxRunLastCommand<CR>")

vim.keymap.set("n", "<leader>o", ":tabnew ~/projects/own/log/notes.md<CR>")
