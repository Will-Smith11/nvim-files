vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", function() vim.cmd("FloatermToggle") end)
vim.keymap.set("n", "<leader>pv", function() vim.cmd("NvimTreeToggle") end)

-- remap copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("v", "<leader>q", "\"+p")
vim.keymap.set("n", "<leader>q", "\"+p")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
        spacing = 4,
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(namespace, bufnr)
        return vim.b[bufnr].show_signs == true
    end,
    -- Disable a feature
    update_in_insert = false,
}
)
