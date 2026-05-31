-- Buffer-local mappings for Python files.

vim.keymap.set("n", "<F2>", ":w | !python3 %<CR>", { buffer = true })
