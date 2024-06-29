require("config.opts")
require("config.maps")

vim.cmd.colorscheme("delek")

-- " j/k for multilines
-- noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
-- noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*"},
    callback = function() 
        vim.opt.spell = false
     end,
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.md"},
    callback = function() 
        vim.opt.spell = true
     end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.ts", "*.tsx" },
    desc = "Auto-format ts files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !./node_modules/.bin/prettier --write" .. fileName)
    end,
})



-- let g:vim_printer_items = {
--       \ 'typescriptreact': 'console.log("{$}:", {$})',
--       \ 'elixir': 'IO.puts("{$}: {$}")',
--       \ }

-- command! Date :r!date "+\%F"
