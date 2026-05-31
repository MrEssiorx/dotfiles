-- Buffer-local mappings for C++ files.

vim.keymap.set("n", "<F1>", ":w | !g++ -std=c++20 % -o %:r && echo Compiled<CR>", { buffer = true })
vim.keymap.set("n", "<F2>", ":!./%:r<CR>", { buffer = true })
