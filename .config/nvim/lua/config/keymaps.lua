vim.keymap.set('n', '<Space>', '<Nop>')

-- Open a terminal
vim.keymap.set('n', '<leader>t', function()
        vim.cmd("split | term")
end
)

--  a terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<leader>n', function()
      vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false }) 

      vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
      return true
    end,
  })
end)


vim.keymap.set('n', '<leader>b', ":CMakeBuild<CR>", { desc = "building the project"})
vim.keymap.set('n', '<leader>r', function()
        local main_directory = vim.fn.getcwd()
        local all_directory = {main_directory, string.format("%s/src", main_directory)}
        local all_extension = {".py", ".c", ".rs"}
        for _, ext in ipairs(all_extension) do
                for _, dir in ipairs(all_directory) do
                        local obj = vim.system({ vim.o.shell, vim.o.shellcmdflag, "ls "..dir.." | grep main"..ext}, {text = true}, on_exit):wait()
                        if string.find(obj.stdout, ".py") ~= nil then
                                vim.cmd("split | terminal python main.py")
                        elseif string.find(obj.stdout, ".c") ~= nil then
                                vim.cmd("CMakeRun")
                        elseif string.find(obj.stdout, ".rs") ~= nil then
                                vim.cmd("split | terminal cargo run")
                        end
                end
        end
end)

vim.keymap.set('n', '<leader>c', ":q<CR>", { desc = "quitting the current page"})
